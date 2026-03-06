import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:student_planner/common/common.dart';

class BackgroundImage extends StatelessWidget {
  final Background background;

  const BackgroundImage({
    super.key,
    required this.background,
  });

  @override
  Widget build(BuildContext context) {
    final path = background.path;
    if (path.isEmpty) return const SizedBox.expand();

    return SizedBox.expand(
      child: background.isFile
          ? background.isVector
                ? _buildSvgFile(path)
                : _buildImageFile(path)
          : background.isVector
          ? _buildSvgAsset(path)
          : _buildImageAsset(path),
    );
  }

  Widget _buildSvgFile(String path) {
    return SvgPicture.file(
      File(path),
      fit: .cover,
      alignment: .center,
      placeholderBuilder: (_) => Container(),
    );
  }

  Widget _buildSvgAsset(String path) {
    return SvgPicture.asset(
      path,
      fit: .cover,
      alignment: .center,
      placeholderBuilder: (_) => Container(),
    );
  }

  Widget _buildImageFile(String path) {
    return Image.file(
      File(path),
      fit: .cover,
      alignment: .center,
      errorBuilder: (_, _, _) => Container(),
    );
  }

  Widget _buildImageAsset(String path) {
    return Image.asset(
      path,
      fit: .cover,
      alignment: .center,
      errorBuilder: (_, _, _) => Container(),
    );
  }
}
