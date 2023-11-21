import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_belgium/di/injectable.dart';
import 'package:flutter_belgium/firebase_options.dart';
import 'package:flutter_belgium/repo/login_repo.dart';

Future<void> initFirebase() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  getIt<LoginRepository>().init();
}
