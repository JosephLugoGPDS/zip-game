import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class TimerCubit extends Cubit<String> {
  TimerCubit() : super("00:00");

  Timer? _timer;
  int _secondsElapsed = 0;

  /// Inicia o reanuda el temporizador
  void start() {
    _timer ??= Timer.periodic(const Duration(seconds: 1), (_) {
      _secondsElapsed++;
      emit(_formatTime(_secondsElapsed));
    });
  }

  /// Pausa el temporizador
  void pause() {
    _timer?.cancel();
    _timer = null;
  }

  /// Reinicia el temporizador y lo detiene
  void reset() {
    pause();
    _secondsElapsed = 0;
    emit("00:00");
  }

  /// Convierte segundos en formato mm:ss
  String _formatTime(int totalSeconds) {
    final minutes = totalSeconds ~/ 60;
    final seconds = totalSeconds % 60;
    return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }

  @override
  Future<void> close() {
    pause();
    return super.close();
  }
}
