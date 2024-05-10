import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FortuneWheelIntent extends Intent {
  const FortuneWheelIntent();
}

class ShortcutsManager extends StatelessWidget {
  final Widget child;
  final VoidCallback? onStartFortuneWheel;

  const ShortcutsManager({
    required this.child,
    required this.onStartFortuneWheel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: <ShortcutActivator, Intent>{
        if (onStartFortuneWheel != null) ...{
          const SingleActivator(
            LogicalKeyboardKey.enter,
            meta: true,
          ): const FortuneWheelIntent(),
        }
      },
      child: Actions(
        actions: <Type, Action<Intent>>{
          FortuneWheelIntent: CallbackAction<FortuneWheelIntent>(
            onInvoke: (intent) => onStartFortuneWheel?.call(),
          ),
        },
        child: Focus(
          autofocus: true,
          child: child,
        ),
      ),
    );
  }
}
