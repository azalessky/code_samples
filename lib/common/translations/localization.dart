import 'package:flutter/material.dart';

import 'strings.g.dart';

class Localization extends StatefulWidget {
  final String language;
  final Widget child;

  const Localization({
    super.key,
    required this.language,
    required this.child,
  });

  @override
  State<Localization> createState() => _LocalizationState();
}

class _LocalizationState extends State<Localization> {
  @override
  void initState() {
    super.initState();
    _setLocale();
  }

  @override
  void didUpdateWidget(covariant Localization oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.language != widget.language) {
      _setLocale();
    }
  }

  @override
  Widget build(BuildContext context) {
    return TranslationProvider(child: widget.child);
  }

  void _setLocale() {
    LocaleSettings.setLocaleRawSync(widget.language);
  }
}
