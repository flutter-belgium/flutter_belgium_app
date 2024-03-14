import 'package:flutter/widgets.dart';
import 'package:flutter_belgium/di/injectable.dart';
import 'package:flutter_belgium/navigator/main_navigator.dart';
import 'package:flutter_belgium/viewmodel/global/global_viewmodel.dart';
import 'package:flutter_belgium/viewmodel/global/translations_viewmodel.dart';
import 'package:flutter_belgium/widget/provider/provider_widget.dart';

class DependencyTreeWidget extends StatelessWidget {
  final Widget Function(
    BuildContext,
    GlobalViewModel,
    TranslationsViewmodel,
    MainNavigator mainNavigator,
  ) builder;

  const DependencyTreeWidget({
    required this.builder,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<GlobalViewModel>(
      create: () => getIt()..init(),
      builder: (context, globalViewModel) => ProviderWidget<TranslationsViewmodel>(
        create: () => getIt()..init(),
        builder: (context, translationsViewModel) => builder(
          context,
          globalViewModel,
          translationsViewModel,
          getIt<MainNavigator>(),
        ),
      ),
    );
  }
}
