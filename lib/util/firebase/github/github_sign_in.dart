import 'dart:convert';

import 'package:flutter_belgium/di/injectable.dart';
import 'package:flutter_belgium/navigator/main_navigator.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

import 'github_sign_in_result.dart';

class GitHubSignIn {
  final String clientId;
  final String clientSecret;
  final String redirectUrl;
  final String scope;
  final bool allowsSignUp;

  final String _githubAccessTokenUrl = "https://github.com/login/oauth/access_token";

  GitHubSignIn({
    required this.clientId,
    required this.clientSecret,
    required this.redirectUrl,
    this.scope = "read:user,user:email",
    this.allowsSignUp = true,
  });

  Future<GitHubSignInResult> signIn() async {
    final authorizedResult = await getIt<MainNavigator>().goToGitHubSignInWebviewScreen(
      clientId: clientId,
      clientSecret: clientSecret,
      scope: scope,
      allowSignUp: allowsSignUp,
      redirectUrl: redirectUrl,
    );
    if (authorizedResult == null) {
      return GitHubSignInResult(
        GitHubSignInResultStatus.cancelled,
        errorMessage: "Login not completed",
      );
    }
    if (authorizedResult.isException) {
      final exception = authorizedResult.exception;
      if (exception.toString().contains('access_denied')) {
        return GitHubSignInResult(
          GitHubSignInResultStatus.cancelled,
          errorMessage: "Sign In attempt has been cancelled.",
        );
      } else {
        return GitHubSignInResult(
          GitHubSignInResultStatus.failed,
          errorMessage: exception.toString(),
        );
      }
    }

    final code = authorizedResult.code;
    final response = await http.post(
      Uri.parse(_githubAccessTokenUrl),
      headers: {
        "Accept": "application/json",
      },
      body: {
        "client_id": clientId,
        "client_secret": clientSecret,
        "code": code,
      },
    );
    GitHubSignInResult result;
    if (response.statusCode == 200) {
      var body = json.decode(utf8.decode(response.bodyBytes));
      result = GitHubSignInResult(
        GitHubSignInResultStatus.ok,
        token: body["access_token"] as String,
      );
    } else {
      result = GitHubSignInResult(
        GitHubSignInResultStatus.cancelled,
        errorMessage: "Unable to obtain token. Received: ${response.statusCode}",
      );
    }

    return result;
  }
}
