import 'package:flutter/widgets.dart';
import 'package:flutter_belgium/viewmodel/login/user_name_viewmodel.dart';
import 'package:flutter_navigation_generator_annotations/flutter_navigation_generator_annotations.dart';
import 'package:flutter_belgium/di/injectable.dart';
import 'package:flutter_belgium/widget/provider/provider_widget.dart';
import 'package:impaktfull_architecture/impaktfull_architecture.dart';

@FlutterRoute(
  navigationType: NavigationType.pushAndReplaceAll,
)
class UserNameScreen extends StatelessWidget {
  const UserNameScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<UserNameViewModel>(
      create: () => getIt()..init(),
      builder: (context, viewModel) => ImpaktfullUiScreen(
        title: 'What is your name?',
        bottomChild: ImpaktfullUiBottomActions(
          children: [
            ImpaktfullUiButton(
              type: ImpaktfullUiButtonType.primary,
              title: 'Save',
              fullWidth: true,
              onTap: viewModel.onSaveTapped,
            )
          ],
        ),
        child: ImpaktfullUiListView(
          padding: const EdgeInsets.all(16),
          children: [
            ImpaktfullUiInputField(
              label: 'Your name',
              value: viewModel.userName,
              onChanged: viewModel.onUserNameUpdated,
            ),
          ],
        ),
      ),
    );
  }
}
