import 'package:flutter/foundation.dart';

extension FutureLogExtension<T> on Future<T> {
  Future<T> measured(String name) async {
    final stopwatch = Stopwatch()..start();

    debugPrint("Starting $name...");
    final result = await this;

    stopwatch.stop();
    debugPrint("Finished $name in ${stopwatch.elapsedMilliseconds} ms");

    return result;
  }
}
