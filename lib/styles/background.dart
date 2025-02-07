import 'dart:convert';

import 'package:path/path.dart';
import 'package:flutter/services.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:student_planner/helpers/helpers.dart';

class Background {
  final String name;

  const Background(this.name);

  factory Background.fromPath(String path) {
    if (path.startsWith('/')) {
      return Background(path);
    } else {
      return Background(basenameWithoutExtension(path).split('_').first);
    }
  }

  static List<Background> fromManifest(String manifest) {
    final Map<String, dynamic> json = jsonDecode(manifest);
    final files = json.keys.where((file) => file.startsWith('assets/backgrounds/'));

    final Map<String, Background> result = {};
    for (final file in files) {
      final background = Background.fromPath(file);
      result[background.name] = background;
    }
    return result.values.toList();
  }

  bool get isEmpty => name.isEmpty;
  bool get isFile => name.startsWith('/');
  bool get isVector => isFile ? name.toLowerCase().endsWith('.svg') : true;

  String getDisplayName() {
    final displayName = isFile ? basename(name) : 'Background.$name'.tr();
    return displayName.truncate(24);
  }

  String getImagePath(Brightness brightness, bool thumbnail) {
    var suffix = brightness == Brightness.light ? 'light' : 'dark';
    suffix += thumbnail ? '_thumb' : '';
    return isFile ? name : 'assets/backgrounds/${name}_$suffix.svg';
  }
}
