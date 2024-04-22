import 'package:flutter/foundation.dart';
import 'package:flutter_belgium/theme/theme_assets.dart';
import 'package:flutter_belgium/theme/theme_colors.dart';
import 'package:flutter_belgium/viewmodel/raffle/raffle_viewmodel.dart';
import 'package:flutter_belgium/widget/admin/shortcut_manager.dart';
import 'package:flutter_belgium/widget/general/tripple_tap_detector.dart';
import 'package:flutter_belgium/widget/raffle/custom_confetti.dart';
import 'package:flutter_belgium/di/injectable.dart';
import 'package:flutter_belgium/widget/provider/provider_widget.dart';
import 'package:flutter_navigation_generator_annotations/flutter_navigation_generator_annotations.dart';
import 'package:impaktfull_architecture/impaktfull_architecture.dart';

@FlutterRoute(
  navigationType: NavigationType.pushAndReplaceAll,
)
class RaffleScreen extends StatelessWidget {
  const RaffleScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<RaffleViewModel>(
      create: () => getIt()..init(),
      builder: (context, viewModel) => ShortcutsManager(
        onStartFortuneWheel: kIsWeb ? viewModel.onStartFortuneWheel : null,
        child: ImpaktfullScreen(
          title: 'Raffle',
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TripleTapDetector(
                              onTripleTap: viewModel.onTripleTapLogo,
                              child: SvgPicture.asset(
                                ThemeAssets.flutterBelgiumLogo,
                              ),
                            ),
                            const SizedBox(height: 32),
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                style: Theme.of(context).textTheme.headlineSmall,
                                children: [
                                  TextSpan(
                                    text: 'Thanks ${viewModel.user} for attending the meetup ',
                                  ),
                                  if (viewModel.meetupLocation != null) ...[
                                    TextSpan(
                                      text: 'at ${viewModel.meetupLocation}',
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    color: ThemeColors.primaryUltraLight,
                    alignment: Alignment.center,
                    child: SafeArea(
                      top: false,
                      child: Builder(builder: (context) {
                        if (viewModel.isLoading) {
                          return const ImpaktfullLoadingIndicator();
                        }
                        if (viewModel.hasAlreadyWonRaffle) {
                          return Text(
                            "You already won today",
                            style: Theme.of(context).textTheme.labelLarge,
                          );
                        }
                        if (viewModel.hasEnteredRaffle) {
                          return Text(
                            "You already entered today's raffle",
                            style: Theme.of(context).textTheme.labelLarge,
                          );
                        }
                        if (viewModel.hasRaffle) {
                          return ImpaktfullButton.primary(
                            label: 'Enter raffle',
                            onTap: viewModel.onEnterRaffleTapped,
                          );
                        }
                        return Text(
                          'No raffle today',
                          style: Theme.of(context).textTheme.labelLarge,
                        );
                      }),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.topCenter,
                child: CustomConfettiWidget(
                  confettiController: viewModel.confettiController,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
