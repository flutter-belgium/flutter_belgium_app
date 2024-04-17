import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_belgium/di/injectable.dart';
import 'package:flutter_belgium/navigator/main_navigator.dart';
import 'package:impaktfull_architecture/impaktfull_architecture.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullScreen(
      title: 'Settings',
      child: ImpaktfullListView(
        children: [
          ImpaktfullListItem.danger(
            title: 'Sign out',
            onAsyncTap: () async {
              await getIt<FirebaseAuth>().signOut();
              getIt<MainNavigator>().goToLoginScreen();
            },
          ),
        ],
      ),
    );
  }
}
