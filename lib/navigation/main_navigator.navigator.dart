// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// FlutterNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i1;
import 'package:flutter/material.dart';

import '../screen/login_screen.dart';
import '../screen/qr_scanner_screen.dart';
import '../screen/raffle_screen.dart';
import '../screen/raffle_winner_picker_screen.dart';
import '../screen/splash_screen.dart';
import 'page_route/no_transition_page_route.dart';

mixin BaseNavigator {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.loginScreen:
        return NoTransitionPageRoute<void>(
          builder: (_) => LoginScreen(
            key: (settings.arguments as Map<String, dynamic>?)?['key'] as Key?,
          ),
          settings: settings,
          fullscreenDialog: false,
        );
      case RouteNames.raffleWinnerPickerScreen:
        return NoTransitionPageRoute<void>(
          builder: (_) => RaffleWinnerPickerScreen(
            key: (settings.arguments as Map<String, dynamic>?)?['key'] as Key?,
          ),
          settings: settings,
          fullscreenDialog: false,
        );
      case RouteNames.qrScannerScreen:
        return NoTransitionPageRoute<void>(
          builder: (_) => QrScannerScreen(
            key: (settings.arguments as Map<String, dynamic>?)?['key'] as Key?,
          ),
          settings: settings,
          fullscreenDialog: false,
        );
      case RouteNames.raffleScreen:
        return NoTransitionPageRoute<void>(
          builder: (_) => RaffleScreen(
            key: (settings.arguments as Map<String, dynamic>?)?['key'] as Key?,
          ),
          settings: settings,
          fullscreenDialog: false,
        );
      case RouteNames.splashScreen:
        return NoTransitionPageRoute<void>(
          builder: (_) => SplashScreen(
            key: (settings.arguments as Map<String, dynamic>?)?['key'] as Key?,
          ),
          settings: settings,
          fullscreenDialog: false,
        );
    }
    return null;
  }

  void goToLoginScreen({_i1.Key? key}) => navigatorKey.currentState?.pushNamedAndRemoveUntil<dynamic>(
        RouteNames.loginScreen,
        (_) => false,
        arguments: {'key': key},
      );
  Future<void> goToRaffleWinnerPickerScreen({_i1.Key? key}) async => navigatorKey.currentState?.pushNamed<dynamic>(
        RouteNames.raffleWinnerPickerScreen,
        arguments: {'key': key},
      );
  void goToQrScannerScreen({_i1.Key? key}) => navigatorKey.currentState?.pushNamedAndRemoveUntil<dynamic>(
        RouteNames.qrScannerScreen,
        (_) => false,
        arguments: {'key': key},
      );
  void goToRaffleScreen({_i1.Key? key}) => navigatorKey.currentState?.pushNamedAndRemoveUntil<dynamic>(
        RouteNames.raffleScreen,
        (_) => false,
        arguments: {'key': key},
      );
  void goToSplashScreen({_i1.Key? key}) => navigatorKey.currentState?.pushNamedAndRemoveUntil<dynamic>(
        RouteNames.splashScreen,
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
  static const loginScreen = '/login';

  static const raffleWinnerPickerScreen = '/raffle-winner-picker';

  static const qrScannerScreen = '/qr-scanner';

  static const raffleScreen = '/raffle';

  static const splashScreen = '/splash';
}
