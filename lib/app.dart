import 'package:flutter/material.dart';
import 'package:flutter_belgium/di/injectable.dart';
import 'package:flutter_belgium/viewmodel/global_viewmodel.dart';
import 'package:flutter_belgium/widget/provider/provider_widget.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<GlobalViewmodel>(
      create: () => getIt(),
      builder: (context, viewModel) => MaterialApp(
        title: 'Flutter Belgium',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
          useMaterial3: true,
        ),
        navigatorKey: viewModel.mainNavigator.navigatorKey,
        initialRoute: viewModel.mainNavigator.initialRoute,
        navigatorObservers: viewModel.mainNavigator.navigatorObservers,
        onGenerateRoute: viewModel.mainNavigator.onGenerateRoute,
      ),
    );
  }
}
