import 'package:flutter_belgium/model/data/event/event.dart';
import 'package:flutter_belgium/secrets/airtable_config.dart';
import 'package:flutter_belgium/service/airtable_service.dart';
import 'package:impaktfull_architecture/impaktfull_architecture.dart';

@lazySingleton
class EventRepository {
  final AirtableService _airtableService;

  EventRepository(
    this._airtableService,
  );

  Future<List<Event>> getEvents() async {
    final records = await _airtableService.getAllRecords(AirTableConfig.tableMeetups);
    final events = records
        .map(
          (record) {
            try {
              return Event(
                id: record.id as String,
                name: record.getString('Name'),
                date: record.getOptionalDateTime('Date'),
                talks: [],
                meetupUrl: record.getOptionalString('Meetup URL'),
                livestreamUrl: record.getOptionalString('Livestream URL'),
              );
            } catch (e) {
              return null;
            }
          },
        )
        .whereType<Event>()
        .where((event) => event.meetupUrl != null)
        .toList();
    events.sortBy(
      (item) => item.date,
      ascending: false,
    );
    return events;
  }
}
