import 'package:flutter_belgium/model/error/localized_error.dart';

class InvalidUserIdError extends LocalizedError {
  @override
  String get localizedMessage => 'UserId not found';
}
