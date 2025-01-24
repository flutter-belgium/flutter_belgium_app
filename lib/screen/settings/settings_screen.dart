import 'package:flutter/widgets.dart';
import 'package:flutter_belgium/di/injectable.dart';
import 'package:flutter_belgium/viewmodel/settings/settings_viewmodel.dart';
import 'package:flutter_belgium/widget/provider/provider_widget.dart';
import 'package:impaktfull_architecture/impaktfull_architecture.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<SettingsViewmodel>(
      create: () => getIt()..init(),
      builderWithThemeAndLocalizations: (context, viewModel, theme, localization) => ImpaktfullUiScreen(
        title: localization.settingsTitle,
        child: ImpaktfullUiListView(
          padding: const EdgeInsets.all(16),
          children: [
            ImpaktfullUiSeparatedColumn(
              title: localization.settingsSectionAccount,
              children: [
                ImpaktfullUiListItem(
                  type: ImpaktfullUiListItemType.danger,
                  title: localization.settingsSectionAccountDeleteAccount,
                  onAsyncTap: viewModel.onDeleteAccountTapped,
                ),
                ImpaktfullUiListItem(
                  title: localization.settingsSectionAccountLogout,
                  onAsyncTap: viewModel.onSignOutTapped,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
