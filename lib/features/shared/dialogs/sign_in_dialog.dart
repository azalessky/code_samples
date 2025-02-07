import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/features/shared/shared.dart';

enum SignInMethod { google, apple }

class SignInDialog extends StatelessWidget {
  final List<SignInMethod> methods;

  const SignInDialog({
    required this.methods,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GenericDialog(
      contentPadding: DialogPaddings.signInContent,
      contentBuilder: (_) => _buildContent(context),
      actions: [
        DialogActionButton(
          title: 'Button.Cancel'.tr(),
          onPressed: () => context.maybePop(null),
        ),
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      children: methods.map((method) => _buildButton(context, method)).toList(),
    );
  }

  Widget _buildButton(BuildContext context, SignInMethod method) {
    final logo = switch (method) {
      SignInMethod.apple => ResourceSettings.appleLogo,
      SignInMethod.google => ResourceSettings.googleLogo,
    };
    final title = switch (method) {
      SignInMethod.apple => 'SignInDialog.AppleButton'.tr(),
      SignInMethod.google => 'SignInDialog.GoogleButton'.tr(),
    };

    return TextButton.icon(
      style: TextButton.styleFrom(
        backgroundColor: Colors.black,
        padding: EdgeInsets.symmetric(horizontal: 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      icon: SvgPicture.asset(logo, height: 16),
      label: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () => context.maybePop(method),
    );
  }
}
