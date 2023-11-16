import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';
import 'package:flutter/material.dart';

class QrScanner extends StatelessWidget {
  final ValueChanged<String> onQrCodeScanned;
  const QrScanner({
    required this.onQrCodeScanned,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AiBarcodeScanner(
      validator: (value) => value.startsWith('https://flutterbelgium.be/scan'),
      canPop: false,
      onScan: (String value) => onQrCodeScanned(value),
      controller: MobileScannerController(
        detectionSpeed: DetectionSpeed.noDuplicates,
      ),
      bottomBar: const SizedBox(),
    );
  }
}
