import 'dart:io';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:impaktfull_cli/impaktfull_cli.dart';

Future<void> main(List<String> arguments) => ImpaktfullCli().run(
      (cli) async {
        final clientServiceAccount = Secret(Platform.environment['OP_SERVICE_ACCOUNT_TOKEN_FLUTTER_BELGIUM']!);
        final onePasswordClientVaultName = Platform.environment['OP_FB_CLIENT_VAULT_NAME']!;
        final onePasswordUuid = Platform.environment['OP_FB_APP_UUID']!;
        final onePasswordGlobalVaultName = await cli.onePasswordPlugin.getOnePasswordField(
          vaultName: onePasswordClientVaultName,
          opUuid: onePasswordUuid,
          fieldName: 'onePasswordGlobalVaultName',
          rawServiceAccount: clientServiceAccount,
        );
        final opUuid1PasswordServiceAccount = await cli.onePasswordPlugin.getOnePasswordField(
          vaultName: onePasswordClientVaultName,
          opUuid: onePasswordUuid,
          fieldName: 'opUuid1PasswordServiceAccount',
          rawServiceAccount: clientServiceAccount,
        );
        final opUuidPlaystoreCredentials = await cli.onePasswordPlugin.getOnePasswordField(
          vaultName: onePasswordClientVaultName,
          opUuid: onePasswordUuid,
          fieldName: 'opUuidPlaystoreCredentials',
          rawServiceAccount: clientServiceAccount,
        );
        final opUuidAppleAccount = await cli.onePasswordPlugin.getOnePasswordField(
          vaultName: onePasswordClientVaultName,
          opUuid: onePasswordUuid,
          fieldName: 'opUuidAppleAccount',
          rawServiceAccount: clientServiceAccount,
        );
        await _createDefaultFlavorConfigSecrets(
          onePasswordGlobalVaultName: onePasswordGlobalVaultName,
          opUuid1PasswordServiceAccount: opUuid1PasswordServiceAccount,
          opUuidPlaystoreCredentials: opUuidPlaystoreCredentials,
          opUuidAppleAccount: opUuidAppleAccount,
          processRunner: cli.processRunner,
        );

        final opUuidProdProvisioningProfile = await cli.onePasswordPlugin.getOnePasswordField(
          vaultName: onePasswordClientVaultName,
          opUuid: onePasswordUuid,
          fieldName: 'opUuidProdProvisioningProfile',
          rawServiceAccount: clientServiceAccount,
        );
        await cli.onePasswordPlugin.downloadFile(
          vaultName: onePasswordClientVaultName,
          opUuid: opUuidProdProvisioningProfile,
          rawServiceAccount: clientServiceAccount,
          outputPath: join('ios', 'provisioning', 'Flutter Belgium Prod.mobileprovision'),
          logContext: 'Prod Provisioning Profile',
        );
      },
    );

Future<void> _createDefaultFlavorConfigSecrets({
  required String onePasswordGlobalVaultName,
  required String opUuid1PasswordServiceAccount,
  required String opUuidPlaystoreCredentials,
  required String opUuidAppleAccount,
  required ProcessRunner processRunner,
}) async {
  final file = File(joinPath('tools', 'impaktfull_cli', 'impaktfull_cli_secrets.dart'));

  final customClass = Class(
    (b) => b
      ..name = 'ImpaktfullCliSecrets'
      ..fields.addAll(
        [
          Field(
            (b) => b
              ..static = true
              ..modifier = FieldModifier.constant
              ..type = refer('String')
              ..name = 'onePasswordGlobalVaultName'
              ..assignment = Code("'$onePasswordGlobalVaultName'"),
          ),
          Field(
            (b) => b
              ..static = true
              ..modifier = FieldModifier.constant
              ..type = refer('String')
              ..name = 'opUuid1PasswordServiceAccount'
              ..assignment = Code("'$opUuid1PasswordServiceAccount'"),
          ),
          Field(
            (b) => b
              ..static = true
              ..modifier = FieldModifier.constant
              ..type = refer('String')
              ..name = 'opUuidPlaystoreCredentials'
              ..assignment = Code("'$opUuidPlaystoreCredentials'"),
          ),
          Field(
            (b) => b
              ..static = true
              ..modifier = FieldModifier.constant
              ..type = refer('String')
              ..name = 'opUuidAppleAccount'
              ..assignment = Code("'$opUuidAppleAccount'"),
          ),
        ],
      ),
  );
  await createFile(
    customClass: customClass,
    file: file,
    processRunner: processRunner,
  );
}

Future<void> createFile({
  required Class customClass,
  required File file,
  required ProcessRunner processRunner,
}) async {
  if (file.existsSync()) {
    file.deleteSync();
  }
  file.createSync(recursive: true);
  final emitter = DartEmitter();
  file.writeAsStringSync('${customClass.accept(emitter)}');
  await processRunner.runProcess([
    'fvm',
    'dart',
    'format',
    file.path,
  ]);
}
