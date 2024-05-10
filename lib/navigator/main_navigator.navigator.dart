// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// FlutterNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/foundation.dart' as _i3;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_belgium/util/firebase/github/github_sign_in_result.dart' as _i1;
import 'package:impaktfull_architecture/impaktfull_architecture.dart' as _i2;
import 'package:impaktfull_architecture/impaktfull_architecture.dart';

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
    final arguments = settings.arguments is Map ? (settings.arguments as Map).cast<String, dynamic>() : null;
    switch (settings.name) {
      case RouteNames.gitHubSignInWebviewScreen:
        return MaterialPageRoute<GithubSignInPageResult>(
          builder: (_) => GitHubSignInWebviewScreen(
            clientId: arguments!['clientId'] as String,
            clientSecret: arguments!['clientSecret'] as String,
            allowSignUp: arguments!['allowSignUp'] as bool,
            scope: arguments!['scope'] as String,
            redirectUrl: arguments!['redirectUrl'] as String,
            key: arguments?['key'] as Key?,
          ),
          settings: settings,
          fullscreenDialog: true,
        );
      case RouteNames.homeScreen:
        return MaterialPageRoute<void>(
          builder: (_) => HomeScreen(
            key: arguments?['key'] as Key?,
          ),
          settings: settings,
          fullscreenDialog: false,
        );
      case RouteNames.splashScreen:
        return MaterialPageRoute<void>(
          builder: (_) => SplashScreen(
            key: arguments?['key'] as Key?,
          ),
          settings: settings,
          fullscreenDialog: false,
        );
      case RouteNames.raffleWinnerPickerScreen:
        return MaterialPageRoute<void>(
          builder: (_) => RaffleWinnerPickerScreen(
            key: arguments?['key'] as Key?,
          ),
          settings: settings,
          fullscreenDialog: false,
        );
      case RouteNames.raffleScreen:
        return MaterialPageRoute<void>(
          builder: (_) => RaffleScreen(
            key: arguments?['key'] as Key?,
          ),
          settings: settings,
          fullscreenDialog: false,
        );
      case RouteNames.loginScreen:
        return MaterialPageRoute<void>(
          builder: (_) => LoginScreen(
            key: arguments?['key'] as Key?,
          ),
          settings: settings,
          fullscreenDialog: false,
        );
      case RouteNames.debugChangeTargetPlatformScreen:
        return MaterialPageRoute<void>(
          builder: (_) => DebugChangeTargetPlatformScreen(
            key: arguments?['key'] as Key?,
          ),
          settings: settings,
          fullscreenDialog: false,
        );
      case RouteNames.debugChangeLanguageScreen:
        return MaterialPageRoute<void>(
          builder: (_) => DebugChangeLanguageScreen(
            key: arguments?['key'] as Key?,
          ),
          settings: settings,
          fullscreenDialog: false,
        );
      case RouteNames.debugScreen:
        return MaterialPageRoute<void>(
          builder: (_) => DebugScreen(
            key: arguments?['key'] as Key?,
          ),
          settings: settings,
          fullscreenDialog: false,
        );
      case RouteNames.forceUpdateScreen:
        return MaterialPageRoute<void>(
          builder: (_) => ForceUpdateScreen(
            key: arguments?['key'] as Key?,
          ),
          settings: settings,
          fullscreenDialog: false,
        );
      case RouteNames.userNameScreen:
        return MaterialPageRoute<void>(
          builder: (_) => UserNameScreen(
            key: arguments?['key'] as Key?,
          ),
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
    _i2.Key? key,
  }) async {
    final dynamic result = await navigatorKey.currentState?.pushNamed<dynamic>(
      RouteNames.gitHubSignInWebviewScreen,
      arguments: {'clientId': clientId, 'clientSecret': clientSecret, 'allowSignUp': allowSignUp, 'scope': scope, 'redirectUrl': redirectUrl, 'key': key},
    );
    return (result as _i1.GithubSignInPageResult?);
  }

  void goToHomeScreen({_i2.Key? key}) => navigatorKey.currentState?.pushNamedAndRemoveUntil<dynamic>(
        RouteNames.homeScreen,
        (_) => false,
        arguments: {'key': key},
      );
  void goToSplashScreen({_i2.Key? key}) => navigatorKey.currentState?.pushNamedAndRemoveUntil<dynamic>(
        RouteNames.splashScreen,
        (_) => false,
        arguments: {'key': key},
      );
  Future<void> goToRaffleWinnerPickerScreen({_i2.Key? key}) async => navigatorKey.currentState?.pushNamed<dynamic>(
        RouteNames.raffleWinnerPickerScreen,
        arguments: {'key': key},
      );
  void goToRaffleScreen({_i3.Key? key}) => navigatorKey.currentState?.pushNamedAndRemoveUntil<dynamic>(
        RouteNames.raffleScreen,
        (_) => false,
        arguments: {'key': key},
      );
  void goToLoginScreen({_i2.Key? key}) => navigatorKey.currentState?.pushNamedAndRemoveUntil<dynamic>(
        RouteNames.loginScreen,
        (_) => false,
        arguments: {'key': key},
      );
  Future<void> goToDebugChangeTargetPlatformScreen({_i2.Key? key}) async => navigatorKey.currentState?.pushNamed<dynamic>(
        RouteNames.debugChangeTargetPlatformScreen,
        arguments: {'key': key},
      );
  Future<void> goToDebugChangeLanguageScreen({_i2.Key? key}) async => navigatorKey.currentState?.pushNamed<dynamic>(
        RouteNames.debugChangeLanguageScreen,
        arguments: {'key': key},
      );
  Future<void> goToDebugScreen({_i2.Key? key}) async => navigatorKey.currentState?.pushNamed<dynamic>(
        RouteNames.debugScreen,
        arguments: {'key': key},
      );
  void goToForceUpdateScreen({_i2.Key? key}) => navigatorKey.currentState?.pushNamedAndRemoveUntil<dynamic>(
        RouteNames.forceUpdateScreen,
        (_) => false,
        arguments: {'key': key},
      );
  void goToUserNameScreen({_i2.Key? key}) => navigatorKey.currentState?.pushNamedAndRemoveUntil<dynamic>(
        RouteNames.userNameScreen,
        (_) => false,
        arguments: {'key': key},
      );
  void goBack() => navigatorKey.currentState?.pop();
  void goBackWithResult<T>({T? result}) => navigatorKey.currentState?.pop(result);
  void popUntil(bool Function(Route<dynamic>) predicate) => navigatorKey.currentState?.popUntil(predicate);
  void goBackTo(String routeName) => popUntil((route) => route.settings.name == routeName);
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
  static const gitHubSignInWebviewScreen = '/git-hub-sign-in-webview';

  static const homeScreen = '/home';

  static const splashScreen = '/splash';

  static const raffleWinnerPickerScreen = '/raffle-winner-picker';

  static const raffleScreen = '/raffle';

  static const loginScreen = '/login';

  static const debugChangeTargetPlatformScreen = '/debug-change-target-platform';

  static const debugChangeLanguageScreen = '/debug-change-language';

  static const debugScreen = '/debug';

  static const forceUpdateScreen = '/force-update';

  static const userNameScreen = '/user-name';
}
