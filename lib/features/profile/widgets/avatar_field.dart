import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/shared/shared.dart';

class AvatarField extends StatefulWidget {
  final String initialValue;
  final String name;
  final double radius;
  final void Function(String)? onSaved;

  const AvatarField({
    required this.initialValue,
    required this.name,
    required this.radius,
    this.onSaved,
    super.key,
  });

  @override
  State<AvatarField> createState() => _AvatarFieldState();
}

class _AvatarFieldState extends State<AvatarField> {
  late String _selectedValue;
  final _pickerLock = AsyncLock();

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    bool editMode = widget.onSaved != null;
    final defaultAvatar = _buildCircleAvatar(widget.name, widget.radius);

    return FormField<String>(
      builder: (state) => SizedBox.square(
        dimension: widget.radius * 2,
        child: ShapedInkWell(
          shape: const CircleBorder(),
          onTap: editMode ? _pickImage : null,
          onLongPress: (editMode && _selectedValue.isNotEmpty) ? _removeImage : null,
          child: _selectedValue.isNotEmpty
              ? _buildPhotoAvatar(_selectedValue, widget.radius, defaultAvatar)
              : defaultAvatar,
        ),
      ),
      onSaved: (value) => widget.onSaved?.call(_selectedValue),
    );
  }

  Widget _buildPhotoAvatar(String photo, double radius, Widget fallback) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Image.file(
        File(photo),
        fit: .cover,
        width: radius * 2,
        height: radius * 2,
        errorBuilder: (_, _, _) => fallback,
      ),
    );
  }

  Widget _buildCircleAvatar(String name, double radius) {
    final textTheme = context.textTheme.titleMedium!;

    return name.isNotEmpty == true
        ? CircleAvatar(
            radius: radius,
            backgroundColor: _colorFromName(name),
            child: Text(
              name[0].toUpperCase(),
              style: textTheme.copyWith(color: Colors.white, fontSize: radius),
            ),
          )
        : CircleAvatar(
            radius: radius,
            child: Icon(Icons.person, size: radius),
          );
  }

  Future<void> _pickImage() async {
    _pickerLock.run(() async {
      final imagePath = await ImageStorage.pickImage(ImageSource.gallery);
      if (imagePath != null) {
        setState(() => _selectedValue = imagePath);
      }
    });
  }

  Future<void> _removeImage() async {
    await showPromptDialog(
      title: t.prompt.titleConfirmation,
      text: t.prompt.deleteAvatar,
      onConfirmed: () => setState(() => _selectedValue = ''),
    );
  }

  Color _colorFromName(String name) {
    final hash = name.codeUnits.fold(0, (sum, char) => sum + char);
    final index = hash % Colors.primaries.length;

    final color = Colors.primaries[index];
    return Themes.alpha(context, color, FormStyles.avatarAlpha);
  }
}
