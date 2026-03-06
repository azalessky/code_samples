import 'package:shared_preferences/shared_preferences.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/shared/shared.dart';

class UpdateInfoManager {
  static const prefsKey = PrefsKeys.updateKey;

  static Future<void> showDialog() async {
    final currentText = t.updateInfo.text.join('\n\n');
    final currentHash = CryptoHelper.sha256Digest(currentText);

    final prefs = await SharedPreferences.getInstance();
    final lastHash = prefs.getString(prefsKey);
    if (lastHash == currentHash) return;

    if (lastHash != null) {
      await showModalDialog(
        builder: (_) => MessageDialog(
          title: t.updateInfo.title,
          text: currentText,
        ),
      );
    }
    await prefs.setString(prefsKey, currentHash);
  }
}
