// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// FlutterNavigatorGenerator
// **************************************************************************

// ignore_for_file: prefer_const_constructors

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_belgium/util/firebase/github/github_sign_in_result.dart' as _i1;

import '../screen/debug/debug_change_language_screen.dart';
import '../screen/debug/debug_change_target_platform_screen.dart';
import '../screen/debug/debug_screen.dart';
import '../screen/force_update/force_update_screen.dart';
import '../screen/home/home_screen.dart';
import '../screen/login/login_screen.dart';
import '../screen/login/user_name_screen.dart';
import '../screen/raffle/raffle_screen.dart';
import '../screen/raffle/raffle_winner_picker_screen.dart';
import '../screen/splash/splash_screen.dart';
import '../util/firebase/github/github_sign_in_result.dart';
import '../util/firebase/github/github_sign_in_webview_screen.dart';

mixin BaseNavigator {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    final arguments = settings.arguments is Map ? (settings.arguments as Map).cast<String, dynamic>() : <String, dynamic>{};
    final settingsUri = Uri.parse(settings.name ?? '');
    final queryParameters = Map.from(settingsUri.queryParameters);
    switch (settingsUri.path) {
      case RouteNames.gitHubSignInWebviewScreen:
        return MaterialPageRoute<GithubSignInPageResult>(
          builder: (_) => GitHubSignInWebviewScreen(
            clientId: queryParameters['clientId'] ?? arguments['clientId'] as String,
            clientSecret: queryParameters['clientSecret'] ?? arguments['clientSecret'] as String,
            allowSignUp: queryParameters['allowSignUp'] != null ? queryParameters['allowSignUp']! == 'true' : arguments['allowSignUp'] as bool,
            scope: queryParameters['scope'] ?? arguments['scope'] as String,
            redirectUrl: queryParameters['redirectUrl'] ?? arguments['redirectUrl'] as String,
          ),
          settings: settings,
          fullscreenDialog: true,
        );
      case RouteNames.homeScreen:
        return MaterialPageRoute<void>(
          builder: (_) => HomeScreen(),
          settings: settings,
          fullscreenDialog: false,
        );
      case RouteNames.splashScreen:
        return MaterialPageRoute<void>(
          builder: (_) => SplashScreen(),
          settings: settings,
          fullscreenDialog: false,
        );
      case RouteNames.forceUpdateScreen:
        return MaterialPageRoute<void>(
          builder: (_) => ForceUpdateScreen(),
          settings: settings,
          fullscreenDialog: false,
        );
      case RouteNames.raffleWinnerPickerScreen:
        return MaterialPageRoute<void>(
          builder: (_) => RaffleWinnerPickerScreen(),
          settings: settings,
          fullscreenDialog: false,
        );
      case RouteNames.raffleScreen:
        return MaterialPageRoute<void>(
          builder: (_) => RaffleScreen(),
          settings: settings,
          fullscreenDialog: false,
        );
      case RouteNames.userNameScreen:
        return MaterialPageRoute<void>(
          builder: (_) => UserNameScreen(),
          settings: settings,
          fullscreenDialog: false,
        );
      case RouteNames.loginScreen:
        return MaterialPageRoute<void>(
          builder: (_) => LoginScreen(),
          settings: settings,
          fullscreenDialog: false,
        );
      case RouteNames.debugChangeTargetPlatformScreen:
        return MaterialPageRoute<void>(
          builder: (_) => DebugChangeTargetPlatformScreen(),
          settings: settings,
          fullscreenDialog: false,
        );
      case RouteNames.debugChangeLanguageScreen:
        return MaterialPageRoute<void>(
          builder: (_) => DebugChangeLanguageScreen(),
          settings: settings,
          fullscreenDialog: false,
        );
      case RouteNames.debugScreen:
        return MaterialPageRoute<void>(
          builder: (_) => DebugScreen(),
          settings: settings,
          fullscreenDialog: false,
        );
    }
    return null;
  }

  Future<_i1.GithubSignInPageResult?> goToGitHubSignInWebviewScreen({
    required String clientId,
    required String clientSecret,
    required bool allowSignUp,
    required String scope,
    required String redirectUrl,
  }) async {
    final dynamic result = await navigatorKey.currentState?.pushNamed<dynamic>(
      Uri(
        path: RouteNames.gitHubSignInWebviewScreen,
        queryParameters: kIsWeb ? {'clientId': clientId, 'clientSecret': clientSecret, 'allowSignUp': allowSignUp.toString(), 'scope': scope, 'redirectUrl': redirectUrl} : null,
      ).toString(),
      arguments: {'clientId': clientId, 'clientSecret': clientSecret, 'allowSignUp': allowSignUp, 'scope': scope, 'redirectUrl': redirectUrl},
    );
    return (result as _i1.GithubSignInPageResult?);
  }

  void goToHomeScreen() => navigatorKey.currentState?.pushNamedAndRemoveUntil<dynamic>(
        RouteNames.homeScreen,
        (_) => false,
        arguments: {},
      );
  void goToSplashScreen() => navigatorKey.currentState?.pushNamedAndRemoveUntil<dynamic>(
        RouteNames.splashScreen,
        (_) => false,
        arguments: {},
      );
  void goToForceUpdateScreen() => navigatorKey.currentState?.pushNamedAndRemoveUntil<dynamic>(
        RouteNames.forceUpdateScreen,
        (_) => false,
        arguments: {},
      );
  Future<void> goToRaffleWinnerPickerScreen() async => navigatorKey.currentState?.pushNamed<dynamic>(
        RouteNames.raffleWinnerPickerScreen,
        arguments: {},
      );
  void goToRaffleScreen() => navigatorKey.currentState?.pushNamedAndRemoveUntil<dynamic>(
        RouteNames.raffleScreen,
        (_) => false,
        arguments: {},
      );
  void goToUserNameScreen() => navigatorKey.currentState?.pushNamedAndRemoveUntil<dynamic>(
        RouteNames.userNameScreen,
        (_) => false,
        arguments: {},
      );
  void goToLoginScreen() => navigatorKey.currentState?.pushNamedAndRemoveUntil<dynamic>(
        RouteNames.loginScreen,
        (_) => false,
        arguments: {},
      );
  Future<void> goToDebugChangeTargetPlatformScreen() async => navigatorKey.currentState?.pushNamed<dynamic>(
        RouteNames.debugChangeTargetPlatformScreen,
        arguments: {},
      );
  Future<void> goToDebugChangeLanguageScreen() async => navigatorKey.currentState?.pushNamed<dynamic>(
        RouteNames.debugChangeLanguageScreen,
        arguments: {},
      );
  Future<void> goToDebugScreen() async => navigatorKey.currentState?.pushNamed<dynamic>(
        RouteNames.debugScreen,
        arguments: {},
      );
  void goBack() => navigatorKey.currentState?.pop();
  void goBackWithResult<T>({T? result}) => navigatorKey.currentState?.pop(result);
  void popUntil(bool Function(Route<dynamic>) predicate) => navigatorKey.currentState?.popUntil(predicate);
  void goBackTo(String routeName) => popUntil((route) => route.settings.name?.split('?').first == routeName);
  Future<T?> showCustomDialog<T>({Widget? widget}) async => showDialog<T>(
        context: navigatorKey.currentContext!,
        builder: (_) => widget ?? const SizedBox.shrink(),
      );
  Future<T?> showBottomSheet<T>({Widget? widget}) async => showModalBottomSheet<T>(
        context: navigatorKey.currentContext!,
        builder: (_) => widget ?? const SizedBox.shrink(),
      );
}

class RouteNames {
  /// /git-hub-sign-in-webview
  static const gitHubSignInWebviewScreen = '/git-hub-sign-in-webview';

  /// /home
  static const homeScreen = '/home';

  /// /splash
  static const splashScreen = '/splash';

  /// /force-update
  static const forceUpdateScreen = '/force-update';

  /// /raffle-winner-picker
  static const raffleWinnerPickerScreen = '/raffle-winner-picker';

  /// /raffle
  static const raffleScreen = '/raffle';

  /// /user-name
  static const userNameScreen = '/user-name';

  /// /login
  static const loginScreen = '/login';

  /// /debug-change-target-platform
  static const debugChangeTargetPlatformScreen = '/debug-change-target-platform';

  /// /debug-change-language
  static const debugChangeLanguageScreen = '/debug-change-language';

  /// /debug
  static const debugScreen = '/debug';
}
