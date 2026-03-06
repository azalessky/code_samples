import 'package:flutter/material.dart';

import 'package:student_planner/common/common.dart';

class ToggleListTile extends StatelessWidget {
  static const maxWidth = 80.0;

  final bool initialValue;
  final Widget? leading;
  final String title;
  final String? subtitle;
  final VoidCallback? onTap;
  final VoidCallback? onToggle;

  const ToggleListTile({
    required this.initialValue,
    super.key,
    this.leading,
    required this.title,
    this.subtitle,
    this.onTap,
    this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: FormLayout.listPadding.copyWith(right: 0),
      leading: leading,
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle!) : null,
      trailing: _buildToggle(context),
      onTap: onTap,
    );
  }

  Widget _buildToggle(BuildContext context) {
    final iconColor = Theme.of(context).iconTheme.color!;
    final trackOutlineColor = Themes.alpha(
      context,
      iconColor,
      FormStyles.switchAlpha.outline,
    );
    final thumbColor = Themes.alpha(context, iconColor, FormStyles.switchAlpha.thumb);

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: maxWidth),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onToggle,
        child: Align(
          child: Transform.scale(
            scale: FormStyles.switchScale,
            child: Switch(
              value: initialValue,
              trackColor: WidgetStateProperty.all(Colors.transparent),
              thumbColor: WidgetStateProperty.all(thumbColor),
              trackOutlineColor: WidgetStateProperty.all(trackOutlineColor),
              onChanged: (_) => onToggle?.call(),
            ),
          ),
        ),
      ),
    );
  }
}
