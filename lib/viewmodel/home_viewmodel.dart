import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_belgium/navigation/main_navigator.dart';
import 'package:flutter_belgium/repo/login_repo.dart';

@injectable
class HomeViewModel with ChangeNotifier {
  final LoginRepository _loginRepository;
  final MainNavigator _mainNavigator;

  HomeViewModel(
    this._loginRepository,
    this._mainNavigator,
  );

  void init() {}

  Future<void> onLogoutTapped() async {
    await _loginRepository.logout();
    _mainNavigator.goToLoginScreen();
  }

  void onQrCodeScanned(String value) {}
}
