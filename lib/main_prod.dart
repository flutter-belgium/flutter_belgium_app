import 'package:flutter/material.dart';
import 'package:flutter_belgium/app.dart';
import 'package:flutter_belgium/common.dart';
import 'package:flutter_belgium/util/flavor/flavor_config.dart';

Future<void> main() async {
  await initApp();
  FlavorConfig(
    flavor: Flavor.prod,
    values: const FlavorValues(),
  );
  runApp(const App());
}
