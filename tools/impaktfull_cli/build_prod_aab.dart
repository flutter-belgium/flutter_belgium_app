import 'package:impaktfull_cli/impaktfull_cli.dart';

Future<void> main(List<String> arguments) => ImpaktfullCli().run(
      (cli) async {
        // final playstoreCredentialsFile = await cli.onePasswordPlugin.downloadServiceAccountCredentials(
        //   opUuid: BuildConfig.opUuidPlaystoreCredentials,
        // );
        final buildNr = await cli.ciCdPlugin.flutterBuildPlugin.versionBump(
          flavor: 'prod',
          suffix: 'android',
        );
        return cli.ciCdPlugin.buildAndroidWithFlavor(
          flavor: 'prod',
          obfuscate: false,
          buildNr: buildNr,
          extension: FlutterBuildAndroidExtension.aab,
          // playStoreUploadConfig: PlayStoreUploadConfig(
          //   serviceAccountCredentialsFile: playstoreCredentialsFile,
          // ),
        );
      },
    );
