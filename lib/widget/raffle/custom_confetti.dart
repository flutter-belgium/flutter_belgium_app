import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_belgium/style/theme.dart';

class CustomConfettiWidget extends StatelessWidget {
  final ConfettiController confettiController;

  const CustomConfettiWidget({
    required this.confettiController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ConfettiWidget(
      confettiController: confettiController,
      blastDirectionality: BlastDirectionality.explosive, // don't specify a direction, blast randomly
      shouldLoop: true, // start again as soon as the animation is finished
      minimumSize: const Size(20, 10),
      maximumSize: const Size(50, 30),
      colors: const [
        ThemeColors.beBlack,
        ThemeColors.beYellow,
        ThemeColors.beRed,
      ],
    );
  }
}
