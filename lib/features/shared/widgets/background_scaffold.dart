import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/auto_route.dart';

import 'package:student_planner/providers/providers.dart';
import 'package:student_planner/styles/styles.dart';
import 'package:student_planner/features/shared/shared.dart';

class BackgroundScaffold extends ConsumerWidget {
  final AppBar appBar;
  final Widget body;
  final Widget? floatingActionButton;

  const BackgroundScaffold({
    required this.appBar,
    required this.body,
    this.floatingActionButton,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);

    final scaffold = Scaffold(
      appBar: appBar,
      body: SafeArea(child: body),
      floatingActionButton: floatingActionButton,
    );

    bool hasTabsScaffold = context.findAncestorWidgetOfExactType<AutoTabsScaffold>() != null;
    return hasTabsScaffold
        ? scaffold
        : Stack(
            children: [
              Positioned.fill(
                child: BackgroundImage(
                  background: Background(settings.backgroundImage),
                ),
              ),
              scaffold,
            ],
          );
  }
}
