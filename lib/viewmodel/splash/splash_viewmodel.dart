import 'package:flutter_belgium/model/data/remote_config/remote_config_data.dart';
import 'package:flutter_belgium/navigator/main_navigator.dart';
import 'package:impaktfull_architecture/impaktfull_architecture.dart';

@injectable
class SplashViewModel with ChangeNotifier {
  final MainNavigator _mainNavigator;
  final RemoteConfigRepository<RemoteConfigData> _remoteConfigRepo;
  final VersionCheckRepository _versionCheckRepo;

  SplashViewModel(
    this._mainNavigator,
    this._remoteConfigRepo,
    this._versionCheckRepo,
  );

  Future<void> init() async {
    await Future.delayed(const Duration(milliseconds: 500));
    await _remoteConfigRepo.init();
    final result = await _versionCheckRepo.checkVersionCheck();
    if (result != null && result.isForceUpdate) {
      _mainNavigator.goToForceUpdateScreen();
      return;
    }
    await _mainNavigator.goToNextOnboardingScreen();
  }
}
