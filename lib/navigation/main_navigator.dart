import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_belgium/navigation/page_route/no_transition_page_route.dart';
import 'package:flutter_navigation_generator_annotations/flutter_navigation_generator_annotations.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_belgium/navigation/main_navigator.navigator.dart';

@FlutterNavigator(
  pageType: NoTransitionPageRoute,
)
@lazySingleton
class MainNavigator with BaseNavigator {
  MainNavigator();

  BuildContext get context => navigatorKey.currentContext!;

  final List<NavigatorObserver> _navigatorObservers = [];

  String get initialRoute => RouteNames.splashScreen;

  List<NavigatorObserver> get navigatorObservers => _navigatorObservers;

  void showError(String title, {Object? error, StackTrace? trace}) {
    Flushbar(
      title: title,
      message: error.toString(),
      icon: const Icon(
        Icons.error_outline_rounded,
        size: 24,
        color: Colors.red,
      ),
      shouldIconPulse: false,
      borderRadius: BorderRadius.circular(8),
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(16),
      flushbarPosition: FlushbarPosition.TOP,
      leftBarIndicatorColor: Colors.red,
    ).show(context);
  }

  void showMessage(String message) {
    Flushbar(
      message: message.toString(),
      icon: const Icon(
        Icons.info_outline_rounded,
        size: 24,
        color: Colors.blue,
      ),
      shouldIconPulse: false,
      borderRadius: BorderRadius.circular(8),
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(16),
      flushbarPosition: FlushbarPosition.TOP,
      leftBarIndicatorColor: Colors.blue,
    ).show(context);
  }
}
