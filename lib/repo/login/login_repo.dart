import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_belgium/model/data/login/login_type.dart';
import 'package:flutter_belgium/model/data/remote_config/remote_config_data.dart';
import 'package:flutter_belgium/secrets/github_credentials.dart';
import 'package:flutter_belgium/util/firebase/github/github_sign_in.dart';
import 'package:impaktfull_architecture/impaktfull_architecture.dart';

@lazySingleton
abstract class LoginRepository {
  @factoryMethod
  factory LoginRepository(
    FirebaseAuth firebaseAuth,
  ) = _LoginRepository;

  bool get isLoggedIn;
  bool get isAdmin;

  String? get userId;

  String? get userName;

  Future<void> init();

  Future<void> login(LoginType loginType);

  Future<void> logout();

  Future<void> deleteUser();
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
  bool get isAdmin {
    if (userId == null) return false;
    return RemoteConfigData.instance.adminIds.contains(userId);
  }

  @override
  String? get userId => _user?.uid;

  @override
  String? get userName => _user?.displayName;

  @override
  Future<void> login(LoginType loginType) async {
    AuthProvider authProvider;
    switch (loginType) {
      case LoginType.apple:
        final appleAuthProvider = AppleAuthProvider();
        appleAuthProvider.addScope('email');
        appleAuthProvider.addScope('name');
        authProvider = appleAuthProvider;
        break;
      case LoginType.github:
        authProvider = GithubAuthProvider();
        break;
      case LoginType.google:
        authProvider = GoogleAuthProvider();
        break;
    }
    if (kIsWeb) {
      final userCredential = await _firebaseAuth.signInWithPopup(authProvider);
      _user = userCredential.user;
    } else {
      if (authProvider is GithubAuthProvider) {
        final gitHubSignIn = GitHubSignIn(
          clientId: GithubCredentials.clientId,
          clientSecret: GithubCredentials.clientSecret,
          redirectUrl: GithubCredentials.redirectUrl,
        );
        final result = await gitHubSignIn.signIn();
        final githubAuthCredential = GithubAuthProvider.credential(result.token!);
        final userCredential = await _firebaseAuth.signInWithCredential(githubAuthCredential);
        _user = userCredential.user;
      } else {
        final userCredential = await _firebaseAuth.signInWithProvider(authProvider);
        _user = userCredential.user;
      }
    }
  }

  @override
  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<void> deleteUser() async {
    await _firebaseAuth.currentUser?.delete();
    _user = null;
  }
}
