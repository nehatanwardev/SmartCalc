// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:calculator/bloc/calculator_bloc/calculator_bloc.dart' as _i643;
import 'package:calculator/bloc/history_bloc/history_bloc.dart' as _i834;
import 'package:calculator/bloc/page_cubit/page_cubit.dart' as _i254;
import 'package:calculator/bloc/preference_cubit/preference_cubit.dart'
    as _i995;
import 'package:calculator/di/module.dart' as _i609;
import 'package:calculator/repo/database.dart' as _i454;
import 'package:calculator/service/preference_service.dart' as _i123;
import 'package:calculator/service/theme_service.dart' as _i913;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.prefs(),
      preResolve: true,
    );
    gh.factory<_i643.CalculatorBloc>(() => _i643.CalculatorBloc());
    gh.factory<_i254.PageCubit>(() => _i254.PageCubit());
    gh.singleton<_i123.PreferencesService>(
        () => _i123.PreferencesService(gh<_i460.SharedPreferences>())..init());
    gh.singleton<_i454.Database>(
        () => _i454.Database(gh<_i460.SharedPreferences>()));
    gh.singleton<_i913.ThemeService>(() => _i913.ThemeService(
          gh<_i460.SharedPreferences>(),
          gh<_i123.PreferencesService>(),
        )..init());
    gh.factory<_i834.HistoryBloc>(
        () => _i834.HistoryBloc(gh<_i454.Database>()));
    gh.factory<_i995.PreferenceCubit>(() => _i995.PreferenceCubit(
          gh<_i123.PreferencesService>(),
          gh<_i913.ThemeService>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i609.RegisterModule {}
