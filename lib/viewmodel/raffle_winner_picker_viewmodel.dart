import 'dart:async';
import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_belgium/model/data/raffle/participant.dart';
import 'package:flutter_belgium/model/data/raffle/raffle.dart';
import 'package:flutter_belgium/repo/raffle_repo.dart';
import 'package:flutter_belgium/style/theme_duration.dart';
import 'package:injectable/injectable.dart';

@injectable
class RaffleWinnerPickerViewModel with ChangeNotifier {
  final RaffleRepository raffleRepository;

  final _confettiController = ConfettiController();
  final _selectedIndexStreamController = StreamController<int>.broadcast();
  StreamSubscription<Raffle?>? _subscription;

  Raffle? _raffle;

  var _allowedParticipants = <RaffleParticipant>[];
  List<RaffleParticipant>? _lockedParticipants;

  RaffleParticipant? _winner;

  ConfettiController get confettiController => _confettiController;

  Stream<int> get selectedIndexStream => _selectedIndexStreamController.stream;

  List<RaffleParticipant> get participants => _lockedParticipants ?? _allowedParticipants;

  bool get isLoading => _raffle == null;

  String? get winnerName => _winner?.name;

  bool get hasInactiveRaffle => _raffle?.active == false;

  bool get hasEnoughParticipants => participants.length > 2;

  RaffleWinnerPickerViewModel(
    this.raffleRepository,
  );

  void init() {
    _subscription?.cancel();
    _subscription = raffleRepository.getRaffle().listen((raffle) {
      final winnerIds = raffle?.winners.map((e) => e.userUid) ?? [];
      final participants = List<RaffleParticipant>.of(raffle?.participants ?? []);
      if (!kDebugMode) {
        participants.removeWhere((element) => winnerIds.contains(element.userUid));
      }
      _allowedParticipants = participants;
      _raffle = raffle;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    _selectedIndexStreamController.close();
    super.dispose();
  }

  Future<void> onPickWinnerTapped() async {
    final raffleId = _raffle?.id;
    if (raffleId == null) {
      //todo show error
      return;
    }
    final participants = List<RaffleParticipant>.of(_allowedParticipants);
    if (participants.isEmpty) {
      //todo show error
      return;
    }
    _winner = null;
    _lockedParticipants = participants;
    notifyListeners();
    final winnerIndex = Random().nextInt(participants.length);
    print('winnerIndex: $winnerIndex');
    final winner = participants[winnerIndex];
    _selectedIndexStreamController.add(winnerIndex);
    await Future.delayed(ThemeDuration.raffleWheelDuration);
    raffleRepository.setWinner(raffleId: raffleId, winner: winner);
    _winner = winner;
    notifyListeners();
    _confettiController.play();
    await Future.delayed(ThemeDuration.confettiDuration);
    _confettiController.stop();
    await Future.delayed(ThemeDuration.nextRoundDelayDuration);
    _winner = null;
    _lockedParticipants = null;
    notifyListeners();
  }

  Future<void> onMakeRaffleActiveTapped() async {
    final docId = _raffle?.id;
    if (docId == null) {
      //todo show error
      return;
    }
    raffleRepository.setRaffleActive(raffleId: docId, active: true);
  }
}
