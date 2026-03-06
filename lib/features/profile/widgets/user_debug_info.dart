import 'package:flutter/material.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/models/models.dart';
import 'package:student_planner/services/services.dart';

class UserDebugInfo extends StatelessWidget {
  final Account account;

  const UserDebugInfo({
    super.key,
    required this.account,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .symmetric(vertical: FormLayout.sectionSpacing),
      child: Column(
        spacing: FormLayout.textSpacing,
        children: [
          SelectableText(
            AuthService.instance.currentUser?.uid ?? 'N/A',
            textAlign: TextAlign.center,
          ),
          SelectableText(
            account.email.ifEmpty('N/A'),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
