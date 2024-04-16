import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_belgium/di/injectable.dart';
import 'package:flutter_belgium/repo/login/login_repo.dart';
import 'package:flutter_belgium/util/firebase/firebase_options.dart';

Future<void> initFirebase() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await getIt<LoginRepository>().init();
}