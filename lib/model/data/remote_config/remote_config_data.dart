import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:impaktfull_architecture/impaktfull_architecture.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_config_data.g.dart';

@JsonSerializable()
class RemoteConfigData extends ImpaktfullRemoteConfigData {
  static RemoteConfigData get instance => ImpaktfullRemoteConfigData.baseRemoteConfigData as RemoteConfigData;
  List<String> adminIds;
  RemoteConfigData({
    required this.adminIds,
    required super.latestVersionCode,
    required super.minVersionCode,
    required super.updateUrl,
  });

  static Future<RemoteConfigData> fromFirebaseRemoteConfig(FirebaseRemoteConfig firebaseRemoteConfig) async {
    return RemoteConfigData(
      latestVersionCode: firebaseRemoteConfig.getInt('latest_version_code'),
      minVersionCode: firebaseRemoteConfig.getInt('min_version_code'),
      updateUrl: firebaseRemoteConfig.getString('url_update'),
      adminIds: (jsonDecode(firebaseRemoteConfig.getString('administrators')) as List<dynamic>).map((e) => e.toString()).toList(),
    );
  }

  factory RemoteConfigData.fromJson(Map<String, dynamic> json) => _$RemoteConfigDataFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteConfigDataToJson(this);
}
