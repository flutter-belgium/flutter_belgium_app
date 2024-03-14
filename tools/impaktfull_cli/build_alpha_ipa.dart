import 'package:impaktfull_cli/impaktfull_cli.dart';

import 'build_config.dart';

Future<void> main(List<String> arguments) => ImpaktfullCli().run(
      (cli) async {
        final buildNr = await cli.ciCdPlugin.flutterBuildPlugin.versionBump(
          flavor: 'alpha',
          suffix: 'ios',
        );
        return cli.ciCdPlugin.buildIosWithFlavor(
          flavor: 'alpha',
          obfuscate: false,
          buildNr: buildNr,
          appCenterUploadConfig: const AppCenterUploadConfig(
            appName: 'Flutter-Belgium-iOS-Alpha',
            ownerName: BuildConfig.appCenterOwnerName,
            notifyListeners: false,
            distributionGroups: BuildConfig.appCenterDistributionGroups,
          ),
        );
      },
    );
