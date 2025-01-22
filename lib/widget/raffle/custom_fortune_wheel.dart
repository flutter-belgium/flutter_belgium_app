import 'package:flutter/material.dart';
import 'package:flutter_belgium/model/data/raffle/participant.dart';
import 'package:flutter_belgium/theme/theme_colors.dart';
import 'package:flutter_crazy_fortune_wheel/flutter_crazy_fortune_wheel.dart';

class CustomFortuneWheel extends StatelessWidget {
  final int winnerIndex;
  final Animation<double> animation;
  final List<RaffleParticipant> participants;

  const CustomFortuneWheel({
    required this.winnerIndex,
    required this.animation,
    required this.participants,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RandomWheel(
      animation: animation,
      winnerIndex: winnerIndex,
      children: participants
          .map(
            (participant) => Text(
              participant.name,
              style: const TextStyle(
                color: ThemeColors.primary,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
          .toList(),
    );
  }
}
