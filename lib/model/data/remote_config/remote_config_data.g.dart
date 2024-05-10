// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_config_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteConfigData _$RemoteConfigDataFromJson(Map<String, dynamic> json) => RemoteConfigData(
      adminIds: (json['adminIds'] as List<dynamic>).map((e) => e as String).toList(),
      latestVersionCode: json['latestVersionCode'] as int,
      minVersionCode: json['minVersionCode'] as int,
      updateUrl: json['updateUrl'] as String,
    );

Map<String, dynamic> _$RemoteConfigDataToJson(RemoteConfigData instance) => <String, dynamic>{
      'latestVersionCode': instance.latestVersionCode,
      'minVersionCode': instance.minVersionCode,
      'updateUrl': instance.updateUrl,
      'adminIds': instance.adminIds,
    };
