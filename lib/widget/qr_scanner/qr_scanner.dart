import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';
import 'package:flutter/material.dart';

class QrScanner extends StatefulWidget {
  final Future<void> Function(String) onQrCodeScanned;
  const QrScanner({
    required this.onQrCodeScanned,
    super.key,
  });

  @override
  State<QrScanner> createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {
  late MobileScannerController _controller;
  var _isProcessing = false;

  @override
  void initState() {
    super.initState();
    _controller = MobileScannerController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AiBarcodeScanner(
      validator: (value) => value.startsWith('https://flutterbelgium.be/scan'),
      canPop: false,
      onScan: (String value) => _onScan(value),
      controller: MobileScannerController(
        detectionSpeed: DetectionSpeed.normal,
      ),
      bottomBar: const SizedBox(),
    );
  }

  Future<void> _onScan(String value) async {
    if (_isProcessing) return;
    _isProcessing = true;
    await widget.onQrCodeScanned(value);
    _isProcessing = false;
  }
}
