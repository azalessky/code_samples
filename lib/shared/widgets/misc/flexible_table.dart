import 'package:flutter/material.dart';

import 'package:student_planner/common/common.dart';

class FlexibleColumn {
  final String? title;
  final String? tooltip;
  final TableColumnWidth width;
  final Alignment alignment;
  final TextAlign textAlign;
  final void Function(int row)? onTap;

  FlexibleColumn({
    this.title,
    this.tooltip,
    required this.width,
    this.alignment = .center,
    this.textAlign = .left,
    this.onTap,
  });
}

class FlexibleTable extends StatelessWidget {
  final int rowCount;
  final List<FlexibleColumn> columns;
  final String? Function(int column, int row)? textBuilder;
  final Widget? Function(int column, int row)? cellBuilder;
  final String? Function(int column, int row)? tooltipBuilder;
  final TextStyle? headingTextStyle;
  final TextStyle? dataTextStyle;
  final double headingRowHeight;
  final bool showHeader;
  final int maxLines;

  const FlexibleTable({
    required this.rowCount,
    required this.columns,
    this.textBuilder,
    this.cellBuilder,
    this.tooltipBuilder,
    this.headingTextStyle,
    this.dataTextStyle,
    this.headingRowHeight = 42.0,
    this.showHeader = true,
    this.maxLines = 2,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: FormLayout.tablePadding,
      child: DataTable(
        headingRowHeight: showHeader ? headingRowHeight : 0,
        dividerThickness: 0.00000000001,
        horizontalMargin: 0,
        columnSpacing: 0,
        headingTextStyle: headingTextStyle,
        dataTextStyle: dataTextStyle,
        columns: List.generate(
          columns.length,
          (index) => _buildDataColumn(columns[index]),
        ),
        rows: List.generate(
          rowCount,
          (row) => DataRow(
            cells: List.generate(
              columns.length,
              (column) => _buildDataCell(columns[column], row),
            ),
          ),
        ),
      ),
    );
  }

  DataColumn _buildDataColumn(FlexibleColumn column) {
    final text = Text(column.title ?? '', maxLines: maxLines);
    final child = column.tooltip == null
        ? text
        : Tooltip(
            message: column.tooltip,
            triggerMode: .tap,
            child: text,
          );

    return DataColumn(
      columnWidth: column.width,
      headingRowAlignment: _alignmentToMainAxis(column.alignment),
      label: child,
    );
  }

  DataCell _buildDataCell(FlexibleColumn column, int row) {
    final index = columns.indexOf(column);

    final widget = cellBuilder?.call(index, row);
    final text = textBuilder?.call(index, row) ?? '';
    final tooltip = tooltipBuilder?.call(index, row);

    final content =
        widget ??
        Text(
          text,
          textAlign: column.textAlign,
          maxLines: maxLines,
          overflow: .ellipsis,
          softWrap: true,
        );
    final child = tooltip == null
        ? content
        : Tooltip(
            message: tooltip,
            triggerMode: TooltipTriggerMode.tap,
            child: content,
          );

    return DataCell(
      Align(
        alignment: column.alignment,
        child: child,
      ),
      onTap: column.onTap != null ? () => column.onTap!(row) : null,
    );
  }

  MainAxisAlignment _alignmentToMainAxis(Alignment alignment) {
    if (alignment == Alignment.center) return .center;
    if (alignment.x < 0) return .start;
    if (alignment.x > 0) return .end;
    return .center;
  }
}
