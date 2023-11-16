import 'package:injectable/injectable.dart';

@lazySingleton
abstract class LoginRepository {
  @factoryMethod
  factory LoginRepository() => LoginRepositoryImpl();

  bool get isLoggedIn;

  Future<void> login();

  Future<void> logout();
}

class LoginRepositoryImpl implements LoginRepository {
  var _isLoggedIn = false;

  @override
  bool get isLoggedIn => _isLoggedIn;

  @override
  Future<void> login() async {
    _isLoggedIn = true;
  }

  @override
  Future<void> logout() async {
    _isLoggedIn = false;
  }
}
