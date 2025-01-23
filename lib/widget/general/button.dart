import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_belgium/di/injectable.dart';
import 'package:flutter_belgium/navigator/main_navigator.dart';
import 'package:flutter_belgium/theme/theme_colors.dart';
import 'package:impaktfull_architecture/impaktfull_architecture.dart';

class Button extends StatefulWidget {
  final AsyncCallback onTap;
  final String? text;
  final Widget? child;
  final Color? color;
  final bool fullWidth;
  final EdgeInsets padding;

  const Button({
    required this.onTap,
    required this.text,
    this.color,
    this.fullWidth = true,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 12,
    ),
    super.key,
  }) : child = null;

  const Button.child({
    required this.onTap,
    required this.child,
    this.color,
    this.fullWidth = true,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 12,
    ),
    super.key,
  }) : text = null;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  var _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        if (_isLoading) ...[
          const SizedBox(
            width: 24,
            height: 24,
            child: ImpaktfullUiLoadingIndicator(),
          ),
        ],
        Opacity(
          opacity: _isLoading ? 0 : 1,
          child: IgnorePointer(
            ignoring: _isLoading,
            child: GestureDetector(
              onTap: _onTap,
              child: Container(
                width: widget.fullWidth && widget.text != null ? double.infinity : null,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 10,
                      spreadRadius: 4,
                      color: ThemeColors.shadow,
                    ),
                  ],
                  color: widget.color ?? ThemeColors.primary,
                ),
                padding: widget.padding,
                child: Builder(builder: (context) {
                  if (widget.child != null) return widget.child!;
                  return Text(
                    widget.text ?? '',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(color: ThemeColors.white),
                  );
                }),
              ),
            ),
          ),
        )
      ],
    );
  }

  Future<void> _onTap() async {
    if (_isLoading) return;
    setState(() => _isLoading = true);
    try {
      await widget.onTap();
    } catch (error, trace) {
      getIt<MainNavigator>().showError('Failed to complete action', error: error, trace: trace);
    }
    if (!mounted) return;
    setState(() => _isLoading = false);
  }
}
