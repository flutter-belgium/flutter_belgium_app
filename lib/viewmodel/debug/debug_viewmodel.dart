import 'package:flutter/foundation.dart';
import 'package:flutter_belgium/navigator/main_navigator.dart';
import 'package:flutter_belgium/util/locale/localization.dart';
import 'package:flutter_belgium/viewmodel/global/global_viewmodel.dart';
import 'package:flutter_belgium/viewmodel/global/translations_viewmodel.dart';
import 'package:impaktfull_architecture/impaktfull_architecture.dart';

@injectable
class DebugViewModel extends ChangeNotifierEx {
  final GlobalViewModel _globalViewModel;
  final TranslationsViewmodel _translationsViewmodel;
  final MainNavigator _mainNavigator;

  DebugViewModel(
    this._globalViewModel,
    this._translationsViewmodel,
    this._mainNavigator,
  );

  Future<void> init() async {}

  String getCurrentLanguage(Localization localization) => _translationsViewmodel.getCurrentLanguage(localization);

  String getCurrentTargetPlatform(Localization localization) {
    switch (_globalViewModel.targetPlatform) {
      case TargetPlatform.android:
        return localization.generalSystemTargetAndroid;
      case TargetPlatform.iOS:
        return localization.generalSystemTargetIos;
      default:
        return localization.generalSystemTargetDefault;
    }
  }

  void onChangeLanguageTapped() => _mainNavigator.goToDebugChangeLanguageScreen();

  void onChangeTargetPlatformTapped() => _mainNavigator.goToDebugChangeTargetPlatformScreen();

  void onBackTapped() => _mainNavigator.goBack();
}
