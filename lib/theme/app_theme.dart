import 'package:flutter_belgium/theme/theme_colors.dart';
import 'package:impaktfull_architecture/impaktfull_architecture.dart';

class AppTheme {
  static ImpaktfullTheme getTheme() => ImpaktfullTheme.fromColors(
        primary: ThemeColors.primary,
        accent1: ThemeColors.primaryLight,
        accent2: ThemeColors.primaryUltraLight,
        accent3: ThemeColors.primaryUltraLight,
      );
}
