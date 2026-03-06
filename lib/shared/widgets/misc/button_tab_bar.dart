import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';

import 'package:student_planner/common/common.dart';

class ButtonTabBar extends StatelessWidget implements PreferredSizeWidget {
  static const barHeight = 40.0;
  static const bottomMargin = 8.0;

  final TabController? controller;
  final List<Tab> tabs;
  final void Function(int)? onSelected;

  const ButtonTabBar({
    this.controller,
    required this.tabs,
    this.onSelected,
    super.key,
  });

  @override
  Size get preferredSize => Size.fromHeight(barHeight + bottomMargin);

  @override
  Widget build(BuildContext context) {
    final contentPadding = EdgeInsets.symmetric(horizontal: barHeight / 2 - 2);
    final buttonMargin = EdgeInsets.symmetric(horizontal: FormLayout.buttonSpacing / 2);

    final unselectedColor = Colors.transparent;
    final selectedColor = Themes.alpha(
      context,
      Colors.black,
      FormStyles.buttonAlpha,
      inverse: true,
    );

    return Padding(
      padding: EdgeInsets.only(bottom: bottomMargin),
      child: ButtonsTabBar(
        controller: controller,
        backgroundColor: selectedColor,
        unselectedBackgroundColor: unselectedColor,
        contentPadding: contentPadding,
        buttonMargin: buttonMargin,
        height: barHeight,
        radius: barHeight / 2,
        tabs: tabs,
        onTap: (index) => onSelected?.call(index),
      ),
    );
  }
}
