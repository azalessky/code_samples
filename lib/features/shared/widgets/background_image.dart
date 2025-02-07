import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:student_planner/styles/styles.dart';

class BackgroundImage extends StatelessWidget {
  final Background background;
  final BoxConstraints? constraints;
  final bool thumbnail;

  const BackgroundImage({
    required this.background,
    this.constraints,
    this.thumbnail = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (background.isEmpty) return Container();

    final brightness = Theme.of(context).brightness;
    final path = background.getImagePath(brightness, thumbnail);

    final widget = background.isFile
        ? background.isVector
            ? SvgPicture.file(
                File(path),
                fit: BoxFit.cover,
                alignment: Alignment.center,
                placeholderBuilder: (_) => Container(),
              )
            : Image.file(
                File(path),
                fit: BoxFit.cover,
                alignment: Alignment.center,
                errorBuilder: (_, __, ___) => Container(),
              )
        : SvgPicture.asset(
            path,
            fit: BoxFit.cover,
            alignment: thumbnail ? Alignment.center : Alignment.bottomRight,
            placeholderBuilder: (_) => Container(),
          );

    final result = constraints != null
        ? ConstrainedBox(
            constraints: constraints!,
            child: widget,
          )
        : widget;
    return result;
  }
}
