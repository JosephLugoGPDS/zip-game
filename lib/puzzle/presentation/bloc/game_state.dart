import 'package:app/core/bloc/result_state.dart';
import 'package:app/puzzle/data/model/level_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_state.freezed.dart';

enum GameStatus { idle, drawing, wrong, completed }

@freezed
class GameState with _$GameState {
  const GameState._();

  factory GameState({
    @Default(Initial()) ResultState<bool> gameActive,
    @Default(Initial()) ResultState<bool> gameCompleted,
    @Default(GameStatus.idle) GameStatus gameStatus,
    Level? level,
    @Default(false) bool startPlaying,
    //Current path
    @Default([]) List<OffsetInt> permanentPath,
    @Default([]) List<List<OffsetInt>> history,
    // Cuando el usuario dibuja:
    @Default([]) List<OffsetInt> currentDraw,
    // Solución como mapa cell->index en path
    @Default({}) Map<OffsetInt, int> solutionIndex,
    // número actual a conectar (se empieza en 1)
    @Default(1) int currentNumber,
  }) = _GameState;
}
