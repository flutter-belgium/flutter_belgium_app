import 'package:flutter_belgium/model/data/event/talk.dart';
import 'package:flutter_belgium/repo/talk/talk_repostitory.dart';
import 'package:impaktfull_architecture/impaktfull_architecture.dart';

@injectable
class TalksViewmodel extends ChangeNotifierEx {
  final TalkRepository _talkRepo;
  var _isLoading = false;
  var _talks = <Talk>[];

  bool get isLoading => _isLoading;

  List<Talk> get talks => _talks;

  TalksViewmodel(
    this._talkRepo,
  );

  Future<void> init() async {
    await _getData();
  }

  Future<void> _getData() async {
    try {
      _isLoading = true;
      notifyListeners();
      final talks = await _talkRepo.getTalks();
      _talks = talks;
    } catch (e) {
      debugPrint(e.toString());
    }
    _isLoading = false;
    notifyListeners();
  }

  void onTalkTapped(Talk talk) {}
}
