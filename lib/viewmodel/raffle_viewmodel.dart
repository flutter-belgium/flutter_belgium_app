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
  Timer? _confettiTimer;
  StreamSubscription<Raffle?>? _subscription;
  Raffle? _raffle;
  var _isLoading = false;
  bool? _hasAlreadyWonRaffle;

  String get user => _loginRepository.userName ?? '';

  bool get isLoading => _isLoading;

  Raffle? get raffle => _raffle;

  String? get meetupLocation => _raffle?.meetupLocation;

  bool get hasRaffle => _raffle != null && _raffle!.active;

  bool get hasEnteredRaffle => _raffle?.participants.where((element) => element.userUid == _loginRepository.userId).isNotEmpty ?? false;

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
    _subscription?.cancel();
    super.dispose();
  }

  Future<void> onLogoutTapped() async {
    await _loginRepository.logout();
    _mainNavigator.goToLoginScreen();
  }

  Future<void> _getData() async {
    _isLoading = true;
    notifyListeners();
    _subscription?.cancel();
    _subscription = _raffleRepository.getRaffle().listen((raffle) {
      _isLoading = false;
      final hasWonRaffle = raffle?.winners.where((element) => element.userUid == _loginRepository.userId).isNotEmpty ?? false;
      if (_hasAlreadyWonRaffle == false) {
        if (hasWonRaffle) {
          _confettiTimer?.cancel();
          _confettiController.play();
          _confettiTimer = Timer(ThemeDuration.confettiDuration, () => _confettiController.stop());
        }
      }
      _hasAlreadyWonRaffle = hasWonRaffle;
      _raffle = raffle;
      notifyListeners();
    });
  }

  Future<void> onEnterRaffleTapped() async {
    final raffle = _raffle;
    if (raffle == null) {
      //TODO show error
      return;
    }
    await _raffleRepository.enterRaffle(raffle.id);
  }

  void onStartFortuneWheel() => _mainNavigator.goToRaffleWinnerPickerScreen();
}
