import 'package:flutter/foundation.dart';
import 'package:flutter_belgium/di/injectable.dart';
import 'package:flutter_belgium/model/data/remote_config/remote_config_data.dart';
import 'package:flutter_belgium/repo/login/login_repo.dart';
import 'package:flutter_belgium/util/locale/localization.dart';
import 'package:flutter_belgium/widget/raffle/add_participant_dialog.dart';
import 'package:flutter_navigation_generator_annotations/flutter_navigation_generator_annotations.dart';
import 'package:flutter_belgium/navigator/main_navigator.navigator.dart';
import 'package:impaktfull_architecture/impaktfull_architecture.dart';

@lazySingleton
@flutterNavigator
class MainNavigator with BaseNavigator {
  Future<void> goToNextOnboardingScreen() async {
    if (getIt<LoginRepository>().isLoggedIn) {
      if (kIsWeb) {
        goToRaffleScreen();
        return;
      }
      goToHomeScreen();
    } else {
      goToLoginScreen();
    }
  }

  void showError(String title, {required Object error, required StackTrace trace}) {
    var fullMessage = '';
    if (error is BaseLocalizedError) {
      fullMessage = error.errorLocalizationKey;
    }
    fullMessage = '${error.toString()}\n\n$trace';
    showErrorMessage(title, message: fullMessage);
  }

  void showErrorMessage(String title, {String? message}) {
    final context = navigatorKey.currentContext;
    if (context == null) return;
  }

  void showMessage(String message) {
    final context = navigatorKey.currentContext;
    if (context == null) return;
  }

  Future<String?> goToAddParticipantDialog() => showDialog<String>(
        context: navigatorKey.currentContext!,
        builder: (context) => const AddParticipantDialog(),
      );

  Future<bool> showConfimDialog({
    required String title,
    required String body,
    required String primaryLabel,
    String secondaryLabel = 'Cancel',
  }) async {
    final localization = Localization.of(navigatorKey.currentContext!);

    final result = await showDialog<bool>(
      context: navigatorKey.currentContext!,
      builder: (context) => ImpaktfullDialog(
        title: localization.getTranslation(title),
        body: localization.getTranslation(body),
        primaryButtonType: ImpaktfullDialogPrimaryButtonType.danger,
        secondaryLabel: localization.getTranslation(secondaryLabel),
        primaryLabel: localization.getTranslation(primaryLabel),
        onPrimaryTapped: () => goBackWithResult(result: true),
        onSecondaryTapped: () => goBackWithResult(result: false),
      ),
    );
    return result == true;
  }

  Future<void> openAppStore() async => launchUrl(Uri.parse(RemoteConfigData.instance.updateUrl));
}
