import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'package:student_planner/common/common.dart';

class ImageStorage {
  static final _picker = ImagePicker();

  static Future<String?> pickImage(ImageSource source) async {
    final picked = await _picker.pickImage(source: source);
    if (picked == null) return null;

    final saved = await saveImage(File(picked.path));
    return saved.path;
  }

  static Future<File> saveImage(File source) async {
    final imagesDir = await imagesDirectory();

    final ext = extension(source.path).toLowerCase();
    final uniqueName = '${DateTime.now().millisecondsSinceEpoch}$ext';

    final newPath = join(imagesDir.path, uniqueName);
    return source.copy(newPath);
  }

  static Future<Directory> imagesDirectory() async {
    final appDir = await getApplicationDocumentsDirectory();
    final imagesDir = Directory('${appDir.path}/${DirectorySettings.imagesFolder}');

    if (!await imagesDir.exists()) {
      await imagesDir.create(recursive: true);
    }
    return imagesDir;
  }
}
