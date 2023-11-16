import 'package:flutter/material.dart';
import 'package:flutter_belgium/app.dart';
import 'package:flutter_belgium/di/injectable.dart';

Future<void> main() async {
  configureDependencies();
  runApp(const MyApp());
}
