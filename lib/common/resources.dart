import 'package:flutter/services.dart';

import 'package:student_planner/common/common.dart';

class Resources {
  final String assetManifest;
  final String assetSubjects;

  const Resources._({
    required this.assetManifest,
    required this.assetSubjects,
  });

  static Future<Resources> getInstance() async {
    final manifest = await rootBundle.loadString(ResourceSettings.assetManifest);
    final subjects = await rootBundle.loadString(ResourceSettings.assetSubjects);

    return Resources._(assetManifest: manifest, assetSubjects: subjects);
  }
}
