import 'dart:math';

import 'package:app/core/bloc/result_state.dart';
import 'package:app/puzzle/data/model/level_model.dart';
import 'package:app/puzzle/presentation/bloc/game_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GameCubit extends Cubit<GameState> {
  GameCubit() : super(GameState());

  // 🔹 Detecta si la celda está en permanentPath y recorta
  ({List<OffsetInt> path, int? currentNumber}) _trimPermanentPathTo(
      OffsetInt cell) {
    var permanentPathAux = state.permanentPath;
    int? currentNumberAux = state.currentNumber;

    final idx = permanentPathAux.indexOf(cell);
    if (idx != -1) {
      permanentPathAux = permanentPathAux.sublist(0, idx + 1);

      if (state.solutionIndex.containsKey(cell) && state.level != null) {
        final pathIdx = state.solutionIndex[cell]!;
        currentNumberAux = state.level!.numberPositions.entries
            .firstWhere(
              (e) => state.solutionIndex[e.value] == pathIdx,
              orElse: () => MapEntry(1, cell),
            )
            .key;
      }
    }

    return (path: permanentPathAux, currentNumber: currentNumberAux);
  }

  void loadLevel(Level level) {
    emit(state.copyWith(gameActive: const Loading()));
    // final level = Level.generate(rows: 6, cols: 6, numbers: 10);
    final solutionIndex = {
      for (int i = 0; i < level.solutionPath.length; i++)
        level.solutionPath[i]: i
    };
    emit(state.copyWith(
      solutionIndex: solutionIndex,
      currentDraw: [],
      currentNumber: 1,
      permanentPath: [],
      history: [],
      level: level,
      gameActive: const Data(data: true),
      gameCompleted: const Initial(),
    ));
  }

  void resetGame() {
    emit(state.copyWith(gameActive: const Initial()));
  }

  void startDraw(OffsetInt cell) {
    if (state.gameActive is! Data) {
      //TODO: level
    }

    // Si clickea un punto del permanentPath, recortar y empezar desde ahí
    if (state.permanentPath.contains(cell)) {
      final trimmed = _trimPermanentPathTo(cell);
      return emit(state.copyWith(
        permanentPath: trimmed.path,
        currentNumber: trimmed.currentNumber ?? 1,
        gameStatus: GameStatus.drawing,
        currentDraw: [cell],
      ));
    }

    // Si es el número actual, iniciar trazo
    final pos = state.level?.numberPositions[state.currentNumber];
    if (pos != null && pos == cell) {
      return emit(state.copyWith(
        currentDraw: [cell],
        gameStatus: GameStatus.drawing,
      ));
    }
  }

  void moveDraw(OffsetInt cell) {
    // Solo permite dibujar si el estado es "drawing" o si aún no hay trazo
    if (state.gameStatus != GameStatus.drawing && state.currentDraw.isEmpty) {
      return;
    }

    // Si ya hay celdas en el trazo actual, valida que la nueva celda sea adyacente
    if (state.currentDraw.isNotEmpty) {
      final last = state.currentDraw.last;
      if (!last.adjacent(state.level!.rows, state.level!.cols).contains(cell)) {
        return;
      }
    }

    // Evitar repetir dentro del trazo actual
    if (state.currentDraw.contains(cell)) {
      return;
    }

    // Evitar pisar el camino permanente
    if (state.permanentPath.contains(cell)) {
      return;
    }

    // Agregar la celda al trazo actual
    emit(state.copyWith(
      currentDraw: [...state.currentDraw, cell],
    ));

    // Validar si sigue la solución
    final last = state.currentDraw.length > 1
        ? state.currentDraw[state.currentDraw.length - 2]
        : null;
    if (last != null) {
      final idxLast = state.solutionIndex[last];
      final idxCell = state.solutionIndex[cell];
      if (idxLast == null ||
          idxCell == null ||
          (idxCell - idxLast).abs() != 1) {
        // no sigue la solución
        emit(state.copyWith(gameStatus: GameStatus.wrong));
        return; // Salimos para no marcar como drawing
      }
    }

    // Notificar cambio de estado si todo está bien
    emit(state.copyWith(gameStatus: GameStatus.drawing));
  }

  void endDraw() {
    final s = state;

    if (s.currentDraw.isEmpty) return;

    final segment = List<OffsetInt>.from(s.currentDraw);

    // Construir nuevo permanentPath
    List<OffsetInt> newPermanentPath;
    if (s.permanentPath.isNotEmpty &&
        s.permanentPath.last == s.currentDraw.first) {
      newPermanentPath = [...s.permanentPath, ...s.currentDraw.skip(1)];
    } else {
      newPermanentPath = [...s.permanentPath, ...s.currentDraw];
    }

    // Guardar en historial
    final newHistory = [...s.history, segment];

    int newCurrentNumber = s.currentNumber;
    final nextNumberPos = s.level?.numberPositions[s.currentNumber + 1];

    if (nextNumberPos != null && s.currentDraw.last == nextNumberPos) {
      final startIdx = s.solutionIndex[s.currentDraw.first]!;
      final endIdx = s.solutionIndex[s.currentDraw.last]!;
      final expectedSegment = s.level!.solutionPath.sublist(
        min(startIdx, endIdx),
        max(startIdx, endIdx) + 1,
      );
      final sameLength = expectedSegment.length == s.currentDraw.length;
      bool sameElements = false;
      if (sameLength) {
        sameElements = true;
        for (int i = 0; i < expectedSegment.length; i++) {
          if (expectedSegment[i] != s.currentDraw[i]) {
            sameElements = false;
            break;
          }
        }
      }
      if (sameLength && sameElements) {
        newCurrentNumber++;
      }
    }

    final newCurrentDraw = <OffsetInt>[];

    final newGameStatus =
        (newCurrentNumber >= (s.level?.numberPositions.length ?? 0))
            ? GameStatus.completed
            : GameStatus.idle;

    emit(
      s.copyWith(
        permanentPath: newPermanentPath,
        history: newHistory,
        currentDraw: newCurrentDraw,
        currentNumber: newCurrentNumber,
        gameStatus: newGameStatus,
        gameCompleted: newGameStatus == GameStatus.completed
            ? const Data(data: true)
            : const Initial(),
      ),
    );
  }

  void undo() {
    if (state.history.isEmpty) return;

    final ultimoSegmento = state.history.last;

    final numeroPos = state.level!.numberPositions[state.currentNumber - 1];

    // Calculamos los rangos a remover
    final removeFrom = state.permanentPath.length - ultimoSegmento.length;
    final removeTo = state.permanentPath.length;

    List<OffsetInt> newPermanentPath = List.from(state.permanentPath);
    List<List<OffsetInt>> newHistory = List.from(state.history);

    if (ultimoSegmento.contains(numeroPos)) {
      // Quitamos todo menos la casilla del número
      final toRemove = ultimoSegmento.where((c) => c != numeroPos).toList();
      newPermanentPath.removeWhere((cell) => toRemove.contains(cell));
      // Bajamos el número actual, pero no menos de 1
      emit(state.copyWith(
        permanentPath: newPermanentPath,
        currentNumber: max(1, state.currentNumber - 1),
        history: newHistory..removeLast(),
      ));
    } else {
      newPermanentPath.removeRange(removeFrom, removeTo);
      emit(state.copyWith(
        permanentPath: newPermanentPath,
        history: newHistory..removeLast(),
      ));
    }
  }
}
