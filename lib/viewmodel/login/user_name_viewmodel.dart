import 'dart:async';

import 'package:flutter_belgium/navigator/main_navigator.dart';
import 'package:flutter_belgium/repo/login/login_repo.dart';
import 'package:impaktfull_architecture/impaktfull_architecture.dart';

@injectable
class UserNameViewModel with ChangeNotifier {
  final LoginRepository _loginRepository;
  final MainNavigator _mainNavigator;

  var _isLoading = false;
  var _userName = '';

  bool get isLoading => _isLoading;

  UserNameViewModel(
    this._loginRepository,
    this._mainNavigator,
  );

  void init() {}

  void onUserNameUpdated(String userName) {
    _userName = userName;
    notifyListeners();
  }

  Future<void> onSaveTapped() async {
    try {
      _isLoading = true;
      notifyListeners();
      await _loginRepository.saveCustomUserName(_userName);
      _isLoading = false;
      notifyListeners();
      unawaited(_mainNavigator.goToNextOnboardingScreen());
    } catch (error, trace) {
      _mainNavigator.showError('Failed to open login', error: error, trace: trace);
      _isLoading = false;
      notifyListeners();
    }
  }
}
