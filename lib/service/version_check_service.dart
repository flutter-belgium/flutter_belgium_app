import 'package:flutter_belgium/model/data/remote_config/remote_config_data.dart';
import 'package:flutter_belgium/navigator/main_navigator.dart';
import 'package:impaktfull_architecture/impaktfull_architecture.dart';

class RemoteConfigVersionCheckService extends VersionCheckService {
  final MainNavigator _mainNavigator;

  RemoteConfigVersionCheckService(
    this._mainNavigator,
  );

  @override
  Future<VersionRequirements?> getVersionRequirements() async => VersionRequirements(
        latest: VersionRequirement(
          buildNumber: RemoteConfigData.instance.latestVersionCode,
        ),
        min: VersionRequirement(
          buildNumber: RemoteConfigData.instance.minVersionCode,
        ),
      );

  @override
  Future<void> install(VersionCheckResult result) async => _mainNavigator.openAppStore();

  @override
  void openStore() => _mainNavigator.openAppStore();
}
