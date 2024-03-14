import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_belgium/di/injectable.config.dart';
import 'package:impaktfull_architecture/impaktfull_architecture.dart';

final getIt = GetIt.asNewInstance();

@InjectableInit(
  initializerName: r'initGetIt',
  generateForDir: ['lib'],
)
Future<void> configureDependencies() async {
  getIt.initGetIt();
  await configureImpaktfullArchitecture(GetItHelper(getIt));
  await getIt.allReady();
}

@module
abstract class RegisterModule {
  @lazySingleton
  Dio provideDio() {
    final dio = Dio();
    (dio.transformer as BackgroundTransformer).jsonDecodeCallback = parseJson;
    return dio;
  }

  @lazySingleton
  FirebaseFirestore provideFirebaseFirestore() => FirebaseFirestore.instance;

  @lazySingleton
  FirebaseAuth provideFirebaseAuth() => FirebaseAuth.instance;
}

dynamic _parseAndDecode(String response) => jsonDecode(response);

dynamic parseJson(String text) => compute<String, dynamic>(_parseAndDecode, text);
