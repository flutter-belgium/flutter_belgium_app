import 'package:flutter_navigation_generator_annotations/flutter_navigation_generator_annotations.dart';
import 'package:flutter_belgium/di/injectable.dart';
import 'package:flutter_belgium/viewmodel/debug/debug_viewmodel.dart';
import 'package:flutter_belgium/widget/provider/provider_widget.dart';
import 'package:impaktfull_architecture/impaktfull_architecture.dart';

@flutterRoute
class DebugScreen extends StatelessWidget {
  const DebugScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<DebugViewModel>(
      create: () => getIt()..init(),
      builderWithThemeAndLocalizations: (context, viewModel, theme, localization) => ImpaktfullScreen(
        onBackTapped: viewModel.onBackTapped,
        title: localization.debugTitle,
        child: ImpaktfullListView(
          children: [
            ImpaktfullSeparatedColumn(
              type: ImpaktfullSeparatorType.card,
              children: [
                ImpaktfullListItem(
                  title: localization.debugListItemChangeLangague,
                  subTitle: viewModel.getCurrentLanguage(localization),
                  onTap: viewModel.onChangeLanguageTapped,
                ),
                ImpaktfullListItem(
                  title: localization.debugChangeTargetPlatform,
                  subTitle: viewModel.getCurrentTargetPlatform(localization),
                  onTap: viewModel.onChangeTargetPlatformTapped,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
