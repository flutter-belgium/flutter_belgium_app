import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_belgium/style/theme.dart';
import 'package:flutter_belgium/widget/general/loading.dart';

class Button extends StatefulWidget {
  final AsyncCallback onTap;
  final String? text;
  final Widget? child;
  final Color? color;
  final bool fullWidth;

  const Button({
    required this.onTap,
    required this.text,
    this.color,
    this.fullWidth = true,
    super.key,
  }) : child = null;

  const Button.chidl({
    required this.onTap,
    required this.child,
    this.color,
    this.fullWidth = true,
    super.key,
  }) : text = null;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  var _isLoading = false;
  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Loading();
    }
    return GestureDetector(
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
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        child: Builder(builder: (context) {
          if (widget.child != null) return widget.child!;
          return Text(
            widget.text ?? '',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(color: ThemeColors.white),
          );
        }),
      ),
    );
  }

  Future<void> _onTap() async {
    if (_isLoading) return;
    setState(() => _isLoading = true);
    await widget.onTap();
    if (!mounted) return;
    setState(() => _isLoading = false);
  }
}
