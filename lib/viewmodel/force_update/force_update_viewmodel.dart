import 'package:flutter_belgium/model/data/remote_config/remote_config_data.dart';
import 'package:impaktfull_architecture/impaktfull_architecture.dart';

@injectable
class ForceUpdateViewModel with ChangeNotifier {
  ForceUpdateViewModel();

  Future<void> init() async {}

  void onUpdateTapped() => launchUrl(
        Uri.parse(RemoteConfigData.instance.updateUrl),
        mode: LaunchMode.externalNonBrowserApplication,
      );
}
