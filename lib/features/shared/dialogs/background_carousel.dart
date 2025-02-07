import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/features/shared/shared.dart';
import 'package:student_planner/styles/styles.dart';

class BackgroundCarousel extends StatefulWidget {
  static const imageRadius = 16.0;
  static const dotSize = 8.0;
  static const dotSpacing = 6.0;
  static const iconSize = 32.0;

  final Background initialValue;
  final List<Background> backgrounds;
  final double imageWidth;
  final double imageHeight;
  final void Function(Background) onImageSelected;

  const BackgroundCarousel({
    required this.initialValue,
    required this.backgrounds,
    required this.imageWidth,
    required this.imageHeight,
    required this.onImageSelected,
    super.key,
  });

  @override
  State<BackgroundCarousel> createState() => _BackgroundCarouselState();
}

class _BackgroundCarouselState extends State<BackgroundCarousel> {
  late Background selectedValue;
  late List<Background> backgrounds;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.initialValue;
    backgrounds = widget.backgrounds;
  }

  @override
  Widget build(BuildContext context) {
    final page = backgrounds.indexWhere((b) => b.name == selectedValue.name);

    return Column(
      children: [
        SizedBox(
          width: widget.imageWidth,
          height: widget.imageHeight,
          child: CarouselSlider(
            items: List.generate(
              backgrounds.length,
              (index) => _buildImage(backgrounds[index], index == 0),
            ),
            options: CarouselOptions(
              initialPage: page,
              height: widget.imageHeight,
              viewportFraction: widget.imageWidth / widget.imageHeight,
              onPageChanged: (index, reason) => _selectValue(backgrounds[index]),
            ),
          ),
        ),
        FormLayout.fieldSpacer,
        AnimatedSmoothIndicator(
          activeIndex: page,
          count: backgrounds.length,
          effect: SlideEffect(
            dotWidth: BackgroundCarousel.dotSize,
            dotHeight: BackgroundCarousel.dotSize,
            spacing: BackgroundCarousel.dotSpacing,
            activeDotColor: Theme.of(context).colorScheme.primary,
            dotColor: Theme.of(context).colorScheme.outlineVariant,
          ),
        ),
      ],
    );
  }

  Widget _buildImage(Background background, bool openFile) {
    return Container(
      width: widget.imageWidth,
      height: widget.imageHeight,
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.outline),
        borderRadius: BorderRadius.circular(BackgroundCarousel.imageRadius),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(BackgroundCarousel.imageRadius),
              child: BackgroundImage(
                background: background,
                thumbnail: true,
              ),
            ),
          ),
          if (openFile)
            IconButton(
              icon: Icon(Icons.image_outlined),
              iconSize: BackgroundCarousel.iconSize,
              onPressed: _selectImage,
            ),
        ],
      ),
    );
  }

  void _selectImage() async {
    final imageFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (imageFile != null) {
      final background = Background.fromPath(imageFile.path);
      _selectValue(backgrounds[0] = background);
    }
  }

  void _selectValue(Background value) {
    setState(() => selectedValue = value);
    widget.onImageSelected(value);
  }
}
