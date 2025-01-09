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
      builder: (context, viewModel) => ImpaktfullUiScreen(
        title: 'Settings',
        child: ImpaktfullUiListView(
          padding: const EdgeInsets.all(16),
          children: [
            ImpaktfullUiSeparatedColumn(
              title: 'Account',
              children: [
                ImpaktfullUiListItem(
                  type: ImpaktfullUiListItemType.danger,
                  title: 'Delete account',
                  onAsyncTap: viewModel.onDeleteAccountTapped,
                ),
                ImpaktfullUiListItem(
                  title: 'Sign out',
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
