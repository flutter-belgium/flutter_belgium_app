import 'package:flutter/material.dart';
import 'package:flutter_navigation_generator_annotations/flutter_navigation_generator_annotations.dart';
import 'package:flutter_belgium/di/injectable.dart';
import 'package:flutter_belgium/viewmodel/debug/debug_change_target_platform_viewmodel.dart';
import 'package:flutter_belgium/widget/provider/provider_widget.dart';
import 'package:impaktfull_architecture/impaktfull_architecture.dart';

@flutterRoute
class DebugChangeTargetPlatformScreen extends StatelessWidget {
  const DebugChangeTargetPlatformScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<DebugChangeTargetPlatformViewModel>(
      create: () => getIt()..init(),
      builderWithThemeAndLocalizations: (context, viewModel, theme, localization) => ImpaktfullUiScreen(
        title: localization.debugChangeLanguageTitle,
        onBackTapped: viewModel.onBackTapped,
        child: ImpaktfullUiListView(
          children: [
            ImpaktfullUiSeparatedColumn(
              children: [
                for (final item in viewModel.supportedTargetPlatforms)
                  ImpaktfullUiSimpleListItem(
                    title: viewModel.getTranslation(item, localization),
                    onTap: () => viewModel.onLocaleTapped(item),
                    trailingWidgetBuilder: viewModel.isTargetPlatformSelected(item)
                        ? (context) => Icon(
                              Icons.check,
                              size: 16,
                              color: theme.colors.accent,
                            )
                        : null,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
