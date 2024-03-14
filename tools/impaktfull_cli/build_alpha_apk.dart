import 'package:impaktfull_cli/impaktfull_cli.dart';

import 'build_config.dart';

Future<void> main(List<String> arguments) => ImpaktfullCli().run(
      (cli) async {
        final buildNr = await cli.ciCdPlugin.flutterBuildPlugin.versionBump(
          flavor: 'alpha',
          suffix: 'android',
        );
        return cli.ciCdPlugin.buildAndroidWithFlavor(
          flavor: 'alpha',
          obfuscate: false,
          buildNr: buildNr,
          extension: FlutterBuildAndroidExtension.apk,
          appCenterUploadConfig: const AppCenterUploadConfig(
            appName: 'Flutter-Belgium-Android-Alpha',
            ownerName: BuildConfig.appCenterOwnerName,
            notifyListeners: false,
            distributionGroups: BuildConfig.appCenterDistributionGroups,
          ),
        );
      },
    );
