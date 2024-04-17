import 'package:flutter_belgium/screen/raffle/raffle_screen.dart';
import 'package:flutter_belgium/screen/settings/settings_screen.dart';
import 'package:flutter_belgium/theme/theme_assets.dart';
import 'package:flutter_navigation_generator_annotations/flutter_navigation_generator_annotations.dart';
import 'package:impaktfull_architecture/impaktfull_architecture.dart';

@FlutterRoute(
  navigationType: NavigationType.pushAndReplaceAll,
)
class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ImpaktfullThemeLocalizer(
      builder: (context, theme) => ImpaktfullScreen(
        child: ImpaktfullAutoLayout.vertical(
          children: [
            Expanded(
              child: IndexedStack(
                index: _selectedIndex,
                children: const [
                  RaffleScreen(),
                  SettingsScreen(),
                ],
              ),
            ),
            ImpaktfullBottomNavigation(
              items: [
                ImpaktfullBottomNavigationItem(
                  label: 'Home',
                  svgIcon: ThemeAssets.iconHome,
                  svgIconSelected: ThemeAssets.iconHomeSelected,
                  isSelected: _selectedIndex == 0,
                  onTap: () => setState(() => _selectedIndex = 0),
                ),
                ImpaktfullBottomNavigationItem(
                  label: 'Settings',
                  svgIcon: ThemeAssets.iconSettings,
                  svgIconSelected: ThemeAssets.iconSettingsSelected,
                  isSelected: _selectedIndex == 1,
                  onTap: () => setState(() => _selectedIndex = 1),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
