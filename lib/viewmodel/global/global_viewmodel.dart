import 'package:impaktfull_architecture/impaktfull_architecture.dart';

@lazySingleton
class GlobalViewModel extends ChangeNotifierEx {
  TargetPlatform? _targetPlatform;

  TargetPlatform? get targetPlatform => _targetPlatform;

  Future<void> init() async {}

  void setTargetPlatform(TargetPlatform? targetPlatform) {
    _targetPlatform = targetPlatform;
    notifyListeners();
  }
}
