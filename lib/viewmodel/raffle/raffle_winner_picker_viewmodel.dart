import 'dart:async';
import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_belgium/model/data/raffle/participant.dart';
import 'package:flutter_belgium/model/data/raffle/raffle.dart';
import 'package:flutter_belgium/navigator/main_navigator.dart';
import 'package:flutter_belgium/repo/raffle/raffle_repo.dart';
import 'package:flutter_belgium/theme/theme_duration.dart';
import 'package:flutter_crazy_fortune_wheel/flutter_crazy_fortune_wheel.dart';
import 'package:impaktfull_architecture/impaktfull_architecture.dart';

@injectable
class RaffleWinnerPickerViewModel extends ChangeNotifierEx {
  final RaffleRepository _raffleRepository;
  final MainNavigator _mainNavigator;

  final _confettiController = ConfettiController();
  late final AnimationController _raffleAnimationController;
  late final Animation<double> _raffleAnimation;
  int _raffleWinnerIndex = 0;
  StreamSubscription<Raffle?>? _subscription;

  Raffle? _raffle;

  var _allowedParticipants = <RaffleParticipant>[];
  List<RaffleParticipant>? _lockedParticipants;

  RaffleParticipant? _winner;

  ConfettiController get confettiController => _confettiController;

  Animation<double> get raffleAnimation => _raffleAnimation;

  int get raffleWinnerIndex => _raffleWinnerIndex;

  int get minRequiredParticipants => 2;

  List<RaffleParticipant> get participants => _lockedParticipants ?? _allowedParticipants;

  bool get isLoading => _raffle == null;

  String? get winnerName => _winner?.name;

  bool get hasInactiveRaffle => _raffle?.active == false;

  bool get hasEnoughParticipants => participants.length >= minRequiredParticipants;

  RaffleWinnerPickerViewModel(
    this._raffleRepository,
    this._mainNavigator,
  );

  void init(TickerProvider vsync) {
    _raffleAnimationController = AnimationController(vsync: vsync, duration: ThemeDuration.raffleWheelDuration);
    _raffleAnimation = CurvedAnimation(parent: _raffleAnimationController, curve: FortuneWheelCurve());
    _subscription?.cancel();
    _subscription = _raffleRepository.getRaffle().listen((raffle) {
      final winnerIds = raffle?.winners.map((e) => e.userUid) ?? [];
      final participants = List<RaffleParticipant>.of(raffle?.participants ?? []);
      participants.removeWhere((element) => winnerIds.contains(element.userUid));
      _allowedParticipants = participants;
      _raffle = raffle;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    _raffleAnimationController.dispose();
    super.dispose();
  }

  Future<void> onPickWinnerTapped() async {
    final raffleId = _raffle?.id;
    if (raffleId == null) {
      _mainNavigator.showErrorMessage('Failed to pick winner');
      return;
    }
    final participants = List<RaffleParticipant>.of(_allowedParticipants);
    if (participants.isEmpty) {
      _mainNavigator.showErrorMessage('No participants found');
      return;
    }
    _winner = null;
    _lockedParticipants = participants;
    _raffleWinnerIndex = Random.secure().nextInt(participants.length);
    notifyListeners();
    final winner = participants[_raffleWinnerIndex];
    await _raffleAnimationController.forward(from: 0);
    _raffleRepository.setWinner(raffleId: raffleId, winner: winner);
    _winner = winner;
    notifyListeners();
    _confettiController.play();
    await Future.delayed(ThemeDuration.confettiDuration);
    _confettiController.stop();
    _raffleAnimationController.reset();
    _winner = null;
    _lockedParticipants = null;
    notifyListeners();
  }

  Future<void> onMakeRaffleActiveTapped() async {
    final docId = _raffle?.id;
    if (docId == null) {
      _mainNavigator.showErrorMessage('Failed to make raffle active (no raffle available)');
      return;
    }
    await _raffleRepository.setRaffleActive(raffleId: docId, active: true);
  }

  Future<void> onAddParticipantTapped() async {
    final docId = _raffle?.id;
    if (docId == null) {
      _mainNavigator.showErrorMessage('Failed to add participant (no raffle available)');
      return;
    }
    final name = await _mainNavigator.goToAddParticipantDialog();
    if (name == null) return;
    await _raffleRepository.manuallyEnterRaffle(
      raffleId: docId,
      name: name,
    );
  }
}
