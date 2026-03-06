import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/shared/shared.dart';

class BackgroundDialog extends StatefulWidget {
  static const contentFraction = 0.7;
  static const imageSpacing = 6.0;

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
  late Background _selectedValue;
  late List<Background> _backgrounds;
  final _pickerLock = AsyncLock();

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue;
    _backgrounds = widget.backgrounds;
    _backgrounds.insert(0, _selectedValue.isFile ? _selectedValue : Background(''));
  }

  @override
  Widget build(BuildContext context) {
    return FractionalDialog(
      title: widget.title,
      heightFactor: BackgroundDialog.contentFraction,
      titlePadding: DialogPaddings.dialogTitle,
      contentPadding: DialogPaddings.backgroundContent,
      contentBuilder: (context) => _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    final borderRadius = BorderRadius.circular(FormStyles.imageRadius);
    final shape = RoundedRectangleBorder(borderRadius: borderRadius);

    return GridView.builder(
      shrinkWrap: true,
      padding: .zero,
      itemCount: _backgrounds.length,
      itemBuilder: (context, index) => Stack(
        children: [
          ClipRRect(
            borderRadius: borderRadius,
            child: index == 0
                ? _buildCustomImage(context, _backgrounds[index], shape)
                : _buildAssetImage(context, _backgrounds[index], shape),
          ),
          if (_selectedValue.path.isNotEmpty && _backgrounds[index].path == _selectedValue.path)
            _buildCheckmark(context),
        ],
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1,
        crossAxisSpacing: BackgroundDialog.imageSpacing,
        mainAxisSpacing: BackgroundDialog.imageSpacing,
      ),
    );
  }

  Widget _buildAssetImage(BuildContext context, Background background, ShapeBorder shape) {
    return ShapedInkWell(
      shape: shape,
      onTap: () => _selectImage(background),
      child: BackgroundImage(background: background),
    );
  }

  Widget _buildCustomImage(BuildContext context, Background background, ShapeBorder shape) {
    final colorScheme = Theme.of(context).colorScheme;

    return ShapedInkWell(
      shape: shape,
      backgroundColor: colorScheme.surfaceContainerHigh,
      onTap: _pickImage,
      child: background.path.isEmpty
          ? Icon(Icons.add, size: 32, color: colorScheme.onSurfaceVariant)
          : BackgroundImage(background: background),
    );
  }

  Widget _buildCheckmark(BuildContext context) {
    return Positioned(
      top: 4,
      right: 4,
      child: Icon(
        Icons.check,
        size: 24,
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      ),
    );
  }

  Future<void> _pickImage() async {
    _pickerLock.run(() async {
      final imagePath = await ImageStorage.pickImage(ImageSource.gallery);
      if (imagePath != null) {
        if (mounted) _selectImage(Background(imagePath));
      }
    });
  }

  Future<void> _selectImage(Background background) async {
    context.maybePop(background);
  }
}
