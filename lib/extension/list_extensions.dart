import 'package:impaktfull_architecture/impaktfull_architecture.dart';

extension ListExtensions<T> on List<T> {
  List<R> onlyMapWithoutException<R>(R Function(T) function) {
    final list = <R>[];
    for (final item in this) {
      try {
        final newItem = function(item);
        list.add(newItem);
      } catch (error, trace) {
        ImpaktfullLogger.logError('Failed to map item `$item`', error: error, trace: trace);
      }
    }
    return list;
  }
}
