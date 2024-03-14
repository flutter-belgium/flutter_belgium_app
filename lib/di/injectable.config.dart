// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i5;
import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:flutter_belgium/di/injectable.dart' as _i21;
import 'package:flutter_belgium/navigator/main_navigator.dart' as _i9;
import 'package:flutter_belgium/repo/locale/locale_repository.dart' as _i7;
import 'package:flutter_belgium/repo/login/login_repo.dart' as _i8;
import 'package:flutter_belgium/repo/raffle/raffle_repo.dart' as _i11;
import 'package:flutter_belgium/viewmodel/debug/debug_change_language_viewmodel.dart' as _i16;
import 'package:flutter_belgium/viewmodel/debug/debug_change_target_platform_viewmodel.dart' as _i17;
import 'package:flutter_belgium/viewmodel/debug/debug_viewmodel.dart' as _i18;
import 'package:flutter_belgium/viewmodel/global/global_viewmodel.dart' as _i6;
import 'package:flutter_belgium/viewmodel/global/translations_viewmodel.dart' as _i15;
import 'package:flutter_belgium/viewmodel/home/home_viewmodel.dart' as _i19;
import 'package:flutter_belgium/viewmodel/login/login_viewmodel.dart' as _i20;
import 'package:flutter_belgium/viewmodel/qr_scanner/qr_scanner_viewmodel.dart' as _i10;
import 'package:flutter_belgium/viewmodel/raffle/raffle_viewmodel.dart' as _i12;
import 'package:flutter_belgium/viewmodel/raffle/raffle_winner_picker_viewmodel.dart' as _i13;
import 'package:flutter_belgium/viewmodel/splash/splash_viewmodel.dart' as _i14;
import 'package:get_it/get_it.dart' as _i1;
import 'package:impaktfull_architecture/impaktfull_architecture.dart' as _i3;
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
    gh.lazySingleton<_i4.FirebaseAuth>(() => registerModule.provideFirebaseAuth());
    gh.lazySingleton<_i5.FirebaseFirestore>(() => registerModule.provideFirebaseFirestore());
    gh.lazySingleton<_i6.GlobalViewModel>(() => _i6.GlobalViewModel());
    gh.lazySingleton<_i7.LocaleRepository>(() => _i7.LocaleRepository(gh<_i3.SharedPrefsStore>()));
    gh.lazySingleton<_i8.LoginRepository>(() => _i8.LoginRepository(gh<_i4.FirebaseAuth>()));
    gh.lazySingleton<_i9.MainNavigator>(() => _i9.MainNavigator());
    gh.factory<_i10.QrScannerViewModel>(() => _i10.QrScannerViewModel());
    gh.lazySingleton<_i11.RaffleRepository>(() => _i11.RaffleRepository(
          gh<_i8.LoginRepository>(),
          gh<_i5.FirebaseFirestore>(),
        ));
    gh.factory<_i12.RaffleViewModel>(() => _i12.RaffleViewModel(
          gh<_i8.LoginRepository>(),
          gh<_i11.RaffleRepository>(),
          gh<_i9.MainNavigator>(),
        ));
    gh.factory<_i13.RaffleWinnerPickerViewModel>(() => _i13.RaffleWinnerPickerViewModel(
          gh<_i11.RaffleRepository>(),
          gh<_i9.MainNavigator>(),
        ));
    gh.factory<_i14.SplashViewModel>(() => _i14.SplashViewModel(
          gh<_i8.LoginRepository>(),
          gh<_i9.MainNavigator>(),
        ));
    gh.lazySingleton<_i15.TranslationsViewmodel>(() => _i15.TranslationsViewmodel(gh<_i7.LocaleRepository>()));
    gh.factory<_i16.DebugChangeLanguageViewModel>(() => _i16.DebugChangeLanguageViewModel(
          gh<_i15.TranslationsViewmodel>(),
          gh<_i9.MainNavigator>(),
        ));
    gh.factory<_i17.DebugChangeTargetPlatformViewModel>(() => _i17.DebugChangeTargetPlatformViewModel(
          gh<_i6.GlobalViewModel>(),
          gh<_i9.MainNavigator>(),
        ));
    gh.factory<_i18.DebugViewModel>(() => _i18.DebugViewModel(
          gh<_i6.GlobalViewModel>(),
          gh<_i15.TranslationsViewmodel>(),
          gh<_i9.MainNavigator>(),
        ));
    gh.factory<_i19.HomeViewmodel>(() => _i19.HomeViewmodel(gh<_i9.MainNavigator>()));
    gh.factory<_i20.LoginViewModel>(() => _i20.LoginViewModel(
          gh<_i8.LoginRepository>(),
          gh<_i9.MainNavigator>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i21.RegisterModule {}
