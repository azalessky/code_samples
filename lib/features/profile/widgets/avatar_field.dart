import 'dart:math';

import 'package:flutter/material.dart';
import 'package:random_avatar/random_avatar.dart';

import 'package:student_planner/common/common.dart';

class AvatarField extends StatefulWidget {
  final String avatar;
  final String name;
  final double radius;
  final void Function(String)? onSaved;

  const AvatarField({
    required this.avatar,
    required this.name,
    this.radius = 24,
    this.onSaved,
    super.key,
  });

  @override
  State<AvatarField> createState() => _AvatarFieldState();
}

class _AvatarFieldState extends State<AvatarField> {
  late String avatar;

  @override
  void initState() {
    super.initState();
    avatar = widget.avatar;
  }

  @override
  Widget build(BuildContext context) {
    bool editMode = widget.onSaved != null;

    return FormField<String>(
      builder: (state) => GestureDetector(
        onTap: editMode ? () => _setAvatar(_generateAvatar()) : null,
        onLongPress: editMode ? () => _setAvatar('') : null,
        child: avatar.isNotEmpty
            ? _buildRandomAvatar(avatar, widget.radius)
            : _buildCircleAvatar(widget.name, widget.radius),
      ),
      onSaved: (value) => widget.onSaved?.call(avatar),
    );
  }

  Widget _buildRandomAvatar(String avatar, double radius) {
    return RandomAvatar(
      avatar,
      trBackground: true,
      width: radius * 2,
      height: radius * 2,
    );
  }

  Widget _buildCircleAvatar(String name, double radius) {
    final textTheme = Theme.of(context).textTheme.titleMedium!;

    return name.isNotEmpty == true
        ? CircleAvatar(
            radius: radius,
            backgroundColor: _colorFromName(name),
            child: Text(
              name[0].toUpperCase(),
              style: textTheme.copyWith(
                color: Colors.white,
                fontSize: radius,
              ),
            ),
          )
        : CircleAvatar(
            radius: radius,
            child: Icon(Icons.person, size: radius),
          );
  }

  void _setAvatar(String value) {
    setState(() => avatar = value);
  }

  String _generateAvatar() {
    final random = Random();
    return List.generate(12, (_) => random.nextInt(10)).join();
  }

  Color _colorFromName(String name) {
    final hash = name.codeUnits.fold(0, (sum, char) => sum + char);
    final index = hash % Colors.primaries.length;

    final color = Colors.primaries[index];
    return color.withAlpha(FormStyles.avatarAlpha);
  }
}
