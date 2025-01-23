import 'dart:ui';

import 'package:flutter_belgium/theme/store_keys.dart';
import 'package:impaktfull_architecture/impaktfull_architecture.dart';

@lazySingleton
abstract class LocaleRepository {
  @factoryMethod
  factory LocaleRepository(
    SharedPrefsStore sharedPrefsStore,
  ) = _LocaleRepository;

  Future<void> saveLocale(Locale? locale);

  Future<Locale?> getSavedLocale();
}

class _LocaleRepository implements LocaleRepository {
  final SharedPrefsStore _sharedPrefsStore;

  _LocaleRepository(this._sharedPrefsStore);

  @override
  Future<void> saveLocale(Locale? locale) async {
    if (locale == null) {
      await _sharedPrefsStore.removeKey(key: StoreKeys.locale);
    } else {
      await _sharedPrefsStore.saveString(key: StoreKeys.locale, value: locale.languageCode);
    }
  }

  @override
  Future<Locale?> getSavedLocale() async {
    final localeCode = await _sharedPrefsStore.getString(key: StoreKeys.locale);
    if (localeCode == null || localeCode.isEmpty) return null;
    return Locale(localeCode);
  }
}
