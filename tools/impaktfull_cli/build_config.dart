import 'package:impaktfull_cli/impaktfull_cli.dart';

import 'impaktfull_cli_secrets.dart';

class BuildConfig {
  // 1password Config
  static const onePasswordGlobalVaultName = ImpaktfullCliSecrets.onePasswordGlobalVaultName;

  static const opUuidPlaystoreCredentials = ImpaktfullCliSecrets.opUuidPlaystoreCredentials;

  static const opUuidAppleAccount = ImpaktfullCliSecrets.opUuidAppleAccount;

  // AppCenter Config
  static const appCenterOwnerName = 'ImpaktfullUiUi';
  static const appCenterDistributionGroups = [
    AppCenterUploadConfig.defaultDistributionGroup,
  ];
}
