import 'package:flutter/material.dart';
import 'package:flutter_belgium/style/theme.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) => const CircularProgressIndicator(
        color: ThemeColors.primary,
      );
}
