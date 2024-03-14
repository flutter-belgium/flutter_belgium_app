import 'dart:async';

import 'package:impaktfull_architecture/impaktfull_architecture.dart';

@injectable
class QrScannerViewModel with ChangeNotifier {
  QrScannerViewModel();

  void init() {}

  Future<void> onQrCodeScanned(String value) async {}
}
