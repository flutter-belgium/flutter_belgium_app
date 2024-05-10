import 'package:flutter_belgium/model/data/event/company.dart';
import 'package:flutter_belgium/model/data/event/talk.dart';

class Event {
  final String id;
  final String name;
  final DateTime? date;
  final String? livestreamUrl;
  final String? meetupUrl;
  final Company? company;
  final List<Talk> talks;

  const Event({
    required this.id,
    required this.name,
    this.livestreamUrl,
    this.meetupUrl,
    this.company,
    this.date,
    this.talks = const [],
  });
}
