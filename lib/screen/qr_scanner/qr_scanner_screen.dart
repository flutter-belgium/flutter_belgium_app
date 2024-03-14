import 'package:flutter/material.dart';
import 'package:flutter_belgium/viewmodel/qr_scanner/qr_scanner_viewmodel.dart';
import 'package:flutter_belgium/widget/qr_scanner/qr_scanner.dart';
import 'package:flutter_navigation_generator_annotations/flutter_navigation_generator_annotations.dart';
import 'package:flutter_belgium/di/injectable.dart';
import 'package:flutter_belgium/widget/provider/provider_widget.dart';

@FlutterRoute(
  navigationType: NavigationType.pushAndReplaceAll,
)
class QrScannerScreen extends StatelessWidget {
  const QrScannerScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<QrScannerViewModel>(
      create: () => getIt()..init(),
      builder: (context, viewModel) => Scaffold(
        body: QrScanner(
          onQrCodeScanned: viewModel.onQrCodeScanned,
        ),
      ),
    );
  }
}
