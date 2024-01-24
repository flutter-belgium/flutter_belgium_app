import 'package:flutter_belgium/model/error/localized_error.dart';

class NotLoggedInError extends LocalizedError {
  @override
  String get localizedMessage => 'User is not logged in';
}
