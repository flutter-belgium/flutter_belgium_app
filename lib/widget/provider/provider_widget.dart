import 'package:flutter_belgium/util/locale/localization.dart';
import 'package:impaktfull_architecture/impaktfull_architecture.dart';

class ProviderWidget<T extends ChangeNotifier> extends StatelessWidget {
  final Widget Function(
    BuildContext context,
    T viewModel,
  )? builder;
  final Widget Function(
    BuildContext context,
    T viewModel,
    ImpaktfullTheme theme,
    Localization localization,
  )? builderWithThemeAndLocalizations;
  final T Function() create;

  const ProviderWidget({
    required this.create,
    this.builder,
    this.builderWithThemeAndLocalizations,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BaseProviderWidget<T, ImpaktfullTheme, Localization>(
      create: () => create(),
      builder: builder,
      builderWithThemeAndLocalizations: builderWithThemeAndLocalizations,
    );
  }
}
