import 'package:flutter/foundation.dart';

class ThemeDuration {
  const ThemeDuration._();

  static const confettiDuration = Duration(seconds: 5);
  static const raffleWheelDuration = Duration(seconds: 3);

  static const nextRoundDelayDuration = Duration(seconds: kDebugMode ? 5 : 30);
}
