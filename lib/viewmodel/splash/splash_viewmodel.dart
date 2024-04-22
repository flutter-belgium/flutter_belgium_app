import 'package:flutter_belgium/model/data/remote_config/remote_config_data.dart';
import 'package:flutter_belgium/navigator/main_navigator.dart';
import 'package:flutter_belgium/repo/login/login_repo.dart';
import 'package:impaktfull_architecture/impaktfull_architecture.dart';

@injectable
class SplashViewModel with ChangeNotifier {
  final LoginRepository _loginRepository;
  final MainNavigator _mainNavigator;
  final ImpaktfullRemoteConfigRepository<RemoteConfigData> _remoteConfigRepo;
  final VersionCheckRepository _versionCheckRepo;

  SplashViewModel(
    this._loginRepository,
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
    if (_loginRepository.isLoggedIn) {
      _mainNavigator.goToHomeScreen();
    } else {
      _mainNavigator.goToLoginScreen();
    }
  }
}
