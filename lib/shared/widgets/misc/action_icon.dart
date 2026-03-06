import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

enum UserAction {
  move,
  share,
  delete,
  addPhoto,
  addImage,
  addLabel,
  addText,
  addList,
}

class ActionIcon extends StatelessWidget {
  final UserAction action;

  const ActionIcon({
    required this.action,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return switch (action) {
      UserAction.move => const Icon(Symbols.move_item),
      UserAction.share => const Icon(Symbols.share),
      UserAction.delete => const Icon(Symbols.delete),
      UserAction.addPhoto => const Icon(Symbols.photo_camera),
      UserAction.addImage => const Icon(Symbols.image),
      UserAction.addLabel => const Icon(Symbols.label),
      UserAction.addText => const Icon(Symbols.text_fields),
      UserAction.addList => const Icon(Symbols.checklist),
    };
  }
}
