import 'dart:io';

Future<void> main(List<String> arguments) async {
  // Fix airtable credentials
  final airtableCredentialsFile = File('lib/secrets/airtable_config_empty.dart');
  airtableCredentialsFile.copySync('lib/secrets/airtable_config.dart');
  // Fix Github credentials
  final githubCredentialsFile = File('lib/secrets/github_config_empty.dart');
  githubCredentialsFile.copySync('lib/secrets/github_config.dart');
}
