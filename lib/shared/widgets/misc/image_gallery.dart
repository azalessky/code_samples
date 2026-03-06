import 'dart:io';

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:material_symbols_icons/symbols.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/shared/shared.dart';

class ImageGallery extends StatelessWidget {
  final String title;
  final String subtitle;
  final String errorText;
  final List<String> images;
  final int rowSize;
  final void Function(String)? onDelete;

  const ImageGallery({
    required this.title,
    required this.subtitle,
    required this.errorText,
    required this.images,
    required this.rowSize,
    this.onDelete,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;
        final spacing = FormLayout.imageSpacing;

        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: images.asMap().entries.map((entry) {
            final width = _calcWidgetSize(entry.key, images.length, maxWidth, spacing);
            return _buildImageThumbnail(context, entry.value, width);
          }).toList(),
        );
      },
    );
  }

  Widget _buildImageThumbnail(BuildContext context, String path, double width) {
    return SizedBox(
      width: width,
      child: AspectRatio(
        aspectRatio: 1,
        child: GestureDetector(
          onTap: () => _viewImage(context, path),
          child: Image.file(
            File(path),
            fit: BoxFit.cover,
            errorBuilder: (context, _, _) => _buildErrorImage(context),
          ),
        ),
      ),
    );
  }

  Widget _buildErrorImage(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surfaceContainer,
      child: TextIcon(Symbols.error),
    );
  }

  double _calcWidgetSize(int index, int count, double maxWidth, double spacing) {
    int row = index ~/ rowSize;
    int startIndex = row * rowSize;
    int remaining = count - startIndex;
    int itemsInRow = remaining >= rowSize ? rowSize : remaining;

    double totalSpacing = (itemsInRow - 1) * spacing;
    double widgetSize = (maxWidth - totalSpacing) / itemsInRow;

    return widgetSize;
  }

  void _viewImage(BuildContext context, String path) {
    context.pushRoute(
      ImageRoute(
        initialValue: path,
        title: title,
        subtitle: subtitle,
        errorText: errorText,
        images: images,
        onDelete: () => onDelete?.call(path),
      ),
    );
  }
}
