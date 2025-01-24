import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_belgium/widget/provider/app_theme_localizer.dart';

class CustomConfettiWidget extends StatelessWidget {
  final ConfettiController confettiController;

  const CustomConfettiWidget({
    required this.confettiController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppThemeLocalizer(
      builder: (context, theme, localization) => ConfettiWidget(
        confettiController: confettiController,
        blastDirectionality: BlastDirectionality.explosive, // don't specify a direction, blast randomly
        shouldLoop: true, // start again as soon as the animation is finished
        minimumSize: const Size(20, 10),
        maximumSize: const Size(50, 30),
        colors: [
          theme.customTheme.colors.brand1,
          theme.customTheme.colors.brand2,
          theme.customTheme.colors.brand3,
        ],
      ),
    );
  }
}
