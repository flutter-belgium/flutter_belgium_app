// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i5;
import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:flutter_belgium/di/injectable.dart' as _i26;
import 'package:flutter_belgium/navigator/main_navigator.dart' as _i10;
import 'package:flutter_belgium/repo/event/event_repostitory.dart' as _i21;
import 'package:flutter_belgium/repo/locale/locale_repository.dart' as _i8;
import 'package:flutter_belgium/repo/login/login_repo.dart' as _i9;
import 'package:flutter_belgium/repo/raffle/raffle_repo.dart' as _i11;
import 'package:flutter_belgium/repo/talk/talk_repostitory.dart' as _i24;
import 'package:flutter_belgium/service/airtable_service.dart' as _i17;
import 'package:flutter_belgium/viewmodel/debug/debug_change_language_viewmodel.dart'
    as _i18;
import 'package:flutter_belgium/viewmodel/debug/debug_change_target_platform_viewmodel.dart'
    as _i19;
import 'package:flutter_belgium/viewmodel/debug/debug_viewmodel.dart' as _i20;
import 'package:flutter_belgium/viewmodel/event/events_viewmodel.dart' as _i22;
import 'package:flutter_belgium/viewmodel/global/global_viewmodel.dart' as _i6;
import 'package:flutter_belgium/viewmodel/global/translations_viewmodel.dart'
    as _i16;
import 'package:flutter_belgium/viewmodel/home/home_viewmodel.dart' as _i7;
import 'package:flutter_belgium/viewmodel/login/login_viewmodel.dart' as _i23;
import 'package:flutter_belgium/viewmodel/raffle/raffle_viewmodel.dart' as _i12;
import 'package:flutter_belgium/viewmodel/raffle/raffle_winner_picker_viewmodel.dart'
    as _i13;
import 'package:flutter_belgium/viewmodel/settings/settings_viewmodel.dart'
    as _i14;
import 'package:flutter_belgium/viewmodel/splash/splash_viewmodel.dart' as _i15;
import 'package:flutter_belgium/viewmodel/talk/talks_viewmodel.dart' as _i25;
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
    gh.lazySingleton<_i4.FirebaseAuth>(
        () => registerModule.provideFirebaseAuth());
    gh.lazySingleton<_i5.FirebaseFirestore>(
        () => registerModule.provideFirebaseFirestore());
    gh.lazySingleton<_i6.GlobalViewModel>(() => _i6.GlobalViewModel());
    gh.factory<_i7.HomeViewmodel>(() => _i7.HomeViewmodel());
    gh.lazySingleton<_i8.LocaleRepository>(
        () => _i8.LocaleRepository(gh<_i3.SharedPrefsStore>()));
    gh.lazySingleton<_i9.LoginRepository>(
        () => _i9.LoginRepository(gh<_i4.FirebaseAuth>()));
    gh.lazySingleton<_i10.MainNavigator>(() => _i10.MainNavigator());
    gh.lazySingleton<_i11.RaffleRepository>(() => _i11.RaffleRepository(
          gh<_i9.LoginRepository>(),
          gh<_i5.FirebaseFirestore>(),
        ));
    gh.factory<_i12.RaffleViewModel>(() => _i12.RaffleViewModel(
          gh<_i9.LoginRepository>(),
          gh<_i11.RaffleRepository>(),
          gh<_i10.MainNavigator>(),
        ));
    gh.factory<_i13.RaffleWinnerPickerViewModel>(
        () => _i13.RaffleWinnerPickerViewModel(
              gh<_i11.RaffleRepository>(),
              gh<_i10.MainNavigator>(),
            ));
    gh.factory<_i14.SettingsViewmodel>(() => _i14.SettingsViewmodel(
          gh<_i10.MainNavigator>(),
          gh<_i9.LoginRepository>(),
        ));
    gh.factory<_i15.SplashViewModel>(() => _i15.SplashViewModel(
          gh<_i9.LoginRepository>(),
          gh<_i10.MainNavigator>(),
        ));
    gh.lazySingleton<_i16.TranslationsViewmodel>(
        () => _i16.TranslationsViewmodel(gh<_i8.LocaleRepository>()));
    gh.lazySingleton<_i17.AirtableService>(
        () => registerModule.providerAirtableService(gh<_i3.Dio>()));
    gh.factory<_i18.DebugChangeLanguageViewModel>(
        () => _i18.DebugChangeLanguageViewModel(
              gh<_i16.TranslationsViewmodel>(),
              gh<_i10.MainNavigator>(),
            ));
    gh.factory<_i19.DebugChangeTargetPlatformViewModel>(
        () => _i19.DebugChangeTargetPlatformViewModel(
              gh<_i6.GlobalViewModel>(),
              gh<_i10.MainNavigator>(),
            ));
    gh.factory<_i20.DebugViewModel>(() => _i20.DebugViewModel(
          gh<_i6.GlobalViewModel>(),
          gh<_i16.TranslationsViewmodel>(),
          gh<_i10.MainNavigator>(),
        ));
    gh.lazySingleton<_i21.EventRepository>(
        () => _i21.EventRepository(gh<_i17.AirtableService>()));
    gh.factory<_i22.EventsViewmodel>(
        () => _i22.EventsViewmodel(gh<_i21.EventRepository>()));
    gh.factory<_i23.LoginViewModel>(() => _i23.LoginViewModel(
          gh<_i9.LoginRepository>(),
          gh<_i10.MainNavigator>(),
        ));
    gh.lazySingleton<_i24.TalkRepository>(
        () => _i24.TalkRepository(gh<_i17.AirtableService>()));
    gh.factory<_i25.TalksViewmodel>(
        () => _i25.TalksViewmodel(gh<_i24.TalkRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i26.RegisterModule {}
