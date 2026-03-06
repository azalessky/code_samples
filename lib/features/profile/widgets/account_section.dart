import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:collection/collection.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/models/models.dart';
import 'package:student_planner/shared/shared.dart';

class AccountSection extends ConsumerStatefulWidget {
  static const avatarSize = 32.0;

  final Account account;
  final String signInTitle;
  final String Function(String) welcomeText;
  final void Function() onSignIn;

  const AccountSection({
    super.key,
    required this.account,
    required this.signInTitle,
    required this.welcomeText,
    required this.onSignIn,
  });

  @override
  ConsumerState<AccountSection> createState() => _AccountSectionState();
}

class _AccountSectionState extends ConsumerState<AccountSection> {
  final _tooltipKey = GlobalKey<TooltipState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FormLayout.mediumSpacer,
        _buildUserAvatar(widget.account.photoUrl),
        FormLayout.smallSpacer,
        widget.account.email.isEmpty
            ? _buildSignInButton(context)
            : _buildAccountInfo(widget.account),
        FormLayout.mediumSpacer,
      ],
    );
  }

  Widget _buildUserAvatar(String photoUrl) {
    return CircleAvatar(
      radius: AccountSection.avatarSize,
      foregroundImage: photoUrl.isNotEmpty ? NetworkImage(photoUrl) : null,
      child: const Icon(Icons.person, size: AccountSection.avatarSize),
    );
  }

  Widget _buildAccountInfo(Account account) {
    return Padding(
      padding: FormLayout.formPadding,
      child: Tooltip(
        key: _tooltipKey,
        message: account.email,
        triggerMode: TooltipTriggerMode.tap,
        child: _buildWelcomeText(account.email, account.displayName),
      ),
    );
  }

  Widget _buildSignInButton(BuildContext context) {
    return TextButton(
      onPressed: () => Platform.isIOS
          ? showModalDialog<SignInMethod>(
              builder: (context) => SignInDialog(methods: [SignInMethod.apple]),
              onSaved: (value) => widget.onSignIn(),
            )
          : widget.onSignIn(),
      child: Text(widget.signInTitle),
    );
  }

  Widget _buildWelcomeText(String email, String displayName) {
    final name = displayName.isNotEmpty ? displayName : email.split('@').firstOrNull ?? email;
    return Text(
      widget.welcomeText(name),
      style: context.textTheme.titleMedium,
      textAlign: TextAlign.center,
    );
  }
}
