import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:student_planner/common/common.dart';

import 'package:student_planner/models/models.dart';
import 'package:student_planner/helpers/helpers.dart';

class AssignmentsTabBar extends StatelessWidget implements PreferredSizeWidget {
  static const tabHeight = 40.0;
  static const bottomMargin = 8.0;
  static const buttonSpacing = 16.0;

  final Map<AssignmentStatus, List<Assignment>> assignments;
  final void Function(AssignmentStatus)? onSelected;

  const AssignmentsTabBar({
    required this.assignments,
    this.onSelected,
    super.key,
  });

  @override
  Size get preferredSize => Size.fromHeight(tabHeight + bottomMargin);

  @override
  Widget build(BuildContext context) {
    final color = Colors.transparent;
    return Padding(
      padding: EdgeInsets.only(bottom: bottomMargin),
      child: ButtonsTabBar(
        backgroundColor: color.withAlpha(FormStyles.buttonAlpha),
        unselectedBackgroundColor: color,
        contentPadding: EdgeInsets.symmetric(horizontal: tabHeight / 2 - 4),
        buttonMargin: EdgeInsets.symmetric(horizontal: buttonSpacing / 2),
        height: tabHeight,
        radius: tabHeight / 2,
        tabs: _buildTabs(context),
        onTap: (index) => onSelected?.call(assignments.keys.elementAt(index)),
      ),
    );
  }

  List<Tab> _buildTabs(BuildContext context) {
    return assignments.keys
        .map(
          (status) => Tab(
            child: Row(
              spacing: FormLayout.textSpacing,
              children: [
                context.textMedium(status.toString().tr()),
                context.textMedium(assignments[status]!.length.toString()),
              ],
            ),
          ),
        )
        .toList();
  }
}
