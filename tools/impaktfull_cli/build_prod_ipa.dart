import 'package:impaktfull_cli/impaktfull_cli.dart';

Future<void> main(List<String> arguments) async => ImpaktfullCli().run(
      (cli) async {
        final buildNr = await cli.ciCdPlugin.flutterBuildPlugin.versionBump(
          flavor: 'prod',
          suffix: 'ios',
        );
        return cli.ciCdPlugin.buildIosWithFlavor(
          flavor: 'prod',
          obfuscate: false,
          buildNr: buildNr,
          // testflightUploadConfig: TestFlightUploadConfig(
          //   credentials: await cli.onePasswordPlugin.getTestFlightCredentials(
          //     vaultName: BuildConfig.onePasswordGlobalVaultName,
          //     opUuid: BuildConfig.opUuidAppleAccount,
          //   ),
          // ),
        );
      },
    );
