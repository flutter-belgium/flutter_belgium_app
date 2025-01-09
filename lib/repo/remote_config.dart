import 'dart:io';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_belgium/model/data/remote_config/remote_config_data.dart';
import 'package:flutter_belgium/util/flavor/flavor_config.dart';
import 'package:impaktfull_architecture/impaktfull_architecture.dart';

@LazySingleton(
  as: ImpaktfullRemoteConfigRepository,
)
class AppRemoteConfigRepository extends ImpaktfullRemoteConfigRepository<RemoteConfigData> {
  final FirebaseRemoteConfig _firebaseRemoteConfig;

  AppRemoteConfigRepository(
    this._firebaseRemoteConfig,
    super.sharedPrefsStore,
    super.connectivityController,
  );

  @override
  Future<RemoteConfigData> fetchRemoteConfig() async {
    await _firebaseRemoteConfig.setConfigSettings(RemoteConfigSettings(
      minimumFetchInterval: FlavorConfig.isDev() ? const Duration(seconds: 2) : const Duration(minutes: 10),
      fetchTimeout: const Duration(seconds: 20),
    ));
    await _firebaseRemoteConfig.fetchAndActivate();
    return RemoteConfigData.fromFirebaseRemoteConfig(_firebaseRemoteConfig);
  }

  @override
  RemoteConfigData fromJson(Map<String, dynamic> json) => RemoteConfigData.fromJson(json);

  @override
  Future<RemoteConfigData> getDefault() async => RemoteConfigData(
        latestVersionCode: 1,
        minVersionCode: 1,
        updateUrl: Platform.isAndroid ? 'https://play.google.com/store/apps/details?id=be.flutterbelgium.app' : 'https://apps.apple.com/us/app/flutter-belgium/id6479450596',
        adminIds: [],
      );

  @override
  Map<String, dynamic> toJson(RemoteConfigData remoteConfigData) => remoteConfigData.toJson();
}
