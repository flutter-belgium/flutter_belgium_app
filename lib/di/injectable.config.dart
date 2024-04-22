// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i5;
import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:firebase_remote_config/firebase_remote_config.dart' as _i6;
import 'package:flutter_belgium/di/injectable.dart' as _i30;
import 'package:flutter_belgium/model/data/remote_config/remote_config_data.dart'
    as _i10;
import 'package:flutter_belgium/navigator/main_navigator.dart' as _i14;
import 'package:flutter_belgium/repo/event/event_repostitory.dart' as _i25;
import 'package:flutter_belgium/repo/locale/locale_repository.dart' as _i12;
import 'package:flutter_belgium/repo/login/login_repo.dart' as _i13;
import 'package:flutter_belgium/repo/raffle/raffle_repo.dart' as _i15;
import 'package:flutter_belgium/repo/remote_config.dart' as _i11;
import 'package:flutter_belgium/repo/talk/talk_repostitory.dart' as _i28;
import 'package:flutter_belgium/service/airtable_service.dart' as _i21;
import 'package:flutter_belgium/viewmodel/debug/debug_change_language_viewmodel.dart'
    as _i22;
import 'package:flutter_belgium/viewmodel/debug/debug_change_target_platform_viewmodel.dart'
    as _i23;
import 'package:flutter_belgium/viewmodel/debug/debug_viewmodel.dart' as _i24;
import 'package:flutter_belgium/viewmodel/event/events_viewmodel.dart' as _i26;
import 'package:flutter_belgium/viewmodel/force_update/force_update_viewmodel.dart'
    as _i7;
import 'package:flutter_belgium/viewmodel/global/global_viewmodel.dart' as _i8;
import 'package:flutter_belgium/viewmodel/global/translations_viewmodel.dart'
    as _i20;
import 'package:flutter_belgium/viewmodel/home/home_viewmodel.dart' as _i9;
import 'package:flutter_belgium/viewmodel/login/login_viewmodel.dart' as _i27;
import 'package:flutter_belgium/viewmodel/raffle/raffle_viewmodel.dart' as _i16;
import 'package:flutter_belgium/viewmodel/raffle/raffle_winner_picker_viewmodel.dart'
    as _i17;
import 'package:flutter_belgium/viewmodel/settings/settings_viewmodel.dart'
    as _i18;
import 'package:flutter_belgium/viewmodel/splash/splash_viewmodel.dart' as _i19;
import 'package:flutter_belgium/viewmodel/talk/talks_viewmodel.dart' as _i29;
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
    gh.lazySingleton<_i6.FirebaseRemoteConfig>(
        () => registerModule.provideRemoteConfig());
    gh.factory<_i7.ForceUpdateViewModel>(() => _i7.ForceUpdateViewModel());
    gh.lazySingleton<_i8.GlobalViewModel>(() => _i8.GlobalViewModel());
    gh.factory<_i9.HomeViewmodel>(() => _i9.HomeViewmodel());
    gh.lazySingleton<
            _i3.ImpaktfullRemoteConfigRepository<_i10.RemoteConfigData>>(
        () => _i11.RemoteConfigRepository(
              gh<_i6.FirebaseRemoteConfig>(),
              gh<_i3.SharedPrefsStore>(),
              gh<_i3.ConnectivityController>(),
            ));
    gh.lazySingleton<_i12.LocaleRepository>(
        () => _i12.LocaleRepository(gh<_i3.SharedPrefsStore>()));
    gh.lazySingleton<_i13.LoginRepository>(
        () => _i13.LoginRepository(gh<_i4.FirebaseAuth>()));
    gh.lazySingleton<_i14.MainNavigator>(() => _i14.MainNavigator());
    gh.lazySingleton<_i15.RaffleRepository>(() => _i15.RaffleRepository(
          gh<_i13.LoginRepository>(),
          gh<_i5.FirebaseFirestore>(),
        ));
    gh.factory<_i16.RaffleViewModel>(() => _i16.RaffleViewModel(
          gh<_i13.LoginRepository>(),
          gh<_i15.RaffleRepository>(),
          gh<_i14.MainNavigator>(),
        ));
    gh.factory<_i17.RaffleWinnerPickerViewModel>(
        () => _i17.RaffleWinnerPickerViewModel(
              gh<_i15.RaffleRepository>(),
              gh<_i14.MainNavigator>(),
            ));
    gh.factory<_i18.SettingsViewmodel>(() => _i18.SettingsViewmodel(
          gh<_i14.MainNavigator>(),
          gh<_i13.LoginRepository>(),
        ));
    gh.factory<_i19.SplashViewModel>(() => _i19.SplashViewModel(
          gh<_i14.MainNavigator>(),
          gh<_i3.ImpaktfullRemoteConfigRepository<_i10.RemoteConfigData>>(),
          gh<_i3.VersionCheckRepository>(),
        ));
    gh.lazySingleton<_i20.TranslationsViewmodel>(
        () => _i20.TranslationsViewmodel(gh<_i12.LocaleRepository>()));
    gh.lazySingleton<_i3.VersionCheckService>(() =>
        registerModule.provideVersionCheckService(gh<_i14.MainNavigator>()));
    gh.lazySingleton<_i21.AirtableService>(
        () => registerModule.providerAirtableService(gh<_i3.Dio>()));
    gh.factory<_i22.DebugChangeLanguageViewModel>(
        () => _i22.DebugChangeLanguageViewModel(
              gh<_i20.TranslationsViewmodel>(),
              gh<_i14.MainNavigator>(),
            ));
    gh.factory<_i23.DebugChangeTargetPlatformViewModel>(
        () => _i23.DebugChangeTargetPlatformViewModel(
              gh<_i8.GlobalViewModel>(),
              gh<_i14.MainNavigator>(),
            ));
    gh.factory<_i24.DebugViewModel>(() => _i24.DebugViewModel(
          gh<_i8.GlobalViewModel>(),
          gh<_i20.TranslationsViewmodel>(),
          gh<_i14.MainNavigator>(),
        ));
    gh.lazySingleton<_i25.EventRepository>(
        () => _i25.EventRepository(gh<_i21.AirtableService>()));
    gh.factory<_i26.EventsViewmodel>(
        () => _i26.EventsViewmodel(gh<_i25.EventRepository>()));
    gh.factory<_i27.LoginViewModel>(() => _i27.LoginViewModel(
          gh<_i13.LoginRepository>(),
          gh<_i14.MainNavigator>(),
        ));
    gh.lazySingleton<_i28.TalkRepository>(
        () => _i28.TalkRepository(gh<_i21.AirtableService>()));
    gh.factory<_i29.TalksViewmodel>(
        () => _i29.TalksViewmodel(gh<_i28.TalkRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i30.RegisterModule {}
