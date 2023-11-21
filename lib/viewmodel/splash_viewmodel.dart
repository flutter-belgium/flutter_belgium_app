import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_belgium/navigation/main_navigator.dart';
import 'package:flutter_belgium/repo/login_repo.dart';

@injectable
class SplashViewModel with ChangeNotifier {
  final LoginRepository _loginRepository;
  final MainNavigator _mainNavigator;

  SplashViewModel(
    this._loginRepository,
    this._mainNavigator,
  );

  Future<void> init() async {
    await Future.delayed(const Duration(milliseconds: 500));
    if (_loginRepository.isLoggedIn) {
      _mainNavigator.goToRaffleScreen();
    } else {
      _mainNavigator.goToLoginScreen();
    }
  }
}
