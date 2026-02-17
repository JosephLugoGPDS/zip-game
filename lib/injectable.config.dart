// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:fluro/fluro.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i6;
import 'package:shared_preferences/shared_preferences.dart' as _i8;

import 'core/di/app_module.dart' as _i12;
import 'core/di/logger_module.dart' as _i11;
import 'core/di/route_module.dart' as _i10;
import 'core/navigation/route.dart' as _i7;
import 'puzzle/presentation/bloc/game_cubit.dart' as _i4;
import 'puzzle/presentation/bloc/level_generator_cubit.dart' as _i5;
import 'puzzle/presentation/bloc/timer_cubit.dart' as _i9;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final routeModule = _$RouteModule();
    final loggerModule = _$LoggerModule();
    final appModule = _$AppModule();
    gh.lazySingleton<_i3.FluroRouter>(() => routeModule.fluroRouter);
    gh.factory<_i4.GameCubit>(() => _i4.GameCubit());
    gh.factory<_i5.LevelGeneratorCubit>(() => _i5.LevelGeneratorCubit());
    gh.lazySingleton<_i6.Logger>(() => loggerModule.logger);
    gh.factory<_i7.Routes>(() => _i7.Routes(gh<_i3.FluroRouter>()));
    await gh.factoryAsync<_i8.SharedPreferences>(
      () => appModule.sharePreferences,
      preResolve: true,
    );
    gh.factory<_i9.TimerCubit>(() => _i9.TimerCubit());
    return this;
  }
}

class _$RouteModule extends _i10.RouteModule {}

class _$LoggerModule extends _i11.LoggerModule {}

class _$AppModule extends _i12.AppModule {}
