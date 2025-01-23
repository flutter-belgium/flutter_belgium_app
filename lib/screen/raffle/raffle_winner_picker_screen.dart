import 'package:flutter/widgets.dart';
import 'package:flutter_belgium/theme/theme_colors.dart';
import 'package:flutter_belgium/viewmodel/raffle/raffle_winner_picker_viewmodel.dart';
import 'package:flutter_belgium/widget/general/button.dart';
import 'package:flutter_belgium/widget/raffle/custom_confetti.dart';
import 'package:flutter_belgium/widget/raffle/custom_fortune_wheel.dart';
import 'package:flutter_navigation_generator_annotations/flutter_navigation_generator_annotations.dart';
import 'package:flutter_belgium/di/injectable.dart';
import 'package:flutter_belgium/widget/provider/provider_widget.dart';
import 'package:impaktfull_architecture/impaktfull_architecture.dart';

@FlutterRoute(
  navigationType: NavigationType.push,
)
class RaffleWinnerPickerScreen extends StatelessWidget {
  const RaffleWinnerPickerScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<RaffleWinnerPickerViewModel>(
      create: () => getIt()..init(),
      builder: (context, viewModel) => ImpaktfullUiScreen(
        child: Builder(builder: (context) {
          if (viewModel.hasInactiveRaffle) {
            return Center(
              child: Button(
                onTap: viewModel.onMakeRaffleActiveTapped,
                text: 'Make raffle active',
                fullWidth: false,
              ),
            );
          }
          return Row(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Padding(
                        padding: const EdgeInsets.all(48),
                        child: Builder(
                          builder: (context) {
                            if (viewModel.isLoading) {
                              return Container();
                            }
                            return Column(
                              children: [
                                Expanded(
                                  child: Builder(
                                    builder: (context) {
                                      if (!viewModel.hasEnoughParticipants) {
                                        return Center(
                                          child: Text(
                                              'Not enough participants, ${viewModel.participants.length} participant(s) entered this raffle. (min ${viewModel.minRequiredParticipants} required)'),
                                        );
                                      }
                                      return CustomFortuneWheel(
                                        selected: viewModel.selectedIndexStream,
                                        participants: viewModel.participants,
                                      );
                                    },
                                  ),
                                ),
                                Text(
                                  viewModel.winnerName == null ? '' : '${viewModel.winnerName} won!',
                                  style: const TextStyle(
                                    fontSize: 45,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
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
              Container(
                width: 350,
                padding: const EdgeInsets.all(16),
                color: ThemeColors.primaryUltraLight,
                alignment: Alignment.center,
                child: SafeArea(
                  child: Builder(builder: (context) {
                    if (viewModel.isLoading) {
                      return const ImpaktfullUiLoadingIndicator();
                    }
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Participants list (${viewModel.participants.length})',
                                style: const TextStyle(
                                  fontSize: 24,
                                ),
                              ),
                            ),
                            Button(
                              onTap: viewModel.onAddParticipantTapped,
                              text: '+',
                              fullWidth: false,
                            ),
                          ],
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: viewModel.participants.length,
                            itemBuilder: (context, index) {
                              final item = viewModel.participants[index];
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                child: Text(
                                  item.name,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        if (viewModel.hasEnoughParticipants && viewModel.winnerName == null) ...[
                          Center(
                            child: Button(
                              onTap: viewModel.onPickWinnerTapped,
                              text: 'Pick Winner',
                              fullWidth: false,
                            ),
                          ),
                        ]
                      ],
                    );
                  }),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
