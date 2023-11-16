import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderWidget<T extends ChangeNotifier> extends StatelessWidget {
  final Widget Function(BuildContext context, T viewModel) builder;
  final T Function() create;

  const ProviderWidget({
    required this.builder,
    required this.create,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (context) => create(),
      child: Consumer<T>(
        builder: (context, value, child) => builder(context, value),
      ),
    );
  }
}
