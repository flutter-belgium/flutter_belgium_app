import 'package:flutter/widgets.dart';
import 'package:flutter_belgium/di/injectable.dart';
import 'package:flutter_belgium/navigator/main_navigator.dart';
import 'package:flutter_belgium/util/firebase/github/github_sign_in_result.dart';
import 'package:flutter_navigation_generator_annotations/flutter_navigation_generator_annotations.dart';
import 'package:impaktfull_architecture/impaktfull_architecture.dart';
import 'package:webview_flutter/webview_flutter.dart';

const _githubAuthorizedUrl = "https://github.com/login/oauth/authorize";

@FlutterRoute(
  returnType: GithubSignInPageResult,
  isFullscreenDialog: true,
)
class GitHubSignInWebviewScreen extends StatefulWidget {
  final String clientId;
  final String clientSecret;
  final String scope;
  final bool allowSignUp;
  final String redirectUrl;

  const GitHubSignInWebviewScreen({
    required this.clientId,
    required this.clientSecret,
    required this.allowSignUp,
    required this.scope,
    required this.redirectUrl,
    super.key,
  });

  @override
  State<GitHubSignInWebviewScreen> createState() => _GitHubSignInWebviewScreenState();
}

class _GitHubSignInWebviewScreenState extends State<GitHubSignInWebviewScreen> {
  late final WebViewController _controller;

  static const String _userAgentMacOSX = "Mozilla/5.0 (Macintosh; Intel Mac OS X 11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.61 Safari/537.36";

  @override
  void initState() {
    super.initState();
    _controller = WebViewController.fromPlatformCreationParams(const PlatformWebViewControllerCreationParams());
    _controller.setJavaScriptMode(JavaScriptMode.unrestricted);
    _controller.setUserAgent(_userAgentMacOSX);
    _controller.setNavigationDelegate(NavigationDelegate(
      onPageFinished: (url) {
        if (url.contains("error=")) {
          getIt<MainNavigator>().goBackWithResult(
            result: GithubSignInPageResult.exception(Exception(Uri.parse(url).queryParameters["error"])),
          );
        } else if (url.startsWith(widget.redirectUrl)) {
          getIt<MainNavigator>().goBackWithResult(
            result: GithubSignInPageResult.code(url.replaceFirst("${widget.redirectUrl}?code=", "").trim()),
          );
        }
      },
    ));
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiScreen(
      title: 'GitHub Sign In',
      isFullScreen: true,
      onBackTapped: getIt<MainNavigator>().goBack,
      child: WebViewWidget(
        controller: _controller,
      ),
    );
  }

  Future<void> _loadData() async {
    final url = "$_githubAuthorizedUrl?client_id=${widget.clientId}&redirect_uri=${widget.redirectUrl}&scope=${widget.scope}&allow_signup=${widget.allowSignUp}";
    await _controller.clearCache();
    await _controller.loadRequest(Uri.parse(url));
  }
}
