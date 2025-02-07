import 'dart:io';

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:collection/collection.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/helpers/helpers.dart';
import 'package:student_planner/models/models.dart';
import 'package:student_planner/providers/providers.dart';
import 'package:student_planner/features/shared/shared.dart';

class AccountSection extends ConsumerStatefulWidget {
  final String signInText;
  final String welcomeText;
  final void Function() onSignIn;

  const AccountSection({
    required this.signInText,
    required this.welcomeText,
    required this.onSignIn,
    super.key,
  });

  @override
  ConsumerState<AccountSection> createState() => _AccountSectionState();
}

class _AccountSectionState extends ConsumerState<AccountSection> {
  final tooltipKey = GlobalKey<TooltipState>();

  @override
  Widget build(BuildContext context) {
    final account = ref.watch(accountsProvider);

    return Column(
      children: [
        FormLayout.mediumSpacer,
        _buildUserAvatar(account.photoUrl),
        FormLayout.smallSpacer,
        account.isSignedIn ? _buildAccountInfo(account) : _buildSignInButton(context),
        FormLayout.mediumSpacer,
      ],
    );
  }

  Widget _buildUserAvatar(String photoUrl) {
    return CircleAvatar(
      radius: 32,
      foregroundImage: photoUrl.isNotEmpty ? NetworkImage(photoUrl) : null,
      child: const Icon(Icons.person, size: 32),
    );
  }

  Widget _buildAccountInfo(Account account) {
    return Padding(
      padding: FormLayout.formPadding,
      child: Tooltip(
        key: tooltipKey,
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
              context: context,
              builder: (context) => SignInDialog(methods: [SignInMethod.apple]),
              onSaved: (value) => widget.onSignIn(),
            )
          : widget.onSignIn(),
      child: Text(widget.signInText),
    );
  }

  Widget _buildWelcomeText(String email, String displayName) {
    final name = displayName.isNotEmpty ? displayName : email.split('@').firstOrNull ?? email;
    return context.titleMedium(
      widget.welcomeText.tr(args: [name]),
    );
  }
}
