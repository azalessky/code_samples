import 'package:flutter/material.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/shared/shared.dart';

class FilterButtonBar extends StatelessWidget implements PreferredSizeWidget {
  static const barHeight = 40.0;
  static const bottomMargin = 8.0;

  final List<FilterButton> buttons;

  const FilterButtonBar({
    super.key,
    required this.buttons,
  });

  @override
  Size get preferredSize => Size.fromHeight(barHeight + bottomMargin);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: .symmetric(horizontal: FormLayout.buttonSpacing),
        child: Row(
          spacing: FormLayout.buttonSpacing,
          children: buttons,
        ),
      ),
    );
  }
}
