import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_belgium/di/injectable.config.dart';
import 'package:flutter_belgium/navigator/main_navigator.dart';
import 'package:flutter_belgium/secrets/airtable_config.dart';
import 'package:flutter_belgium/service/airtable_service.dart';
import 'package:flutter_belgium/service/version_check_service.dart';
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

  @lazySingleton
  FirebaseRemoteConfig provideRemoteConfig() => FirebaseRemoteConfig.instance;

  @lazySingleton
  AirtableService providerAirtableService(Dio dio) => AirtableService(
        personalAccessToken: AirTableConfig.personalAccessToken,
        projectBase: AirTableConfig.base,
        dio: dio,
      );

  @lazySingleton
  ImpaktfullVersionCheckService provideVersionCheckService(MainNavigator mainNavigator) {
    if (!kIsWeb) return RemoteConfigVersionCheckService(mainNavigator);
    return ImpaktfullNoopVersionCheckService();
  }
}

dynamic _parseAndDecode(String response) => jsonDecode(response);

dynamic parseJson(String text) => compute<String, dynamic>(_parseAndDecode, text);
