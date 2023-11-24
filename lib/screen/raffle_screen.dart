import 'package:flutter/material.dart';
import 'package:flutter_belgium/style/theme.dart';
import 'package:flutter_belgium/style/theme_assets.dart';
import 'package:flutter_belgium/widget/admin/shortcut_manager.dart';
import 'package:flutter_belgium/widget/general/button.dart';
import 'package:flutter_belgium/widget/general/loading.dart';
import 'package:flutter_belgium/widget/general/tripple_tap_detector.dart';
import 'package:flutter_belgium/widget/raffle/custom_confetti.dart';
import 'package:flutter_navigation_generator_annotations/flutter_navigation_generator_annotations.dart';
import 'package:flutter_belgium/di/injectable.dart';
import 'package:flutter_belgium/viewmodel/raffle_viewmodel.dart';
import 'package:flutter_belgium/widget/provider/provider_widget.dart';
import 'package:flutter_svg/svg.dart';

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
        onStartFortuneWheel: viewModel.onStartFortuneWheel,
        child: Scaffold(
          body: Stack(
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
                    child: Builder(builder: (context) {
                      if (viewModel.isLoading) {
                        return const Loading();
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
                        return Button(
                          onTap: viewModel.onEnterRaffleTapped,
                          text: 'Enter raffle',
                        );
                      }
                      return Text(
                        'No raffle today',
                        style: Theme.of(context).textTheme.labelLarge,
                      );
                    }),
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
