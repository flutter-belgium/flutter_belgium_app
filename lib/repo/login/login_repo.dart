import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_belgium/model/data/login/login_type.dart';
import 'package:flutter_belgium/model/data/remote_config/remote_config_data.dart';
import 'package:flutter_belgium/secrets/github_credentials.dart';
import 'package:flutter_belgium/theme/store_keys.dart';
import 'package:flutter_belgium/util/firebase/github/github_sign_in.dart';
import 'package:impaktfull_architecture/impaktfull_architecture.dart';

@lazySingleton
abstract class LoginRepository {
  @factoryMethod
  factory LoginRepository(
    FirebaseAuth firebaseAuth,
    SharedPrefsStore sharedPrefsStore,
  ) = _LoginRepository;

  bool get isLoggedIn;
  bool get isAdmin;

  String? get userId;

  String? get userName;

  bool get hasUserName;

  Future<void> init();

  Future<void> login(LoginType loginType);

  Future<void> logout();

  Future<void> deleteUser();

  Future<void> saveCustomUserName(String userName);
}

class _LoginRepository implements LoginRepository {
  final FirebaseAuth _firebaseAuth;
  final SharedPrefsStore _sharedPrefsStore;
  User? _user;

  String? _customUserName;

  _LoginRepository(
    this._firebaseAuth,
    this._sharedPrefsStore,
  );

  @override
  Future<void> init() async {
    _firebaseAuth.userChanges().listen((User? user) {
      _user = user;
    });
    await _getUserName();
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
  bool get hasUserName => userName != null;

  @override
  String? get userName => _user?.displayName ?? _customUserName;

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
    await _removeUserData();
  }

  @override
  Future<void> deleteUser() async {
    await _firebaseAuth.currentUser?.delete();
    await _removeUserData();
  }

  Future<void> _removeUserData() async {
    _user = null;
    _customUserName = null;
    await _sharedPrefsStore.removeKey(key: StoreKeys.customUserName);
  }

  Future<void> _getUserName() async {
    _customUserName = await _sharedPrefsStore.getString(key: StoreKeys.customUserName);
  }

  @override
  Future<void> saveCustomUserName(String userName) async {
    _customUserName = userName;
    await _sharedPrefsStore.saveString(key: StoreKeys.customUserName, value: userName);
  }
}
