import 'package:flutter/material.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/shared/shared.dart';

class FilterButton<T> extends StatelessWidget implements PreferredSizeWidget {
  static const buttonHeight = 40.0;
  static const bottomMargin = 8.0;
  static const iconSize = 20.0;

  final T? initialValue;
  final List<T> values;
  final String dialogTitle;
  final bool clearButton;
  final String Function(T?) textBuilder;
  final ValueChanged<T?>? onChanged;

  const FilterButton({
    required this.initialValue,
    required this.values,
    required this.dialogTitle,
    this.clearButton = false,
    required this.textBuilder,
    this.onChanged,
    super.key,
  });

  @override
  Size get preferredSize => Size.fromHeight(FilterButton.buttonHeight + FilterButton.bottomMargin);

  @override
  Widget build(BuildContext context) {
    final buttonPadding = EdgeInsets.only(
      left: FilterButton.buttonHeight / 2 - 2,
      right: FilterButton.buttonHeight / 2 - 10,
    );
    final color = Themes.alpha(
      context,
      Colors.black,
      FormStyles.buttonAlpha,
      inverse: true,
    );

    return Padding(
      padding: .only(bottom: FilterButton.bottomMargin),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: color,
          iconColor: context.textColor,
          padding: buttonPadding,
          tapTargetSize: .shrinkWrap,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(FilterButton.buttonHeight / 2),
          ),
        ),
        onPressed: () => _selectValue(),
        child: Row(
          mainAxisSize: .min,
          spacing: FormLayout.iconSpacing,
          children: [
            context.textMedium(textBuilder(initialValue)),
            TextIcon(Icons.arrow_drop_down, size: FilterButton.iconSize),
          ],
        ),
      ),
    );
  }

  void _selectValue() {
    showModalDialog<T>(
      builder: (_) => ValueListDialog<T>(
        values: values,
        initialValue: initialValue,
        title: dialogTitle,
        clearTitle: clearButton ? t.button.clear : null,
        textBuilder: (value) => textBuilder(value),
        onSelected: (value) {
          if (value != initialValue) onChanged?.call(value);
        },
      ),
    );
  }
}
