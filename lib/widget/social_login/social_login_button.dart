import 'package:flutter/material.dart';
import 'package:flutter_belgium/model/data/login/login_type.dart';
import 'package:flutter_belgium/style/theme.dart';
import 'package:flutter_belgium/style/theme_assets.dart';
import 'package:flutter_belgium/widget/general/button.dart';
import 'package:flutter_svg/svg.dart';

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
      child: Row(
        children: [
          SvgPicture.asset(
            _getLogo(),
            width: 32,
          ),
          Expanded(
            child: Text(
              _getText(),
              textAlign: TextAlign.center,
              style: _getTextStyle(),
            ),
          ),
          const SizedBox(width: 32),
        ],
      ),
    );
  }

  String _getText() {
    switch (loginType) {
      case LoginType.google:
        return 'Sign in with Google';
      case LoginType.github:
        return 'Sign in with Github';
    }
  }

  String _getLogo() {
    switch (loginType) {
      case LoginType.google:
        return ThemeAssets.googleLogo;
      case LoginType.github:
        return ThemeAssets.githubLogo;
    }
  }

  Color _getBackgroundColor() {
    switch (loginType) {
      case LoginType.google:
        return ThemeColors.white;
      case LoginType.github:
        return ThemeColors.primary;
    }
  }

  TextStyle _getTextStyle() {
    switch (loginType) {
      case LoginType.google:
        return const TextStyle(color: ThemeColors.primary);
      case LoginType.github:
        return const TextStyle(color: ThemeColors.white);
    }
  }
}
