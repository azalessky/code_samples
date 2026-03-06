import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/shared/shared.dart';

enum ScheduleResetButton { hidden, left, right }

class BaseScheduleScreen extends ConsumerStatefulWidget {
  final DateTime initialDate;
  final PreferredSizeWidget Function(BuildContext, ValueChanged<DateTime>) tabBuilder;
  final Widget Function(BuildContext, ValueChanged<DateTime>) bodyBuilder;
  final Widget actionButton;
  final bool Function(DateTime, DateTime) samePeriod;
  final void Function() onResetPosition;

  const BaseScheduleScreen({
    required this.initialDate,
    required this.tabBuilder,
    required this.bodyBuilder,
    required this.actionButton,
    required this.samePeriod,
    required this.onResetPosition,
    super.key,
  });

  @override
  ConsumerState<BaseScheduleScreen> createState() => _ScheduleBaseScreenState();
}

class _ScheduleBaseScreenState extends ConsumerState<BaseScheduleScreen> {
  late ValueNotifier<DateTime> _titleDate;
  late ValueNotifier<ScheduleResetButton> _resetButton;

  @override
  void initState() {
    super.initState();
    _titleDate = ValueNotifier(widget.initialDate);
    _resetButton = ValueNotifier<ScheduleResetButton>(ScheduleResetButton.hidden);
  }

  @override
  void dispose() {
    _titleDate.dispose();
    _resetButton.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      appBar: AppBar(
        leading: _buildResetButton(),
        title: ValueListenableBuilder(
          valueListenable: _titleDate,
          builder: (_, date, _) => Center(child: Text(_formatTitleDate(date))),
        ),
        bottom: widget.tabBuilder(context, (date) => _updateTitle(date)),
        actions: [widget.actionButton],
      ),
      body: widget.bodyBuilder(context, (date) => _updateTitle(date)),
    );
  }

  String _formatTitleDate(DateTime date) {
    return date.year == widget.initialDate.year
        ? date.format(DateFormat.MONTH).capitalized
        : date.format(DateFormat.YEAR_MONTH).capitalized;
  }

  void _updateTitle(DateTime date) {
    _titleDate.value = date;
    _updateResetButton(date);
  }

  Widget _resetIcon(ScheduleResetButton button) {
    return switch (button) {
      ScheduleResetButton.left => Icon(Icons.arrow_back),
      ScheduleResetButton.right => Icon(Icons.arrow_forward),
      ScheduleResetButton.hidden => EmptyIcon(),
    };
  }

  Widget _buildResetButton() {
    return ValueListenableBuilder(
      valueListenable: _resetButton,
      builder: (_, button, _) => IconButton(
        icon: _resetIcon(button),
        onPressed: button != ScheduleResetButton.hidden ? widget.onResetPosition : null,
      ),
    );
  }

  void _updateResetButton(DateTime date) {
    if (widget.samePeriod(date, widget.initialDate)) {
      _resetButton.value = ScheduleResetButton.hidden;
    } else if (date.isBeforeDay(widget.initialDate)) {
      _resetButton.value = ScheduleResetButton.right;
    } else if (date.isAfterDay(widget.initialDate)) {
      _resetButton.value = ScheduleResetButton.left;
    }
  }
}
