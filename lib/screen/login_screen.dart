import 'package:flutter/material.dart';
import 'package:flutter_belgium/model/data/login/login_type.dart';
import 'package:flutter_belgium/style/theme.dart';
import 'package:flutter_belgium/style/theme_assets.dart';
import 'package:flutter_belgium/widget/social_login/social_login_button.dart';
import 'package:flutter_navigation_generator_annotations/flutter_navigation_generator_annotations.dart';
import 'package:flutter_belgium/di/injectable.dart';
import 'package:flutter_belgium/viewmodel/login_viewmodel.dart';
import 'package:flutter_belgium/widget/provider/provider_widget.dart';
import 'package:flutter_svg/svg.dart';

@FlutterRoute(
  navigationType: NavigationType.pushAndReplaceAll,
)
class LoginScreen extends StatelessWidget {
  const LoginScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<LoginViewModel>(
      create: () => getIt()..init(),
      builder: (context, viewModel) => Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Center(
                child: SvgPicture.asset(
                  ThemeAssets.flutterBelgiumLogo,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              color: ThemeColors.primaryUltraLight,
              child: Column(
                children: [
                  SocialLoginButton(
                    onTap: viewModel.onLoginTapped,
                    loginType: LoginType.github,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
