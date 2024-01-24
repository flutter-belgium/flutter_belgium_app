import 'package:flutter_belgium/model/error/localized_error.dart';

class InvalidUserNameError extends LocalizedError {
  @override
  String get localizedMessage => 'Username not found';
}
