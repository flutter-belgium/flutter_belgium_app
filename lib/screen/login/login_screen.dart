import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_belgium/model/data/login/login_type.dart';
import 'package:flutter_belgium/theme/theme_assets.dart';
import 'package:flutter_belgium/viewmodel/login/login_viewmodel.dart';
import 'package:flutter_belgium/widget/social_login/social_login_button.dart';
import 'package:flutter_navigation_generator_annotations/flutter_navigation_generator_annotations.dart';
import 'package:flutter_belgium/di/injectable.dart';
import 'package:flutter_belgium/widget/provider/provider_widget.dart';
import 'package:impaktfull_architecture/impaktfull_architecture.dart';

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
              color: theme.colors.card2,
              child: SafeArea(
                top: false,
                child: ImpaktfullUiAutoLayout.vertical(
                  spacing: 8,
                  children: [
                    SocialLoginButton(
                      onTap: viewModel.onLoginTapped,
                      loginType: LoginType.github,
                    ),
                    if (Platform.isIOS) ...[
                      SocialLoginButton(
                        onTap: viewModel.onLoginTapped,
                        loginType: LoginType.apple,
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
