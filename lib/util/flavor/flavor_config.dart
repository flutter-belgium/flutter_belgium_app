import 'dart:io';

import 'package:flutter/material.dart';

enum Flavor {
  dev(
    name: 'Dev',
    color: Colors.black,
  ),
  alpha(
    name: 'Alpha',
    color: Colors.amber,
  ),
  beta(
    name: 'Beta',
    color: Colors.green,
  ),
  prod(
    name: 'Prod',
    color: Colors.transparent,
  );

  final String name;
  final Color color;
  const Flavor({
    required this.name,
    required this.color,
  });
}

class FlavorValues {
  final String baseUrl;

  const FlavorValues({
    required this.baseUrl,
  });
}

class FlavorConfig {
  final Flavor flavor;
  final FlavorValues values;
  static FlavorConfig? _instance;

  factory FlavorConfig({
    required Flavor flavor,
    required FlavorValues values,
  }) =>
      _instance = FlavorConfig._internal(flavor, values);

  FlavorConfig._internal(this.flavor, this.values);

  static FlavorConfig get instance => _instance!;

  static bool get hasInstance => _instance != null;

  static bool isProd() => _instance!.flavor == Flavor.prod;

  static bool isDev() => _instance!.flavor == Flavor.dev;

  static bool isAlpha() => _instance!.flavor == Flavor.alpha;

  static bool isBeta() => _instance!.flavor == Flavor.beta;

  static bool isInTest() => Platform.environment.containsKey('FLUTTER_TEST');
}
