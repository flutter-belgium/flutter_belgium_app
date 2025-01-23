import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_belgium/repo/locale/locale_repository.dart';
import 'package:flutter_belgium/util/locale/localization.dart';
import 'package:flutter_belgium/util/locale/localization_delegate.dart';
import 'package:impaktfull_architecture/impaktfull_architecture.dart';

@lazySingleton
class TranslationsViewmodel extends ChangeNotifierEx {
  final LocaleRepository _localeRepo;

  var _localeDelegate = LocalizationDelegate();
  var _showsTranslationKeys = false;

  LocalizationDelegate? get localeDelegate => _localeDelegate;

  List<Locale> get supportedLocales => LocalizationDelegate.supportedLocales;

  Locale? get locale => _localeDelegate.activeLocale;

  bool get showsTranslationKeys => _showsTranslationKeys;

  TranslationsViewmodel(
    this._localeRepo,
  );

  List<LocalizationsDelegate<dynamic>> get localizationDelegates => [
        _localeDelegate,
        ...GlobalMaterialLocalizations.delegates,
        GlobalWidgetsLocalizations.delegate,
      ];

  Future<void> init() async {
    await _initLocale();
  }

  Future<void> _initLocale() async {
    var locale = await _localeRepo.getSavedLocale();
    locale ??= await _getDefaultLanguage();
    _localeDelegate = LocalizationDelegate(
      newLocale: locale,
    );
    if (disposed) return;
    notifyListeners();
  }

  // TODO: Get the locale from the device and check if that locale is supported. If not use the default locale.
  Future<Locale> _getDefaultLanguage() async {
    return LocalizationDelegate.defaultLocale;
  }

  Future<void> switchToLocale(Locale? locale) async {
    await _localeRepo.saveLocale(locale);
    _localeDelegate = LocalizationDelegate(
      newLocale: locale,
      showLocalizationKeys: _localeDelegate.showLocalizationKeys,
    );
    notifyListeners();
  }

  String getCurrentLanguage(Localization localization) => getTranslatedLocale(_localeDelegate.activeLocale, localization);

  String getTranslatedLocale(
    Locale? locale,
    Localization localization,
  ) {
    switch (locale?.languageCode) {
      case 'nl':
        return 'Nederlands';
      case 'en':
        return 'English';
    }
    return 'System Language';
  }

  bool isLocaleSelected(Locale? locale) {
    if (_localeDelegate.activeLocale == null && locale == null) return true;
    return _localeDelegate.activeLocale?.languageCode == locale?.languageCode;
  }

  void toggleTranslationKeys() {
    _showsTranslationKeys = !showsTranslationKeys;
    _localeDelegate = LocalizationDelegate(
      newLocale: locale,
      showLocalizationKeys: _showsTranslationKeys,
    );
    notifyListeners();
  }

  Future<void> onSwitchToDutch() => switchToLocale(const Locale('nl'));

  Future<void> onSwitchToEnglish() => switchToLocale(const Locale('en'));

  Future<void> onSwitchToSystemLanguage() => switchToLocale(null);
}
