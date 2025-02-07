import 'package:flutter/material.dart';

import 'package:student_planner/models/models.dart';
import 'package:student_planner/repositories/repositories.dart';

class SerializableManager {
  final Map<String, SerializableBase> _providers = {};

  void addProvider(SerializableBase provider) {
    _providers[provider.jsonKey] = provider;
  }

  JsonData serialize() {
    final JsonData data = {};
    _providers.forEach((key, provider) => data[key] = provider.serialize());
    return data;
  }

  void deserialize(JsonData data) {
    _providers.forEach((key, provider) {
      try {
        final json = data[key];
        if (json != null) {
          provider.deserialize(json);
        }
      } catch (e, st) {
        debugPrint('SerializableManager: $e\n$st');
      }
    });
  }
}
