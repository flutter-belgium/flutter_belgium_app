import 'package:flutter/widgets.dart';
import 'package:flutter_belgium/util/locale/localization.dart';
import 'package:impaktfull_architecture/impaktfull_architecture.dart';

class AppThemeLocalizer extends StatelessWidget {
  final Widget Function(BuildContext context, ImpaktfullUiTheme theme)? builderTheme;
  final Widget Function(BuildContext context, Localization localization)? builderLocalizations;
  final Widget Function(BuildContext context, ImpaktfullUiTheme theme, Localization localization)? builder;

  const AppThemeLocalizer({
    this.builder,
    this.builderTheme,
    this.builderLocalizations,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ThemeLocalizer(
      builder: builder,
      builderTheme: builderTheme,
      builderLocalization: builderLocalizations,
    );
  }
}
