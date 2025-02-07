import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/helpers/helpers.dart';
import 'package:student_planner/services/services.dart';
import 'package:student_planner/features/shared/shared.dart';

import 'image_thumbnail.dart';

class ImageGallery extends StatefulWidget {
  final bool editMode;
  final String title;
  final List<String> images;
  final String deletePrompt;
  final void Function(String)? onDelete;

  const ImageGallery({
    required this.editMode,
    required this.title,
    required this.images,
    required this.deletePrompt,
    this.onDelete,
    super.key,
  });

  @override
  State<ImageGallery> createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery> {
  late List<String> images;

  @override
  void initState() {
    super.initState();
    _updateState();
  }

  @override
  void didUpdateWidget(covariant ImageGallery oldWidget) {
    if (widget.images.differs(oldWidget.images)) {
      _updateState();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: FormLayout.gridPadding,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1,
        crossAxisSpacing: FormLayout.gridSpacing,
        mainAxisSpacing: FormLayout.gridSpacing,
      ),
      children: images
          .map(
            (path) => ImageThumbnail(
              editMode: widget.editMode,
              path: path,
              onTap: () => _viewImage(context, path),
              onDeleted: () => showPromptDialog(
                context: context,
                title: _getImageDate(path),
                text: widget.deletePrompt,
                onConfirmed: () => _deleteImage(path),
              ),
            ),
          )
          .toList(),
    );
  }

  void _updateState() {
    images = widget.images.excludeWhere((path) => !File(path).existsSync());
  }

  void _viewImage(BuildContext context, String path) {
    logEvent(AnalyticsEvent.assignmentsViewImage);
    context.pushRoute(ImageRoute(
      initialValue: path,
      title: widget.title,
      images: images,
    ));
  }

  void _deleteImage(String path) {
    logEvent(AnalyticsEvent.assignmentsDeleteImage);
    widget.onDelete?.call(path);
  }

  String _getImageDate(String path) {
    final date = File(path).lastModifiedSync();
    return DateFormat.yMd().add_jm().format(date);
  }
}
