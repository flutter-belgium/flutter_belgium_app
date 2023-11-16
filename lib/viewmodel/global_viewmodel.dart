import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_belgium/navigation/main_navigator.dart';

@injectable
class GlobalViewmodel with ChangeNotifier {
  final MainNavigator _mainNavigator;
  MainNavigator get mainNavigator => _mainNavigator;

  GlobalViewmodel(
    this._mainNavigator,
  );
}
