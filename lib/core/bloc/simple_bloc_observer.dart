import 'package:app/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

class SimpleBlocObserver extends BlocObserver {
  final _logger = getIt<Logger>();

  @override
  void onCreate(BlocBase bloc) {
    _logger.i('🔵 [CREATE] ${bloc.runtimeType}');
    super.onCreate(bloc);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    _logger.d('📩 [EVENT] ${bloc.runtimeType} → $event');
    super.onEvent(bloc, event);
  }

  // @override
  // void onChange(BlocBase bloc, Change change) {
  //   _logger.v('🔄 [CHANGE] ${bloc.runtimeType} → $change');
  //   super.onChange(bloc, change);
  // }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    _logger.d('🚀 [TRANSITION] ${bloc.runtimeType} → $transition');
    super.onTransition(bloc, transition);
  }

  @override
  void onClose(BlocBase bloc) {
    _logger.w('🔴 [CLOSE] ${bloc.runtimeType}');
    super.onClose(bloc);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    getIt<Logger>().t('${bloc.runtimeType} $error');
    super.onError(bloc, error, stackTrace);
  }
}
