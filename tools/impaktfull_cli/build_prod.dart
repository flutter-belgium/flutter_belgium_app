import 'package:impaktfull_cli/impaktfull_cli.dart';

import 'build_prod_aab.dart' as build_prod_aab;
import 'build_prod_ipa.dart' as build_prod_ipa;

Future<void> main(List<String> arguments) async {
  await ImpaktfullCli().runMultiplCommands(() async {
    await build_prod_aab.main(arguments);
    await build_prod_ipa.main(arguments);
  });
}
