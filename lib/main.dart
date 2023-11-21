import 'package:flutter/material.dart';
import 'package:flutter_belgium/app.dart';
import 'package:flutter_belgium/di/injectable.dart';
import 'package:flutter_belgium/firebase_init.dart';

Future<void> main() async {
  configureDependencies();
  await initFirebase();
  runApp(const MyApp());
}
