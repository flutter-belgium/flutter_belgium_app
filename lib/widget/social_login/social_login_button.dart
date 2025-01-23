import 'package:flutter/material.dart';
import 'package:flutter_belgium/model/data/login/login_type.dart';
import 'package:flutter_belgium/theme/theme_assets.dart';
import 'package:flutter_belgium/theme/theme_colors.dart';
import 'package:flutter_belgium/widget/general/button.dart';
import 'package:impaktfull_architecture/impaktfull_architecture.dart';

class SocialLoginButton extends StatelessWidget {
  final ValueChanged<LoginType> onTap;
  final LoginType loginType;

  const SocialLoginButton({
    required this.onTap,
    required this.loginType,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Button.child(
      onTap: () async => onTap(loginType),
      color: _getBackgroundColor(),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ImpaktfullUiAutoLayout.horizontal(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: _getLogoPadding(),
            child: SvgPicture.asset(
              _getLogo(),
              width: _getLogoSize(),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                _getText(),
                textAlign: TextAlign.center,
                style: _getTextStyle(),
              ),
            ),
          ),
          const SizedBox(width: 32),
        ],
      ),
    );
  }

  String _getText() {
    switch (loginType) {
      case LoginType.apple:
        return 'Sign in with Apple';
      case LoginType.google:
        return 'Sign in with Google';
      case LoginType.github:
        return 'Sign in with Github';
    }
  }

  String _getLogo() {
    switch (loginType) {
      case LoginType.apple:
        return ThemeAssets.appleLogo;
      case LoginType.google:
        return ThemeAssets.googleLogo;
      case LoginType.github:
        return ThemeAssets.githubLogo;
    }
  }

  double _getLogoSize() {
    switch (loginType) {
      case LoginType.apple:
        return 30;
      case LoginType.google:
      case LoginType.github:
        return 32;
    }
  }

  EdgeInsets _getLogoPadding() {
    switch (loginType) {
      case LoginType.apple:
        return const EdgeInsets.only(bottom: 4);
      case LoginType.google:
      case LoginType.github:
        return EdgeInsets.zero;
    }
  }

  Color _getBackgroundColor() {
    switch (loginType) {
      case LoginType.apple:
        return Colors.black;
      case LoginType.google:
        return ThemeColors.white;
      case LoginType.github:
        return ThemeColors.primary;
    }
  }

  TextStyle _getTextStyle() {
    switch (loginType) {
      case LoginType.apple:
        return const TextStyle(color: ThemeColors.white);
      case LoginType.google:
        return const TextStyle(color: ThemeColors.primary);
      case LoginType.github:
        return const TextStyle(color: ThemeColors.white);
    }
  }
}
