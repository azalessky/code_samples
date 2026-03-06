import 'package:flutter/services.dart';
import 'package:path/path.dart';

import 'package:student_planner/common/common.dart';

class Background {
  final String path;

  const Background(this.path);

  static List<Background> assetList(Brightness brightness) {
    final files = resources.getBackrounds(brightness);
    return files.map((path) => Background(path)).toList();
  }

  bool get isFile => path.startsWith('/');
  bool get isVector => path.toLowerCase().endsWith('.svg');
  String get displayName => basenameWithoutExtension(path).truncate(24).capitalized;
}
