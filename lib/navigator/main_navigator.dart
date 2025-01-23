import 'package:flutter/material.dart';
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
    final loginRepository = getIt<LoginRepository>();
    if (!loginRepository.isLoggedIn) {
      goToLoginScreen();
      return;
    }
    if (!loginRepository.hasUserName) {
      goToUserNameScreen();
      return;
    }
    goToHomeScreen();
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
    bool isDanger = false,
  }) async {
    final localization = Localization.of(navigatorKey.currentContext!);
    final result = await ImpaktfullUiModal.show(
      context: navigatorKey.currentContext!,
      builder: (context) => ImpaktfullUiModal(
        title: localization.getTranslation(title),
        hasClose: false,
        actions: [
          ImpaktfullUiButton(
            type: ImpaktfullUiButtonType.secondary,
            title: localization.getTranslation(secondaryLabel),
            onTap: () => goBackWithResult(result: false),
          ),
          ImpaktfullUiButton(
            type: isDanger ? ImpaktfullUiButtonType.destructivePrimary : ImpaktfullUiButtonType.primary,
            title: localization.getTranslation(primaryLabel),
            onTap: () => goBackWithResult(result: true),
          ),
        ],
        child: SizedBox(
          width: double.infinity,
          child: Text(
            localization.getTranslation(body),
            style: theme.textStyles.onCard.text.small,
          ),
        ),
      ),
    );
    return result == true;
  }

  Future<void> openAppStore() async => launchUrl(Uri.parse(RemoteConfigData.instance.updateUrl));

  Future<bool?> showLogoutDialog() => showConfimDialog(
        title: 'Logout',
        body: 'Are you sure you want to logout',
        primaryLabel: 'Logout',
      );

  Future<bool> showDeleteAccountDialog() => showConfimDialog(
        title: 'Delete account',
        body: 'Are you sure you want to delete your account',
        primaryLabel: 'Delete',
        isDanger: true,
      );
}
