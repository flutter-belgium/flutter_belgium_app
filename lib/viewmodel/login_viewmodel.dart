import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_belgium/navigation/main_navigator.dart';
import 'package:flutter_belgium/repo/login_repo.dart';

@injectable
class LoginViewModel with ChangeNotifier {
  final LoginRepository _loginRepository;
  final MainNavigator _mainNavigator;

  var _isLoading = false;

  bool get isLoading => _isLoading;

  LoginViewModel(
    this._loginRepository,
    this._mainNavigator,
  );

  void init() {}

  Future<void> onLoginTapped() async {
    _isLoading = true;
    notifyListeners();
    await _loginRepository.login();
    _isLoading = false;
    notifyListeners();
    _mainNavigator.goToHomeScreen();
  }
}
