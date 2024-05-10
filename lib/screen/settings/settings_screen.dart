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
      builder: (context, viewModel) => ImpaktfullScreen(
        title: 'Settings',
        child: ImpaktfullListView(
          children: [
            ImpaktfullSeparatedColumn(
              title: 'Account',
              type: ImpaktfullSeparatorType.card,
              children: [
                ImpaktfullListItem.danger(
                  title: 'Delete account',
                  onAsyncTap: viewModel.onDeleteAccountTapped,
                ),
                ImpaktfullListItem(
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
