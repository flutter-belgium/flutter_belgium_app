import 'package:flutter/widgets.dart';
import 'package:flutter_belgium/di/injectable.dart';
import 'package:flutter_belgium/screen/raffle/raffle_screen.dart';
import 'package:flutter_belgium/screen/settings/settings_screen.dart';
import 'package:flutter_belgium/screen/event/events_screen.dart';
import 'package:flutter_belgium/screen/talk/talks_screen.dart';
import 'package:flutter_belgium/viewmodel/home/home_viewmodel.dart';
import 'package:flutter_belgium/widget/provider/provider_widget.dart';
import 'package:flutter_navigation_generator_annotations/flutter_navigation_generator_annotations.dart';
import 'package:impaktfull_architecture/impaktfull_architecture.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

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
      builderWithThemeAndLocalizations: (context, viewModel, theme, localization) => ImpaktfullUiScreen(
        child: ImpaktfullUiAutoLayout.vertical(
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
            ImpaktfullUiBottomNavigation(
              items: [
                ImpaktfullUiBottomNavigationItem(
                  label: 'Events',
                  asset: ImpaktfullUiAsset.icon(PhosphorIcons.ticket()),
                  selectedAsset: ImpaktfullUiAsset.icon(PhosphorIcons.ticket(PhosphorIconsStyle.fill)),
                  isSelected: viewModel.index == 0,
                  onTap: () => viewModel.onTapSelected(0),
                ),
                // ImpaktfullUiBottomNavigationItem(
                //   label: 'Talks',
                //   asset: ImpaktfullUiAsset.icon(PhosphorIcons.microphoneStage()),
                //   selectedAsset: ImpaktfullUiAsset.icon(PhosphorIcons.microphoneStage(PhosphorIconsStyle.fill)),
                //   isSelected: viewModel.index == 1,
                //   onTap: () => viewModel.onTapSelected(1),
                // ),
                ImpaktfullUiBottomNavigationItem(
                  label: 'Raffle',
                  asset: ImpaktfullUiAsset.icon(PhosphorIcons.ranking()),
                  selectedAsset: ImpaktfullUiAsset.icon(PhosphorIcons.ranking(PhosphorIconsStyle.fill)),
                  isSelected: viewModel.index == 2,
                  onTap: () => viewModel.onTapSelected(2),
                ),
                ImpaktfullUiBottomNavigationItem(
                  label: 'Settings',
                  asset: ImpaktfullUiAsset.icon(PhosphorIcons.gear()),
                  selectedAsset: ImpaktfullUiAsset.icon(PhosphorIcons.gear(PhosphorIconsStyle.fill)),
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
