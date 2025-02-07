import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

@RoutePage()
class ImageScreen extends StatefulWidget {
  final String initialValue;
  final String title;
  final List<String> images;

  const ImageScreen({
    required this.initialValue,
    required this.title,
    required this.images,
    super.key,
  });

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  late PageController controller;
  late ValueNotifier<String> selectedImage;

  @override
  void initState() {
    super.initState();

    final index = widget.images.indexOf(widget.initialValue);
    controller = PageController(initialPage: index >= 0 ? index : 0);
    selectedImage = ValueNotifier(widget.initialValue);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: ValueListenableBuilder(
          valueListenable: selectedImage,
          builder: (_, path, __) => ListTile(
            title: Text(widget.title),
            subtitle: Text(_getImageDate(path)),
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: PhotoViewGallery(
        pageController: controller,
        pageOptions: widget.images
            .map(
              (path) => PhotoViewGalleryPageOptions(
                imageProvider: Image.file(File(path)).image,
                minScale: PhotoViewComputedScale.contained,
                maxScale: PhotoViewComputedScale.covered * 2,
              ),
            )
            .toList(),
        onPageChanged: (index) => selectedImage.value = widget.images[index],
      ),
    );
  }

  String _getImageDate(String path) {
    final date = File(path).lastModifiedSync();
    return DateFormat.yMMMMd().add_Hm().format(date);
  }
}
