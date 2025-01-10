import 'dart:ui';

import 'package:flutter_belgium/theme/theme_colors.dart';
import 'package:impaktfull_architecture/impaktfull_architecture.dart';

class AppTheme {
  static ImpaktfullUiTheme<AppTheme> getTheme() => ImpaktfullUiTheme.custom(
        primary: ThemeColors.primary,
        accent: ThemeColors.primaryLight,
        secondary: ThemeColors.primaryUltraLight,
        package: null,
        customTheme: AppTheme(
          colors: AppThemeColors(
            brand1: ThemeColors.beBlack,
            brand2: ThemeColors.beYellow,
            brand3: ThemeColors.beRed,
          ),
        ),
      );

  final AppThemeColors colors;

  const AppTheme({
    required this.colors,
  });
}

class AppThemeColors {
  final Color brand1;
  final Color brand2;
  final Color brand3;

  const AppThemeColors({
    required this.brand1,
    required this.brand2,
    required this.brand3,
  });
}
