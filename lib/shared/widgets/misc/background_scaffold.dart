import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/auto_route.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/providers/providers.dart';
import 'package:student_planner/shared/shared.dart';

class BackgroundScaffold extends ConsumerWidget {
  final PreferredSizeWidget? appBar;
  final Widget? body;
  final Widget? floatingActionButton;

  const BackgroundScaffold({
    this.appBar,
    this.body,
    this.floatingActionButton,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final config = ref.watch(settingsProvider.select((c) => c.general));

    final scaffold = Scaffold(
      appBar: appBar,
      body: body,
      floatingActionButton: floatingActionButton,
      extendBody: true,
    );

    bool hasTabsScaffold = context.findAncestorWidgetOfExactType<AutoTabsScaffold>() != null;
    if (hasTabsScaffold) return scaffold;

    final image = BackgroundImage(background: Background(config.backgroundImage));
    return Stack(
      children: [
        Positioned.fill(child: image),
        scaffold,
      ],
    );
  }
}
