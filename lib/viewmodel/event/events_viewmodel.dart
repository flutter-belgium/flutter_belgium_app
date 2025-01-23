import 'package:flutter/foundation.dart';
import 'package:flutter_belgium/model/data/event/event.dart';
import 'package:flutter_belgium/repo/event/event_repostitory.dart';
import 'package:impaktfull_architecture/impaktfull_architecture.dart';

@injectable
class EventsViewmodel extends ChangeNotifierEx {
  final EventRepository _eventRepo;
  var _isLoading = false;
  var _events = <Event>[];

  bool get isLoading => _isLoading;

  List<Event> get events => _events;

  EventsViewmodel(
    this._eventRepo,
  );

  Future<void> init() async {
    await _getData();
  }

  Future<void> _getData() async {
    try {
      _isLoading = true;
      notifyListeners();
      final events = await _eventRepo.getEvents();
      _events = events;
    } catch (error, stack) {
      debugPrint(error.toString());
      debugPrint(stack.toString());
    }
    _isLoading = false;
    notifyListeners();
  }

  void onEventTap(Event item) {
    final meetupUrl = item.meetupUrl;
    if (meetupUrl == null) return;
    launchUrl(Uri.parse(meetupUrl));
  }
}
