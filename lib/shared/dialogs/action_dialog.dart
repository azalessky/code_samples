import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/shared/shared.dart';

class ActionDialog<T> extends StatelessWidget {
  final String? title;
  final List<T> values;
  final Widget Function(T) iconBuilder;
  final String Function(T) textBuilder;

  const ActionDialog({
    super.key,
    this.title,
    required this.values,
    required this.iconBuilder,
    required this.textBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return GenericDialog(
      title: title,
      titlePadding: DialogPaddings.dialogTitle,
      contentPadding: DialogPaddings.listContent,
      contentBuilder: _buildContent,
    );
  }

  Widget _buildContent(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: values.map((value) => _buildListTile(context, value)).toList(),
      ),
    );
  }

  Widget _buildListTile(BuildContext context, T value) {
    return ListTile(
      contentPadding: DialogPaddings.listTile,
      leading: iconBuilder(value),
      title: context.textLarge(textBuilder(value)),
      onTap: () => context.maybePop(value),
    );
  }
}
