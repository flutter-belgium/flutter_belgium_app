import 'package:flutter_belgium/theme/theme_colors.dart';
import 'package:impaktfull_architecture/impaktfull_architecture.dart';

class AppTheme {
  static ImpaktfullUiTheme getTheme() => ImpaktfullUiTheme.custom(
        primary: ThemeColors.primary,
        accent: ThemeColors.primaryLight,
        secondary: ThemeColors.primaryUltraLight,
        package: null,
      );
}
