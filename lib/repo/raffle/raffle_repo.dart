import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_belgium/extension/list_extensions.dart';
import 'package:flutter_belgium/model/data/raffle/participant.dart';
import 'package:flutter_belgium/model/data/raffle/raffle.dart';
import 'package:flutter_belgium/model/data/raffle/winner.dart';
import 'package:flutter_belgium/model/error/invalid_userid_error.dart';
import 'package:flutter_belgium/model/error/invalid_username_error.dart';
import 'package:flutter_belgium/model/error/not_loggedin_error.dart';
import 'package:flutter_belgium/repo/login/login_repo.dart';
import 'package:impaktfull_architecture/impaktfull_architecture.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uuid/uuid.dart';

@lazySingleton
abstract class RaffleRepository {
  @factoryMethod
  factory RaffleRepository(
    LoginRepository loginRepository,
    FirebaseFirestore firebaseFirestore,
  ) = _RaffleRepository;

  Stream<Raffle?> getRaffle([String? id]);

  Future<void> setRaffleActive({
    required String raffleId,
    required bool active,
  });

  Future<void> enterRaffle(String raffleId);

  Stream<bool> hasEnteredRaffle(String raffleId);

  Stream<bool> hasWonRaffle(String raffleId);

  void setWinner({
    required String raffleId,
    required RaffleParticipant winner,
  });

  Future<void> manuallyEnterRaffle({
    required String raffleId,
    required String name,
  });
}

class _RaffleRepository implements RaffleRepository {
  final LoginRepository _loginRepository;
  final FirebaseFirestore _firebaseFirestore;

  _RaffleRepository(
    this._loginRepository,
    this._firebaseFirestore,
  );

  @override
  Stream<Raffle?> getRaffle([String? id]) {
    if (!_loginRepository.isLoggedIn) return Stream.value(null);
    String docId;
    if (id == null) {
      final today = DateTime.now();
      docId = '${today.year}_${today.month}_${today.day}';
    } else {
      docId = id;
    }
    final raffleDoc = _firebaseFirestore.collection('raffle').doc(docId);
    final participantsStream = raffleDoc.collection('participants').snapshots().map((snapshot) => snapshot.docs.onlyMapWithoutException((doc) => RaffleParticipant.fromMap(doc)));
    final winnersStream = raffleDoc.collection('winners').snapshots().map((snapshot) => snapshot.docs.onlyMapWithoutException((doc) => RaffleWinner.fromMap(doc)));
    return Rx.combineLatest3(
      raffleDoc.snapshots(),
      participantsStream.onErrorReturn([]),
      winnersStream.onErrorReturn([]),
      (raffle, participants, winners) => Raffle(
        id: docId,
        active: (raffle.data()?['active'] as bool?) ?? false,
        meetupLocation: raffle.data()?['location'] as String?,
        participants: participants,
        winners: winners,
      ),
    );
  }

  @override
  Future<void> setRaffleActive({
    required String raffleId,
    required bool active,
  }) async {
    final data = {
      "active": active,
    };
    await _firebaseFirestore.collection('raffle').doc(raffleId).set(data);
  }

  @override
  Future<void> enterRaffle(String raffleId) async {
    if (!_loginRepository.isLoggedIn) throw NotLoggedInError();
    final userId = _loginRepository.userId;
    final userName = _loginRepository.userName;
    if (userId == null) throw InvalidUserIdError();
    if (userName == null) throw InvalidUserNameError();
    final participant = RaffleParticipant(
      userUid: userId,
      name: userName,
    );
    await _addParticipantToRaffle(
      raffleId: raffleId,
      raffleParticipant: participant,
    );
  }

  @override
  Stream<bool> hasEnteredRaffle(String raffleId) =>
      _firebaseFirestore.collection('raffle').doc(raffleId).collection('participants').doc(_loginRepository.userId).snapshots().map((event) => event.exists);

  @override
  Future<void> setWinner({required String raffleId, required RaffleParticipant winner}) =>
      _firebaseFirestore.collection('raffle').doc(raffleId).collection('winners').doc(winner.userUid).set(winner.toRaffleWinner().toJson());

  @override
  Stream<bool> hasWonRaffle(String raffleId) =>
      _firebaseFirestore.collection('raffle').doc(raffleId).collection('winners').doc(_loginRepository.userId).snapshots().map((event) => event.exists);

  @override
  Future<void> manuallyEnterRaffle({
    required String raffleId,
    required String name,
  }) async {
    final participant = RaffleParticipant(
      userUid: 'manual_${const Uuid().v4()}',
      name: name,
    );
    await _addParticipantToRaffle(
      raffleId: raffleId,
      raffleParticipant: participant,
    );
  }

  Future<void> _addParticipantToRaffle({
    required String raffleId,
    required RaffleParticipant raffleParticipant,
  }) async {
    await _firebaseFirestore.collection('raffle').doc(raffleId).collection('participants').doc(raffleParticipant.userUid).set(raffleParticipant.toJson());
  }
}
