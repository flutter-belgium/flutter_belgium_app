import 'package:flutter_belgium/di/injectable.dart';
import 'package:flutter_belgium/screen/raffle/raffle_screen.dart';
import 'package:flutter_belgium/screen/settings/settings_screen.dart';
import 'package:flutter_belgium/screen/talk/talks_screen.dart';
import 'package:flutter_belgium/theme/theme_assets.dart';
import 'package:flutter_belgium/screen/event/events_screen.dart';
import 'package:flutter_belgium/viewmodel/home/home_viewmodel.dart';
import 'package:flutter_belgium/widget/provider/provider_widget.dart';
import 'package:flutter_navigation_generator_annotations/flutter_navigation_generator_annotations.dart';
import 'package:impaktfull_architecture/impaktfull_architecture.dart';

@FlutterRoute(
  navigationType: NavigationType.pushAndReplaceAll,
)
class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<HomeViewmodel>(
      create: () => getIt()..init(),
      builderWithThemeAndLocalizations: (context, viewModel, theme, localization) => ImpaktfullScreen(
        child: ImpaktfullAutoLayout.vertical(
          children: [
            Expanded(
              child: MediaQuery.removePadding(
                context: context,
                removeBottom: true,
                child: IndexedStack(
                  index: viewModel.index,
                  children: const [
                    EventsScreen(),
                    TalksScreen(),
                    RaffleScreen(),
                    SettingsScreen(),
                  ],
                ),
              ),
            ),
            ImpaktfullBottomNavigation(
              items: [
                ImpaktfullBottomNavigationItem(
                  label: 'Events',
                  svgIcon: ThemeAssets.iconEvents,
                  svgIconSelected: ThemeAssets.iconEventsSelected,
                  isSelected: viewModel.index == 0,
                  onTap: () => viewModel.onTapSelected(0),
                ),
                // ImpaktfullBottomNavigationItem(
                //   label: 'Talks',
                //   svgIcon: ThemeAssets.iconMicrophone,
                //   svgIconSelected: ThemeAssets.iconMicrophoneSelected,
                //   isSelected: viewModel.index == 1,
                //   onTap: () => viewModel.onTapSelected(1),
                // ),
                ImpaktfullBottomNavigationItem(
                  label: 'Raffle',
                  svgIcon: ThemeAssets.iconRaffle,
                  svgIconSelected: ThemeAssets.iconRaffleSelected,
                  isSelected: viewModel.index == 2,
                  onTap: () => viewModel.onTapSelected(2),
                ),
                ImpaktfullBottomNavigationItem(
                  label: 'Settings',
                  svgIcon: ThemeAssets.iconSettings,
                  svgIconSelected: ThemeAssets.iconSettingsSelected,
                  isSelected: viewModel.index == 3,
                  onTap: () => viewModel.onTapSelected(3),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
