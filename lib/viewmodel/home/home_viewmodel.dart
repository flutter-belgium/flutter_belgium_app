import 'package:impaktfull_architecture/impaktfull_architecture.dart';

@injectable
class HomeViewmodel extends ChangeNotifierEx {
  var _index = 0;

  int get index => _index;

  HomeViewmodel();

  Future<void> init() async {}

  void onTapSelected(int index) {
    if (_index == index) return;
    _index = index;
    notifyListeners();
  }
}
