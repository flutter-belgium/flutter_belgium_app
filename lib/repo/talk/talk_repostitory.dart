import 'package:flutter_belgium/model/data/event/talk.dart';
import 'package:flutter_belgium/secrets/airtable_config.dart';
import 'package:flutter_belgium/service/airtable_service.dart';
import 'package:impaktfull_architecture/impaktfull_architecture.dart';

@lazySingleton
class TalkRepository {
  final AirtableService _airtableService;

  TalkRepository(
    this._airtableService,
  );

  Future<List<Talk>> getTalks() async {
    final records = await _airtableService.getAllRecords(AirTableConfig.tableTalks);
    return records
        .map(
          (record) {
            try {
              return Talk(
                id: record.id as String,
                name: record.getField('name')?.value as String,
                isLightningTalk: record.getField('⚡️ Lightning talk')?.value as bool,
              );
            } catch (e) {
              return null;
            }
          },
        )
        .whereType<Talk>()
        .toList();
  }

  Future<List<Talk>> getTalksForMeetup(String eventId) async => getTalks();
}
