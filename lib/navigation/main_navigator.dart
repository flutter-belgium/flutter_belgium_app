import 'package:flutter/material.dart';
import 'package:flutter_navigation_generator_annotations/flutter_navigation_generator_annotations.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_belgium/navigation/main_navigator.navigator.dart';

@flutterNavigator
@lazySingleton
class MainNavigator with BaseNavigator {
  MainNavigator();

  final List<NavigatorObserver> _navigatorObservers = [];

  String get initialRoute => RouteNames.loginScreen;

  List<NavigatorObserver> get navigatorObservers => _navigatorObservers;
}
