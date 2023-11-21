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

  final List<NavigatorObserver> _navigatorObservers = [];

  String get initialRoute => RouteNames.splashScreen;

  List<NavigatorObserver> get navigatorObservers => _navigatorObservers;
}
