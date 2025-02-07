import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/styles/styles.dart';
import 'package:student_planner/features/shared/shared.dart';

class BackgroundDialog extends StatefulWidget {
  static const imageWidth = 240.0;
  static const imageHeight = 180.0;

  final String title;
  final Background initialValue;
  final List<Background> backgrounds;

  const BackgroundDialog({
    required this.title,
    required this.initialValue,
    required this.backgrounds,
    super.key,
  });

  @override
  State<BackgroundDialog> createState() => _BackgroundDialogState();
}

class _BackgroundDialogState extends State<BackgroundDialog> {
  late Background selectedValue;
  late List<Background> backgrounds;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.initialValue;
    backgrounds = widget.backgrounds;
    backgrounds.insert(0, selectedValue.isFile ? selectedValue : Background(''));
  }

  @override
  Widget build(BuildContext context) {
    return GenericDialog(
      title: widget.title,
      contentPadding: DialogPaddings.pickerContent,
      contentBuilder: (context) => _buildContent(context),
      actions: [
        DialogActionButton(
          title: 'Button.Save'.tr(),
          onPressed: () => context.maybePop(selectedValue),
        ),
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    return BackgroundCarousel(
      initialValue: selectedValue,
      backgrounds: backgrounds,
      imageWidth: BackgroundDialog.imageWidth,
      imageHeight: BackgroundDialog.imageHeight,
      onImageSelected: (background) => setState(() => selectedValue = background),
    );
  }
}
