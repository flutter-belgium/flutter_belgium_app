import 'package:flutter_belgium/widget/raffle/add_participant_dialog.dart';
import 'package:flutter_navigation_generator_annotations/flutter_navigation_generator_annotations.dart';
import 'package:flutter_belgium/navigator/main_navigator.navigator.dart';
import 'package:impaktfull_architecture/impaktfull_architecture.dart';

@lazySingleton
@flutterNavigator
class MainNavigator with BaseNavigator {
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
}
