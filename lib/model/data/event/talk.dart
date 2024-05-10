import 'package:flutter_belgium/model/data/event/person.dart';

class Talk {
  final String id;
  final String name;
  final Person? speaker;
  final bool isLightningTalk;

  const Talk({
    required this.id,
    required this.name,
    required this.isLightningTalk,
    this.speaker,
  });
}

enum TalkStatus {
  confirmed,
  inProgress,
  toBeConfirmed,
  cancelled,
  declined,
}
