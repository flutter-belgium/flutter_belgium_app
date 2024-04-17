import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_belgium/di/injectable.dart';
import 'package:flutter_belgium/repo/login/login_repo.dart';
import 'package:flutter_belgium/util/firebase/firebase_options.dart';

Future<void> initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  } else {
    await Firebase.initializeApp();
  }
  await getIt<LoginRepository>().init();
}
