import 'package:flutter/material.dart';
import 'package:student_planner/shared/widgets/misc/empty_icon.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? subtitle;
  final List<Widget>? actions;

  const CustomAppBar({
    super.key,
    required this.title,
    this.subtitle,
    this.actions,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: _buildTitle(),
      actions: actions?.isNotEmpty == true ? actions : [const EmptyIcon()],
    );
  }

  Widget _buildTitle() {
    return ListTile(
      contentPadding: .zero,
      title: Text(
        title,
        textAlign: .center,
        overflow: .ellipsis,
        softWrap: false,
      ),
      subtitle: subtitle != null ? Text(subtitle!, textAlign: .center) : null,
    );
  }
}
