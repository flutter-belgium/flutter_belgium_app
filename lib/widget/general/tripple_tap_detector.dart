import 'package:flutter/material.dart';
import 'dart:async';

class TripleTapDetector extends StatefulWidget {
  final Widget child;
  final VoidCallback onTripleTap;
  final Duration timeWindow;

  const TripleTapDetector({
    required this.child,
    required this.onTripleTap,
    this.timeWindow = const Duration(seconds: 1),
    super.key,
  });

  @override
  State<TripleTapDetector> createState() => _TripleTapDetectorState();
}

class _TripleTapDetectorState extends State<TripleTapDetector> {
  int tapCount = 0;
  Timer? tapTimer;

  @override
  void dispose() {
    tapTimer?.cancel();
    super.dispose();
  }

  void handleTap() {
    setState(() {
      tapCount++;
      if (tapCount == 3) {
        widget.onTripleTap();
        tapCount = 0;
      }

      tapTimer?.cancel();
      tapTimer = Timer(widget.timeWindow, () {
        setState(() {
          tapCount = 0;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: handleTap,
      child: widget.child,
    );
  }
}
