// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i5;
import 'package:dio/dio.dart' as _i3;
import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:flutter_belgium/di/injectable.dart' as _i15;
import 'package:flutter_belgium/navigation/main_navigator.dart' as _i7;
import 'package:flutter_belgium/repo/login_repo.dart' as _i6;
import 'package:flutter_belgium/repo/raffle_repo.dart' as _i9;
import 'package:flutter_belgium/viewmodel/global_viewmodel.dart' as _i13;
import 'package:flutter_belgium/viewmodel/login_viewmodel.dart' as _i14;
import 'package:flutter_belgium/viewmodel/qr_scanner_viewmodel.dart' as _i8;
import 'package:flutter_belgium/viewmodel/raffle_viewmodel.dart' as _i10;
import 'package:flutter_belgium/viewmodel/raffle_winner_picker_viewmodel.dart'
    as _i11;
import 'package:flutter_belgium/viewmodel/splash_viewmodel.dart' as _i12;
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
    gh.lazySingleton<_i4.FirebaseAuth>(
        () => registerModule.provideFirebaseAuth());
    gh.lazySingleton<_i5.FirebaseFirestore>(
        () => registerModule.provideFirebaseFirestore());
    gh.lazySingleton<_i6.LoginRepository>(
        () => _i6.LoginRepository(gh<_i4.FirebaseAuth>()));
    gh.lazySingleton<_i7.MainNavigator>(() => _i7.MainNavigator());
    gh.factory<_i8.QrScannerViewModel>(() => _i8.QrScannerViewModel());
    gh.lazySingleton<_i9.RaffleRepository>(() => _i9.RaffleRepository(
          gh<_i6.LoginRepository>(),
          gh<_i5.FirebaseFirestore>(),
        ));
    gh.factory<_i10.RaffleViewModel>(() => _i10.RaffleViewModel(
          gh<_i6.LoginRepository>(),
          gh<_i9.RaffleRepository>(),
          gh<_i7.MainNavigator>(),
        ));
    gh.factory<_i11.RaffleWinnerPickerViewModel>(
        () => _i11.RaffleWinnerPickerViewModel(gh<_i9.RaffleRepository>()));
    gh.factory<_i12.SplashViewModel>(() => _i12.SplashViewModel(
          gh<_i6.LoginRepository>(),
          gh<_i7.MainNavigator>(),
        ));
    gh.factory<_i13.GlobalViewmodel>(
        () => _i13.GlobalViewmodel(gh<_i7.MainNavigator>()));
    gh.factory<_i14.LoginViewModel>(() => _i14.LoginViewModel(
          gh<_i6.LoginRepository>(),
          gh<_i7.MainNavigator>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i15.RegisterModule {}
