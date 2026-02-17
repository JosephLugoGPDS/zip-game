import 'dart:async';
import 'package:app/core/bloc/result_state.dart';
import 'package:app/puzzle/data/model/level_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart'; // para compute
import 'package:injectable/injectable.dart';

@injectable
class LevelGeneratorCubit extends Cubit<ResultState<Level>> {
  LevelGeneratorCubit() : super(const Initial());

  Future<void> generateLevel({
    required int rows,
    required int cols,
    required int numbers,
  }) async {
    emit(const Loading());

    try {
      // Ejecuta Level.generate en otro isolate
      final level = await compute(
        _generateLevelIsolate,
        (rows, cols, numbers),
      );
      emit(Data(data: level));
    } catch (failure) {
      emit(Error(error: failure.toString()));
    }
  }
}

// Función para isolate
Level _generateLevelIsolate((int, int, int) params) {
  final (rows, cols, numbers) = params;
  final level = Level.generateFast(
    rows: rows,
    cols: cols,
    numbers: numbers,
    maxAttempts: 10, // límite bajo para evitar tardanza
  );
  level.debugDumpLevel();
  level.debugDumpLevelAsConst('1');
  return level;
}
