import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_belgium/model/data/login/login_type.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
abstract class LoginRepository {
  @factoryMethod
  factory LoginRepository(
    FirebaseAuth firebaseAuth,
  ) = _LoginRepository;

  bool get isLoggedIn;

  String? get userId;

  String? get userName;

  Future<void> init();

  Future<void> login(LoginType loginType);

  Future<void> logout();
}

class _LoginRepository implements LoginRepository {
  final FirebaseAuth _firebaseAuth;
  User? _user;

  _LoginRepository(
    this._firebaseAuth,
  );

  @override
  Future<void> init() async {
    _firebaseAuth.userChanges().listen((User? user) {
      _user = user;
    });
  }

  @override
  bool get isLoggedIn => _user != null;

  @override
  String? get userId => _user?.uid;

  @override
  String? get userName => _user?.displayName;

  @override
  Future<void> login(LoginType loginType) async {
    AuthProvider authProvider;
    switch (loginType) {
      case LoginType.github:
        authProvider = GithubAuthProvider();
        break;
      case LoginType.google:
        authProvider = GoogleAuthProvider();
        break;
    }
    final userCredentials = await _firebaseAuth.signInWithPopup(authProvider);
    _user = userCredentials.user;
  }

  @override
  Future<void> logout() async {
    _firebaseAuth.signOut();
  }
}
