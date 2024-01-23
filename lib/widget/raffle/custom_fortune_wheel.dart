import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_belgium/model/data/raffle/participant.dart';
import 'package:flutter_belgium/style/theme.dart';
import 'package:flutter_belgium/style/theme_duration.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

class CustomFortuneWheel extends StatelessWidget {
  final Stream<int> selected;
  final List<RaffleParticipant> participants;

  const CustomFortuneWheel({
    required this.selected,
    required this.participants,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FortuneWheel(
      selected: selected,
      animateFirst: false,
      duration: ThemeDuration.raffleWheelDuration,
      rotationCount: Random().nextInt(10) + 20,
      indicators: const [
        FortuneIndicator(
          alignment: Alignment.topCenter,
          child: TriangleIndicator(
            color: ThemeColors.primary,
          ),
        ),
      ],
      physics: CircularPanPhysics(
        duration: const Duration(seconds: 1),
        curve: Curves.decelerate,
      ),
      items: [
        for (final participant in participants)
          FortuneItem(
            child: Text(
              participant.name,
              style: TextStyle(
                color: ThemeColors.primary,
                fontSize: participants.length > 30 ? 16 : 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: const FortuneItemStyle(
              color: ThemeColors.primaryUltraLight, // <-- custom circle slice fill color
              borderColor: ThemeColors.primary,
              borderWidth: 2,
            ),
          ),
      ],
    );
  }
}
