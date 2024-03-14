import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_belgium/model/data/raffle/winner.dart';

class RaffleParticipant {
  final String userUid;
  final String name;

  const RaffleParticipant({
    required this.userUid,
    required this.name,
  });

  factory RaffleParticipant.fromMap(QueryDocumentSnapshot<Map<String, dynamic>> documentSnapshot) => RaffleParticipant(
        userUid: documentSnapshot.id,
        name: documentSnapshot.data()['name'] as String,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
      };

  RaffleWinner toRaffleWinner() => RaffleWinner(
        userUid: userUid,
        name: name,
      );
}
