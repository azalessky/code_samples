import 'dart:io';

import 'package:flutter/material.dart';

import 'package:student_planner/common/common.dart';

class ImageThumbnail extends StatelessWidget {
  static const iconSize = 20.0;
  static const iconOffset = 10.0;

  final bool editMode;
  final String path;
  final void Function()? onTap;
  final void Function()? onDeleted;

  const ImageThumbnail({
    required this.editMode,
    required this.path,
    this.onTap,
    this.onDeleted,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        GestureDetector(
          onTap: onTap,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(FormStyles.imageRadius),
            child: Image.file(File(path), fit: BoxFit.cover),
          ),
        ),
        if (editMode)
          Positioned(
            top: -iconOffset,
            right: -iconOffset,
            child: IconButton(
              onPressed: onDeleted,
              icon: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Icon(
                  Icons.cancel_rounded,
                  size: iconSize,
                  color: Theme.of(context).colorScheme.errorContainer,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
