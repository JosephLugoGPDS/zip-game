import 'package:app/puzzle/presentation/bloc/game_cubit.dart';
import 'package:app/puzzle/presentation/bloc/level_generator_cubit.dart';
import 'package:app/puzzle/presentation/bloc/timer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:app/core/navigation/route.dart';
import 'package:app/core/style/style.dart';
import 'package:app/injectable.dart';

class App extends StatelessWidget {
  final Widget? homeScreen;

  App({super.key, this.homeScreen, bool isTestApp = false}) {
    if (!isTestApp) {
      getIt<Routes>().configureRoutes();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<LevelGeneratorCubit>()),
        BlocProvider(create: (_) => getIt<GameCubit>()),
        BlocProvider(create: (_) => getIt<TimerCubit>()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 720),
        builder: (context, child) => MaterialApp(
          locale: const Locale('es', 'PE'),
          debugShowCheckedModeBanner: false,
          supportedLocales: const [Locale('es', 'PE')],
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          theme: lightTheme,
          onGenerateRoute: getIt<Routes>().router.generator,
          navigatorKey: Routes.navigatorKey,
        ),
      ),
    );
  }
}
