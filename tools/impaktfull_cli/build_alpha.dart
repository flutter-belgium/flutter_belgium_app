import 'package:impaktfull_cli/impaktfull_cli.dart';

import 'build_alpha_apk.dart' as build_alpha_apk;
import 'build_alpha_ipa.dart' as build_alpha_ipa;

Future<void> main(List<String> arguments) async {
  await ImpaktfullCli().runMultiplCommands(() async {
    await build_alpha_apk.main(arguments);
    await build_alpha_ipa.main(arguments);
  });
}
