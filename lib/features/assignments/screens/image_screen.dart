import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import 'package:student_planner/shared/shared.dart';

@RoutePage()
class ImageScreen extends StatefulWidget {
  final String initialValue;
  final String title;
  final String subtitle;
  final String errorText;
  final List<String> images;
  final VoidCallback? onDelete;

  const ImageScreen({
    required this.initialValue,
    required this.title,
    required this.subtitle,
    required this.errorText,
    required this.images,
    this.onDelete,
    super.key,
  });

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  late final PageController _controller;

  @override
  void initState() {
    super.initState();

    final index = widget.images.indexOf(widget.initialValue);
    _controller = PageController(initialPage: index >= 0 ? index : 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      appBar: CustomAppBar(
        title: widget.title,
        subtitle: widget.subtitle,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: widget.onDelete,
          ),
        ],
      ),
      body: PhotoViewGallery(
        backgroundDecoration: BoxDecoration(color: Colors.transparent),
        pageController: _controller,
        pageOptions: widget.images
            .map(
              (path) => PhotoViewGalleryPageOptions(
                imageProvider: Image.file(File(path)).image,
                minScale: PhotoViewComputedScale.contained,
                maxScale: PhotoViewComputedScale.covered * 2,
                errorBuilder: (_, _, _) => SpacePlaceholder(text: widget.errorText),
              ),
            )
            .toList(),
      ),
    );
  }
}
