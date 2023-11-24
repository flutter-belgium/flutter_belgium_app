import 'dart:async';

import 'package:confetti/confetti.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_belgium/model/data/raffle/raffle.dart';
import 'package:flutter_belgium/repo/raffle_repo.dart';
import 'package:flutter_belgium/style/theme_duration.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_belgium/navigation/main_navigator.dart';
import 'package:flutter_belgium/repo/login_repo.dart';

@injectable
class RaffleViewModel with ChangeNotifier {
  final LoginRepository _loginRepository;
  final RaffleRepository _raffleRepository;
  final MainNavigator _mainNavigator;

  final _confettiController = ConfettiController();

  Raffle? _raffle;
  bool? _hasAlreadyWonRaffle;
  bool? _hasEnteredRaffle;

  StreamSubscription<Raffle?>? _raffleSubscription;
  StreamSubscription<bool>? _hasEnteredStreamSubscription;
  StreamSubscription<bool>? _hasAlreadyWonStreamSubscription;
  Timer? _confettiTimer;

  String get user => _loginRepository.userName ?? '';

  bool get isLoading => _raffle == null || _hasAlreadyWonRaffle == null || _hasEnteredRaffle == null;

  Raffle? get raffle => _raffle;

  String? get meetupLocation => _raffle?.meetupLocation;

  bool get hasRaffle => _raffle != null && _raffle!.active;

  bool get hasEnteredRaffle => _hasEnteredRaffle ?? false;

  bool get hasAlreadyWonRaffle => _hasAlreadyWonRaffle ?? false;

  ConfettiController get confettiController => _confettiController;

  RaffleViewModel(
    this._loginRepository,
    this._raffleRepository,
    this._mainNavigator,
  );

  void init() => _getData();

  @override
  void dispose() {
    _confettiTimer?.cancel();
    _confettiController.dispose();
    _raffleSubscription?.cancel();
    _hasEnteredStreamSubscription?.cancel();
    super.dispose();
  }

  Future<void> onLogoutTapped() async {
    await _loginRepository.logout();
    _mainNavigator.goToLoginScreen();
  }

  Future<void> _getData() async {
    _raffleSubscription?.cancel();
    _raffleSubscription = _raffleRepository.getRaffle().listen((raffle) {
      if (raffle == null) return;
      _raffle = raffle;
      notifyListeners();
      _setupRaffleSpecificStreams(raffle.id);
    }, onError: (error, trace) {
      _mainNavigator.showError('Failed to get `getRaffle`', error: error, trace: trace);
    });
  }

  void _setupRaffleSpecificStreams(String raffleId) {
    _hasEnteredStreamSubscription?.cancel();
    _hasEnteredStreamSubscription = _raffleRepository.hasEnteredRaffle(raffleId).listen((hasEnteredRaffle) {
      _hasEnteredRaffle = hasEnteredRaffle;
      notifyListeners();
    }, onError: (error, trace) {
      _mainNavigator.showError('Failed to get `hasEnteredRaffle` status ', error: error, trace: trace);
    });
    _hasAlreadyWonStreamSubscription?.cancel();
    _hasAlreadyWonStreamSubscription = _raffleRepository.hasWonRaffle(raffleId).listen((hasWonRaffle) {
      if (_hasAlreadyWonRaffle == false) {
        if (hasWonRaffle) {
          _confettiTimer?.cancel();
          _confettiController.play();
          _confettiTimer = Timer(ThemeDuration.confettiDuration, () => _confettiController.stop());
        }
      }
      _hasAlreadyWonRaffle = hasWonRaffle;
      notifyListeners();
    }, onError: (error, trace) {
      _mainNavigator.showError('Failed to get `hasWonRaffle` status ', error: error, trace: trace);
    });
  }

  Future<void> onEnterRaffleTapped() async {
    final raffle = _raffle;
    if (raffle == null) {
      _mainNavigator.showError('No raffle found');
      return;
    }
    await _raffleRepository.enterRaffle(raffle.id);
  }

  void onStartFortuneWheel() => _mainNavigator.goToRaffleWinnerPickerScreen();

  void onTripleTapLogo() {
    _mainNavigator.showMessage('Raffle: $_raffle, $_hasAlreadyWonRaffle, $_hasEnteredRaffle');
  }
}
