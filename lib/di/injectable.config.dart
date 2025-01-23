// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:firebase_remote_config/firebase_remote_config.dart' as _i627;
import 'package:flutter_belgium/di/injectable.dart' as _i236;
import 'package:flutter_belgium/model/data/remote_config/remote_config_data.dart' as _i366;
import 'package:flutter_belgium/navigator/main_navigator.dart' as _i309;
import 'package:flutter_belgium/repo/event/event_repostitory.dart' as _i615;
import 'package:flutter_belgium/repo/locale/locale_repository.dart' as _i561;
import 'package:flutter_belgium/repo/login/login_repo.dart' as _i957;
import 'package:flutter_belgium/repo/raffle/raffle_repo.dart' as _i585;
import 'package:flutter_belgium/repo/remote_config.dart' as _i887;
import 'package:flutter_belgium/repo/talk/talk_repostitory.dart' as _i406;
import 'package:flutter_belgium/service/airtable_service.dart' as _i101;
import 'package:flutter_belgium/viewmodel/debug/debug_change_language_viewmodel.dart' as _i93;
import 'package:flutter_belgium/viewmodel/debug/debug_change_target_platform_viewmodel.dart' as _i25;
import 'package:flutter_belgium/viewmodel/debug/debug_viewmodel.dart' as _i450;
import 'package:flutter_belgium/viewmodel/event/events_viewmodel.dart' as _i820;
import 'package:flutter_belgium/viewmodel/force_update/force_update_viewmodel.dart' as _i590;
import 'package:flutter_belgium/viewmodel/global/global_viewmodel.dart' as _i394;
import 'package:flutter_belgium/viewmodel/global/translations_viewmodel.dart' as _i145;
import 'package:flutter_belgium/viewmodel/home/home_viewmodel.dart' as _i922;
import 'package:flutter_belgium/viewmodel/login/login_viewmodel.dart' as _i463;
import 'package:flutter_belgium/viewmodel/login/user_name_viewmodel.dart' as _i832;
import 'package:flutter_belgium/viewmodel/raffle/raffle_viewmodel.dart' as _i163;
import 'package:flutter_belgium/viewmodel/raffle/raffle_winner_picker_viewmodel.dart' as _i187;
import 'package:flutter_belgium/viewmodel/settings/settings_viewmodel.dart' as _i46;
import 'package:flutter_belgium/viewmodel/splash/splash_viewmodel.dart' as _i597;
import 'package:flutter_belgium/viewmodel/talk/talks_viewmodel.dart' as _i487;
import 'package:get_it/get_it.dart' as _i174;
import 'package:impaktfull_architecture/impaktfull_architecture.dart' as _i471;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initGetIt({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i922.HomeViewmodel>(() => _i922.HomeViewmodel());
    gh.factory<_i590.ForceUpdateViewModel>(() => _i590.ForceUpdateViewModel());
    gh.lazySingleton<_i394.GlobalViewModel>(() => _i394.GlobalViewModel());
    gh.lazySingleton<_i471.Dio>(() => registerModule.provideDio());
    gh.lazySingleton<_i974.FirebaseFirestore>(() => registerModule.provideFirebaseFirestore());
    gh.lazySingleton<_i59.FirebaseAuth>(() => registerModule.provideFirebaseAuth());
    gh.lazySingleton<_i627.FirebaseRemoteConfig>(() => registerModule.provideRemoteConfig());
    gh.lazySingleton<_i309.MainNavigator>(() => _i309.MainNavigator());
    gh.lazySingleton<_i957.LoginRepository>(() => _i957.LoginRepository(
          gh<_i59.FirebaseAuth>(),
          gh<_i471.SharedPrefsStore>(),
        ));
    gh.lazySingleton<_i561.LocaleRepository>(() => _i561.LocaleRepository(gh<_i471.SharedPrefsStore>()));
    gh.factory<_i832.UserNameViewModel>(() => _i832.UserNameViewModel(
          gh<_i957.LoginRepository>(),
          gh<_i309.MainNavigator>(),
        ));
    gh.factory<_i463.LoginViewModel>(() => _i463.LoginViewModel(
          gh<_i957.LoginRepository>(),
          gh<_i309.MainNavigator>(),
        ));
    gh.lazySingleton<_i471.ImpaktfullVersionCheckService>(() => registerModule.provideVersionCheckService(gh<_i309.MainNavigator>()));
    gh.lazySingleton<_i101.AirtableService>(() => registerModule.providerAirtableService(gh<_i471.Dio>()));
    gh.lazySingleton<_i145.TranslationsViewmodel>(() => _i145.TranslationsViewmodel(gh<_i561.LocaleRepository>()));
    gh.lazySingleton<_i585.RaffleRepository>(() => _i585.RaffleRepository(
          gh<_i957.LoginRepository>(),
          gh<_i974.FirebaseFirestore>(),
        ));
    gh.lazySingleton<_i471.ImpaktfullRemoteConfigRepository<_i366.RemoteConfigData>>(() => _i887.AppRemoteConfigRepository(
          gh<_i627.FirebaseRemoteConfig>(),
          gh<_i471.SharedPrefsStore>(),
          gh<_i471.ConnectivityController>(),
        ));
    gh.factory<_i450.DebugViewModel>(() => _i450.DebugViewModel(
          gh<_i394.GlobalViewModel>(),
          gh<_i145.TranslationsViewmodel>(),
          gh<_i309.MainNavigator>(),
        ));
    gh.factory<_i163.RaffleViewModel>(() => _i163.RaffleViewModel(
          gh<_i957.LoginRepository>(),
          gh<_i585.RaffleRepository>(),
          gh<_i309.MainNavigator>(),
        ));
    gh.factory<_i25.DebugChangeTargetPlatformViewModel>(() => _i25.DebugChangeTargetPlatformViewModel(
          gh<_i394.GlobalViewModel>(),
          gh<_i309.MainNavigator>(),
        ));
    gh.factory<_i46.SettingsViewmodel>(() => _i46.SettingsViewmodel(
          gh<_i309.MainNavigator>(),
          gh<_i957.LoginRepository>(),
        ));
    gh.lazySingleton<_i615.EventRepository>(() => _i615.EventRepository(gh<_i101.AirtableService>()));
    gh.lazySingleton<_i406.TalkRepository>(() => _i406.TalkRepository(gh<_i101.AirtableService>()));
    gh.factory<_i597.SplashViewModel>(() => _i597.SplashViewModel(
          gh<_i309.MainNavigator>(),
          gh<_i471.ImpaktfullRemoteConfigRepository<_i366.RemoteConfigData>>(),
          gh<_i471.ImpaktfullVersionCheckRepository>(),
        ));
    gh.factory<_i93.DebugChangeLanguageViewModel>(() => _i93.DebugChangeLanguageViewModel(
          gh<_i145.TranslationsViewmodel>(),
          gh<_i309.MainNavigator>(),
        ));
    gh.factory<_i187.RaffleWinnerPickerViewModel>(() => _i187.RaffleWinnerPickerViewModel(
          gh<_i585.RaffleRepository>(),
          gh<_i309.MainNavigator>(),
        ));
    gh.factory<_i487.TalksViewmodel>(() => _i487.TalksViewmodel(gh<_i406.TalkRepository>()));
    gh.factory<_i820.EventsViewmodel>(() => _i820.EventsViewmodel(gh<_i615.EventRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i236.RegisterModule {}
