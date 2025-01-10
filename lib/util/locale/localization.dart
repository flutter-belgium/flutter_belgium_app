import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_belgium/util/locale/localization_keys.dart';
import 'package:flutter_belgium/util/locale/localization_overrides.dart';
import 'package:sprintf/sprintf.dart';

//============================================================//
//THIS FILE IS AUTO GENERATED. DO NOT EDIT//
//============================================================//

typedef LocaleFilter = bool Function(String languageCode);

class Localization {
  LocaleFilter? localeFilter;

  var _localisedValues = <String, dynamic>{};
  var _localisedOverrideValues = <String, dynamic>{};

  static Localization of(BuildContext context) => Localizations.of<Localization>(context, Localization)!;

  /// The locale is used to get the correct json locale.
  /// It can later be used to check what the locale is that was used to load this Localization instance.
  final Locale? locale;

  Localization({required this.locale});

  static Future<Localization> load({
    required Locale locale,
    LocalizationOverrides? localizationOverrides,
    bool showLocalizationKeys = false,
    bool useCaching = true,
    AssetBundle? bundle,
  }) async {
    final localizations = Localization(locale: locale);
    if (showLocalizationKeys) {
      return localizations;
    }
    if (localizationOverrides != null) {
      final overrideLocalizations = await localizationOverrides.getOverriddenLocalizations(locale);
      localizations._localisedOverrideValues = overrideLocalizations;
    }
    final jsonContent = await (bundle ?? rootBundle).loadString('assets/locale/${locale.toLanguageTag()}.json', cache: useCaching);
    localizations._localisedValues = json.decode(jsonContent) as Map<String, dynamic>;
    return localizations;
  }

  String _t(String key, {List<dynamic>? args}) {
    try {
      final value = (_localisedOverrideValues[key] ?? _localisedValues[key]) as String?;
      if (value == null) return key;
      if (args == null || args.isEmpty) return value;
      return sprintf(value, args);
    } catch (e) {
      return '⚠$key⚠';
    }
  }

  /// Translations:
  ///
  /// en:  **'Flutter Belgium'**
  String get appName => _t(LocalizationKeys.appName);

  /// Translations:
  ///
  /// en:  **'Change language'**
  String get debugChangeLanguageTitle => _t(LocalizationKeys.debugChangeLanguageTitle);

  /// Translations:
  ///
  /// en:  **'Change platform'**
  String get debugChangeTargetPlatform => _t(LocalizationKeys.debugChangeTargetPlatform);

  /// Translations:
  ///
  /// en:  **'Change language'**
  String get debugListItemChangeLangague => _t(LocalizationKeys.debugListItemChangeLangague);

  /// Translations:
  ///
  /// en:  **'Debug'**
  String get debugTitle => _t(LocalizationKeys.debugTitle);

  /// Translations:
  ///
  /// en:  **'Are you sure you want to delete your account'**
  String get dialogDeleteAccountBody => _t(LocalizationKeys.dialogDeleteAccountBody);

  /// Translations:
  ///
  /// en:  **'Delete'**
  String get dialogDeleteAccountPrimaryBtn => _t(LocalizationKeys.dialogDeleteAccountPrimaryBtn);

  /// Translations:
  ///
  /// en:  **'Cancel'**
  String get dialogDeleteAccountSecondaryBtn => _t(LocalizationKeys.dialogDeleteAccountSecondaryBtn);

  /// Translations:
  ///
  /// en:  **'Delete account'**
  String get dialogDeleteAccountTitle => _t(LocalizationKeys.dialogDeleteAccountTitle);

  /// Translations:
  ///
  /// en:  **'Are you sure you want to logout'**
  String get dialogLogoutBody => _t(LocalizationKeys.dialogLogoutBody);

  /// Translations:
  ///
  /// en:  **'Logout'**
  String get dialogLogoutPrimaryBtn => _t(LocalizationKeys.dialogLogoutPrimaryBtn);

  /// Translations:
  ///
  /// en:  **'Cancel'**
  String get dialogLogoutSecondaryBtn => _t(LocalizationKeys.dialogLogoutSecondaryBtn);

  /// Translations:
  ///
  /// en:  **'Logout'**
  String get dialogLogoutTitle => _t(LocalizationKeys.dialogLogoutTitle);

  /// Translations:
  ///
  /// en:  **'Name'**
  String get dialogRaffleNewParticipantInputName => _t(LocalizationKeys.dialogRaffleNewParticipantInputName);

  /// Translations:
  ///
  /// en:  **'Add participant'**
  String get dialogRaffleNewParticipantPrimaryBtn => _t(LocalizationKeys.dialogRaffleNewParticipantPrimaryBtn);

  /// Translations:
  ///
  /// en:  **'Cancel'**
  String get dialogRaffleNewParticipantSecondaryBtn => _t(LocalizationKeys.dialogRaffleNewParticipantSecondaryBtn);

  /// Translations:
  ///
  /// en:  **'Add new participant'**
  String get dialogRaffleNewParticipantTitle => _t(LocalizationKeys.dialogRaffleNewParticipantTitle);

  /// Translations:
  ///
  /// en:  **'No events found'**
  String get eventsListNoData => _t(LocalizationKeys.eventsListNoData);

  /// Translations:
  ///
  /// en:  **'Events'**
  String get eventsListTitle => _t(LocalizationKeys.eventsListTitle);

  /// Translations:
  ///
  /// en:  **'Install the latest version to keep using the app.'**
  String get forceUpdateBody => _t(LocalizationKeys.forceUpdateBody);

  /// Translations:
  ///
  /// en:  **'Update'**
  String get forceUpdateBtn => _t(LocalizationKeys.forceUpdateBtn);

  /// Translations:
  ///
  /// en:  **'Force update'**
  String get forceUpdateTitle => _t(LocalizationKeys.forceUpdateTitle);

  /// Translations:
  ///
  /// en:  **'System language'**
  String get generalSystemLanguage => _t(LocalizationKeys.generalSystemLanguage);

  /// Translations:
  ///
  /// en:  **'Android'**
  String get generalSystemTargetAndroid => _t(LocalizationKeys.generalSystemTargetAndroid);

  /// Translations:
  ///
  /// en:  **'System'**
  String get generalSystemTargetDefault => _t(LocalizationKeys.generalSystemTargetDefault);

  /// Translations:
  ///
  /// en:  **'iOS'**
  String get generalSystemTargetIos => _t(LocalizationKeys.generalSystemTargetIos);

  /// Translations:
  ///
  /// en:  **'Events'**
  String get homeBottomNavigationEvents => _t(LocalizationKeys.homeBottomNavigationEvents);

  /// Translations:
  ///
  /// en:  **'Raffle'**
  String get homeBottomNavigationRaffle => _t(LocalizationKeys.homeBottomNavigationRaffle);

  /// Translations:
  ///
  /// en:  **'Settings'**
  String get homeBottomNavigationSettings => _t(LocalizationKeys.homeBottomNavigationSettings);

  /// Translations:
  ///
  /// en:  **'Talks'**
  String get homeBottomNavigationTalks => _t(LocalizationKeys.homeBottomNavigationTalks);

  /// Translations:
  ///
  /// en:  **'Login'**
  String get loginBtn => _t(LocalizationKeys.loginBtn);

  /// Translations:
  ///
  /// en:  **'Save'**
  String get nameAddBtn => _t(LocalizationKeys.nameAddBtn);

  /// Translations:
  ///
  /// en:  **'Your name'**
  String get nameAddInputNameLabel => _t(LocalizationKeys.nameAddInputNameLabel);

  /// Translations:
  ///
  /// en:  **'What is your name?'**
  String get nameAddTitle => _t(LocalizationKeys.nameAddTitle);

  /// Translations:
  ///
  /// en:  **'You already entered today's raffle'**
  String get raffleBodyAlreadyEntered => _t(LocalizationKeys.raffleBodyAlreadyEntered);

  /// Translations:
  ///
  /// en:  **'You already won today'**
  String get raffleBodyAlreadyWonToday => _t(LocalizationKeys.raffleBodyAlreadyWonToday);

  /// Translations:
  ///
  /// en:  **'Enter raffle'**
  String get raffleBodyEnterBtn => _t(LocalizationKeys.raffleBodyEnterBtn);

  /// Translations:
  ///
  /// en:  **'at $1%s'**
  String raffleBodyLocation(String arg1) => _t(LocalizationKeys.raffleBodyLocation, args: <dynamic>[arg1]);

  /// Translations:
  ///
  /// en:  **'No raffle today'**
  String get raffleBodyNoRaffle => _t(LocalizationKeys.raffleBodyNoRaffle);

  /// Translations:
  ///
  /// en:  **'Thanks $1%s for attending the meetup '**
  String raffleBodyThanks(String arg1) => _t(LocalizationKeys.raffleBodyThanks, args: <dynamic>[arg1]);

  /// Translations:
  ///
  /// en:  **'Raffle'**
  String get raffleTitle => _t(LocalizationKeys.raffleTitle);

  /// Translations:
  ///
  /// en:  **'Account'**
  String get settingsSectionAccount => _t(LocalizationKeys.settingsSectionAccount);

  /// Translations:
  ///
  /// en:  **'Delete account'**
  String get settingsSectionAccountDeleteAccount => _t(LocalizationKeys.settingsSectionAccountDeleteAccount);

  /// Translations:
  ///
  /// en:  **'Logout'**
  String get settingsSectionAccountLogout => _t(LocalizationKeys.settingsSectionAccountLogout);

  /// Translations:
  ///
  /// en:  **'Settings'**
  String get settingsTitle => _t(LocalizationKeys.settingsTitle);

  /// Translations:
  ///
  /// en:  **'No talks found'**
  String get talksListNoData => _t(LocalizationKeys.talksListNoData);

  /// Translations:
  ///
  /// en:  **'Talks'**
  String get talksListTitle => _t(LocalizationKeys.talksListTitle);

  String getTranslation(String key, {List<dynamic>? args}) => _t(key, args: args ?? <dynamic>[]);
}
