import 'package:flutter_belgium/navigator/main_navigator.navigator.dart';
import 'package:flutter_belgium/theme/app_theme.dart';
import 'package:flutter_belgium/widget/debug/flavor_flag.dart';
import 'package:flutter_belgium/widget/di/dependency_tree.dart';
import 'package:impaktfull_architecture/impaktfull_architecture.dart';

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DependencyTreeWidget(
      builder: (context, globalViewModel, translationsViewmodel, mainNavigator) => FlavorBanner(
        child: ImpaktfullApp(
          title: 'Impaktfull Flutter Template',
          impaktfullTheme: AppTheme.getTheme(),
          locale: translationsViewmodel.locale,
          supportedLocales: translationsViewmodel.supportedLocales,
          localizationsDelegates: translationsViewmodel.localizationDelegates,
          navigatorKey: mainNavigator.navigatorKey,
          initialRoute: RouteNames.splashScreen,
          onGenerateRoute: mainNavigator.onGenerateRoute,
        ),
      ),
    );
  }
}
