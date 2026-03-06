import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/shared/shared.dart';

class ImageDialog<T> extends StatelessWidget {
  final String path;
  final String? title;
  final String errorText;
  final VoidCallback? onDelete;

  const ImageDialog({
    super.key,
    required this.path,
    this.title,
    required this.errorText,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return GenericDialog(
      title: title,
      titlePadding: DialogPaddings.dialogTitle,
      contentPadding: DialogPaddings.imageContent,
      contentBuilder: _buildContent,
      actions: [
        if (onDelete != null)
          DialogActionButton(
            title: t.button.delete,
            onPressed: () {
              context.maybePop();
              onDelete?.call();
            },
          ),
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(FormStyles.imageRadius),
          child: Image.file(
            File(path),
            width: constraints.maxWidth,
            height: constraints.maxWidth,
            fit: .cover,
            errorBuilder: (_, _, _) => SpacePlaceholder(text: errorText),
          ),
        ),
      ),
    );
  }
}
