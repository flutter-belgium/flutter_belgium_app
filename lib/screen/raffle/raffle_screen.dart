import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_belgium/theme/theme_assets.dart';
import 'package:flutter_belgium/viewmodel/raffle/raffle_viewmodel.dart';
import 'package:flutter_belgium/widget/admin/shortcut_manager.dart';
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
      builderWithThemeAndLocalizations: (context, viewModel, theme, localization) => ShortcutsManager(
        onStartFortuneWheel: kIsWeb ? viewModel.onStartFortuneWheel : null,
        child: ImpaktfullUiScreen(
          title: localization.raffleTitle,
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
                            SvgPicture.asset(
                              ThemeAssets.flutterBelgiumLogo,
                            ),
                            const SizedBox(height: 32),
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                style: Theme.of(context).textTheme.headlineSmall,
                                children: [
                                  TextSpan(
                                    text: localization.raffleBodyThanks(viewModel.user),
                                  ),
                                  if (viewModel.meetupLocation != null) ...[
                                    TextSpan(
                                      text: localization.raffleBodyLocation(viewModel.meetupLocation!),
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
                    color: theme.colors.card2,
                    alignment: Alignment.center,
                    child: SafeArea(
                      top: false,
                      child: Builder(builder: (context) {
                        if (viewModel.isLoading) {
                          return const ImpaktfullUiLoadingIndicator();
                        }
                        if (viewModel.hasAlreadyWonRaffle) {
                          return Text(
                            localization.raffleBodyAlreadyWonToday,
                            style: Theme.of(context).textTheme.labelLarge,
                          );
                        }
                        if (viewModel.hasEnteredRaffle) {
                          return Text(
                            localization.raffleBodyAlreadyEntered,
                            style: Theme.of(context).textTheme.labelLarge,
                          );
                        }
                        if (viewModel.hasRaffle) {
                          return ImpaktfullUiButton(
                            type: ImpaktfullUiButtonType.primary,
                            title: localization.raffleBodyEnterBtn,
                            onTap: viewModel.onEnterRaffleTapped,
                          );
                        }
                        return Text(
                          localization.raffleBodyNoRaffle,
                          style: theme.textStyles.onCard.text.small,
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
