import 'package:app/puzzle/presentation/view/game_quiz_screen.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class Routes {
  final FluroRouter router;
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  Routes(this.router);

  String get root => '/';
  String get splash => '/splash';
  String get main => '/main';
  String get dashboard => '/dashboard';

  static final Handler _mainHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          const GameQuizScreen());
  // static final Handler _mainHandler = Handler(
  //     handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
  //         const PuzzlePrototype());

  void configureRoutes() {
    // router.define(root, handler: _splashHandler);
    router.define(root, handler: _mainHandler);
  }
}
