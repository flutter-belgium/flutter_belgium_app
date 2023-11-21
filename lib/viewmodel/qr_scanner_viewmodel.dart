import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@injectable
class QrScannerViewModel with ChangeNotifier {
  QrScannerViewModel();

  void init() {}

  Future<void> onQrCodeScanned(String value) async {}
}
