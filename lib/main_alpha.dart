import 'package:flutter/material.dart';
import 'package:flutter_belgium/app.dart';
import 'package:flutter_belgium/common.dart';
import 'package:flutter_belgium/util/flavor/flavor_config.dart';

Future<void> main() async {
  await initApp();
  FlavorConfig(
    flavor: Flavor.alpha,
    values: const FlavorValues(
      baseUrl: 'https://your-api.com/api/v1/',
    ),
  );
  runApp(const App());
}
