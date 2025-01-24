import 'package:flutter/widgets.dart';
import 'package:flutter_belgium/di/injectable.dart';
import 'package:flutter_belgium/viewmodel/force_update/force_update_viewmodel.dart';
import 'package:flutter_belgium/widget/provider/provider_widget.dart';
import 'package:flutter_navigation_generator_annotations/flutter_navigation_generator_annotations.dart';
import 'package:impaktfull_architecture/impaktfull_architecture.dart';

@FlutterRoute(
  navigationType: NavigationType.pushAndReplaceAll,
)
class ForceUpdateScreen extends StatelessWidget {
  const ForceUpdateScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<ForceUpdateViewModel>(
      create: () => getIt()..init(),
      builderWithThemeAndLocalizations: (context, viewModel, theme, localization) => ImpaktfullUiScreen(
        title: localization.forceUpdateTitle,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ImpaktfullUiAutoLayout.vertical(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 8,
            children: [
              Text(
                localization.forceUpdateBody,
                style: theme.textStyles.onCanvas.text.small,
                textAlign: TextAlign.center,
              ),
              ImpaktfullUiButton(
                type: ImpaktfullUiButtonType.primary,
                title: localization.forceUpdateBtn,
                onTap: viewModel.onUpdateTapped,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
