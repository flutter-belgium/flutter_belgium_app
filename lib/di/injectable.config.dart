// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:flutter_belgium/di/injectable.dart' as _i9;
import 'package:flutter_belgium/navigation/main_navigator.dart' as _i5;
import 'package:flutter_belgium/repo/login_repo.dart' as _i4;
import 'package:flutter_belgium/viewmodel/global_viewmodel.dart' as _i6;
import 'package:flutter_belgium/viewmodel/home_viewmodel.dart' as _i7;
import 'package:flutter_belgium/viewmodel/login_viewmodel.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt initGetIt({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i3.Dio>(() => registerModule.provideDio());
    gh.lazySingleton<_i4.LoginRepository>(() => _i4.LoginRepository());
    gh.lazySingleton<_i5.MainNavigator>(() => _i5.MainNavigator());
    gh.factory<_i6.GlobalViewmodel>(
        () => _i6.GlobalViewmodel(gh<_i5.MainNavigator>()));
    gh.factory<_i7.HomeViewModel>(() => _i7.HomeViewModel(
          gh<_i4.LoginRepository>(),
          gh<_i5.MainNavigator>(),
        ));
    gh.factory<_i8.LoginViewModel>(() => _i8.LoginViewModel(
          gh<_i4.LoginRepository>(),
          gh<_i5.MainNavigator>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i9.RegisterModule {}
