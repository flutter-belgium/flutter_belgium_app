import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:impaktfull_architecture/impaktfull_architecture.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_config_data.g.dart';

@JsonSerializable()
class RemoteConfigData extends ImpaktfullRemoteConfigData {
  static RemoteConfigData get instance => ImpaktfullRemoteConfigData.baseRemoteConfigData as RemoteConfigData;

  RemoteConfigData({
    required super.latestVersionCode,
    required super.minVersionCode,
    required super.updateUrl,
  });

  static Future<RemoteConfigData> fromFirebaseRemoteConfig(FirebaseRemoteConfig firebaseRemoteConfig) async {
    return RemoteConfigData(
      latestVersionCode: firebaseRemoteConfig.getInt('latest_version_code'),
      minVersionCode: firebaseRemoteConfig.getInt('min_version_code'),
      updateUrl: firebaseRemoteConfig.getString('url_update'),
    );
  }

  factory RemoteConfigData.fromJson(Map<String, dynamic> json) => _$RemoteConfigDataFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteConfigDataToJson(this);
}
