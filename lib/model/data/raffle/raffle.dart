import 'package:flutter_belgium/model/data/raffle/participant.dart';
import 'package:flutter_belgium/model/data/raffle/winner.dart';

class Raffle {
  final String id;
  final bool active;
  final String? meetupLocation;
  final List<RaffleParticipant> participants;
  final List<RaffleWinner> winners;

  const Raffle({
    required this.id,
    required this.active,
    required this.meetupLocation,
    required this.participants,
    required this.winners,
  });
}
