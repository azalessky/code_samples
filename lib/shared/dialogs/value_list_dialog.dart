import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/shared/shared.dart';

class ValueListDialog<T> extends StatelessWidget {
  static const contentFraction = 0.7;

  final T? initialValue;
  final List<T> values;
  final String? title;
  final AlignmentGeometry alignment;
  final String? clearTitle;
  final String Function(T)? textBuilder;
  final Widget Function(T)? itemBuilder;
  final Widget Function(T)? iconBuilder;
  final void Function(T?)? onSelected;

  const ValueListDialog({
    this.initialValue,
    required this.values,
    this.title,
    this.alignment = Alignment.centerLeft,
    this.clearTitle,
    this.textBuilder,
    this.itemBuilder,
    this.iconBuilder,
    this.onSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FractionalDialog(
      title: title,
      heightFactor: ValueListDialog.contentFraction,
      titlePadding: DialogPaddings.dialogTitle,
      contentPadding: DialogPaddings.listContent,
      contentBuilder: (context) => SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: values.map((value) => _buildListTile(context, value)).toList(),
        ),
      ),
      actions: [
        if (initialValue != null && clearTitle != null)
          DialogActionButton(
            title: clearTitle!,
            onPressed: () {
              context.maybePop();
              onSelected?.call(null);
            },
          ),
      ],
    );
  }

  Widget _buildListTile(BuildContext context, T value) {
    return ListTile(
      contentPadding: DialogPaddings.listTile,
      title: Align(
        alignment: alignment,
        child:
            itemBuilder?.call(value) ??
            (textBuilder != null
                ? Text(
                    textBuilder!(value),
                    style: context.textTheme.bodyLarge,
                  )
                : Container()),
      ),
      leading: alignment == Alignment.center
          ? iconBuilder?.call(value) ?? const Icon(null)
          : iconBuilder?.call(value),
      trailing: Icon(
        value == initialValue ? Icons.check : null,
      ),
      onTap: () {
        context.maybePop(value);
        onSelected?.call(value);
      },
    );
  }
}
