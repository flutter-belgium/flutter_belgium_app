import 'package:flutter_belgium/util/logger.dart';

extension ListExtensions<T> on List<T> {
  List<R> onlyMapWithoutException<R>(R Function(T) function) {
    final list = <R>[];
    for (final item in this) {
      try {
        final newItem = function(item);
        list.add(newItem);
      } catch (e, trace) {
        Logger.log('Failed to map item $item: $e\n$trace');
      }
    }
    return list;
  }
}
