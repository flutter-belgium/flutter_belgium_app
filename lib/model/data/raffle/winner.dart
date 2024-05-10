import 'package:cloud_firestore/cloud_firestore.dart';

class RaffleWinner {
  final String userUid;
  final String name;

  const RaffleWinner({
    required this.userUid,
    required this.name,
  });

  factory RaffleWinner.fromMap(QueryDocumentSnapshot<Map<String, dynamic>> documentSnapshot) => RaffleWinner(
        userUid: documentSnapshot.id,
        name: documentSnapshot.data()['name'] as String,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
      };
}
