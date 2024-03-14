import 'package:flutter_belgium/di/injectable.dart';
import 'package:flutter_belgium/navigator/main_navigator.dart';
import 'package:flutter_belgium/viewmodel/global/translations_viewmodel.dart';
import 'package:impaktfull_architecture/impaktfull_architecture.dart';

@injectable
class HomeViewmodel extends ChangeNotifierEx {
  final MainNavigator _mainNavigator;

  var _counter = 0;

  String get counterValue => '$_counter';

  HomeViewmodel(
    this._mainNavigator,
  );

  Future<void> init() async {}

  void onIncrementTapped() {
    getIt<TranslationsViewmodel>().onSwitchToDutch();
    _counter++;
    notifyListeners();
  }

  void onDebugMenuTapped() => _mainNavigator.goToDebugScreen();
}
