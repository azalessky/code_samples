import 'package:flutter/material.dart';

import 'package:student_planner/common/common.dart';

import 'assignments_badge.dart';

class NavBarItem {
  final IconData outlinedIcon;
  final IconData filledIcon;
  final String label;

  NavBarItem(this.outlinedIcon, this.filledIcon, this.label);
}

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final void Function(int) onTap;

  const BottomNavBar({
    required this.currentIndex,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final items = [
      NavBarItem(
        Icons.home_outlined,
        Icons.home,
        t.homeScreen.schedule,
      ),
      NavBarItem(
        Icons.assignment_outlined,
        Icons.assignment,
        t.homeScreen.assignments,
      ),
      NavBarItem(
        Icons.notifications_outlined,
        Icons.notifications,
        t.homeScreen.bells,
      ),
      NavBarItem(
        Icons.leaderboard_outlined,
        Icons.leaderboard,
        t.homeScreen.grades,
      ),
      NavBarItem(
        Icons.account_circle_outlined,
        Icons.account_circle,
        t.homeScreen.profile,
      ),
    ];

    return BottomNavigationBar(
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.transparent,
      currentIndex: currentIndex,
      onTap: onTap,
      items: items.asMap().entries.map((entry) {
        final index = entry.key;
        final item = entry.value;
        final icon = Icon(currentIndex == index ? item.filledIcon : item.outlinedIcon);

        return BottomNavigationBarItem(
          icon: index == 1 ? AssignmentsBadge(child: icon) : icon,
          label: item.label,
        );
      }).toList(),
    );
  }
}
