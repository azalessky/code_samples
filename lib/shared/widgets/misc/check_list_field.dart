import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import 'package:student_planner/common/common.dart';
import 'package:student_planner/models/models.dart';
import 'package:student_planner/shared/shared.dart';

class CheckListItem {
  final String id;
  final CheckItem value;
  final FocusNode focusNode;

  CheckListItem({String? id, CheckItem? value, FocusNode? focusNode})
    : id = id ?? ObjectId().value,
      value = value ?? (text: '', checked: false),
      focusNode = focusNode ?? FocusNode();

  CheckListItem copyWith({String? id, CheckItem? value, FocusNode? focusNode}) {
    return CheckListItem(
      id: id ?? this.id,
      value: value ?? this.value,
      focusNode: focusNode ?? this.focusNode,
    );
  }
}

class CheckListField extends StatefulWidget {
  final List<CheckItem> initialValue;
  final String addText;
  final int maxLength;
  final FocusNode? focusNode;
  final ValueChanged<List<CheckItem>>? onChanged;
  final ValueChanged<List<CheckItem>>? onSaved;

  const CheckListField({
    required this.initialValue,
    required this.addText,
    required this.maxLength,
    this.focusNode,
    this.onChanged,
    this.onSaved,
    super.key,
  });

  @override
  State<CheckListField> createState() => _CheckListFieldState();
}

class _CheckListFieldState extends State<CheckListField> {
  late final List<CheckListItem> _items;
  late final CheckListItem _addItem;

  @override
  void initState() {
    super.initState();

    _items = widget.initialValue.map((value) => CheckListItem(value: value)).toList();
    if (_items.isEmpty) _handleAddItem(0);
    _addItem = CheckListItem();
  }

  @override
  void dispose() {
    for (final item in _items) {
      item.focusNode.dispose();
    }
    _addItem.focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FormField<List<CheckItem>>(
      initialValue: widget.initialValue,
      builder: (state) => Focus(
        focusNode: widget.focusNode,
        child: ReorderableListView(
          buildDefaultDragHandles: false,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          onReorderStart: (_) => _handleReorderStart(),
          onReorder: _handleReorderItems,
          proxyDecorator: (child, _, _) => Material(
            color: Colors.transparent,
            child: child,
          ),
          children: [
            ..._items.mapIndexed(_buildListRow),
            _buildAddRow(),
          ],
        ),
      ),
      onSaved: (_) => _handleSaveForm(),
    );
  }

  Widget _buildListRow(int index, CheckListItem item) {
    return ReorderableDelayedDragStartListener(
      key: ValueKey(item.id),
      index: index,
      child: CheckListRow(
        initialValue: item.value,
        index: index,
        maxLength: widget.maxLength,
        addText: widget.addText,
        focusNode: item.focusNode,
        onChanged: (value) => _handleItemChange(index, value),
        onSubmitted: () => _handleAddItem(index + 1),
        onDelete: () => _handleItemDelete(index),
      ),
    );
  }

  Widget _buildAddRow() {
    return CheckListRow(
      key: ValueKey(_addItem.id),
      initialValue: _addItem.value,
      index: _items.length,
      placeholder: true,
      maxLength: widget.maxLength,
      addText: widget.addText,
      focusNode: _addItem.focusNode,
      onTap: () => _handleAddItem(_items.length),
    );
  }

  void _handleAddItem(int index) {
    _updateState(() {
      final item = CheckListItem();
      _items.insert(index, item);
      item.focusNode.requestFocus();
    });
  }

  void _handleReorderStart() {
    _items.map((item) => item.focusNode).forEach((node) => node.unfocus());
    widget.focusNode?.requestFocus();
  }

  void _handleReorderItems(int oldIndex, int newIndex) {
    if (newIndex > _items.length) newIndex = _items.length;
    _updateState(() => _items.move(oldIndex, newIndex));
  }

  void _handleItemChange(int index, CheckItem value) {
    _updateState(() => _items[index] = _items[index].copyWith(value: value));
  }

  void _handleItemDelete(int index) {
    _updateState(() {
      final item = _items.removeAt(index);
      item.focusNode.dispose();

      if (item.value.text.isEmpty || index >= _items.length) index -= 1;
      if (index >= 0) {
        _items[index].focusNode.requestFocus();
      } else if (_items.isNotEmpty) {
        _items.first.focusNode.requestFocus();
      }
    });
  }

  List<CheckItem> _collectItems() {
    return _items.map((e) => e.value).where((item) => item.text.trim().isNotEmpty).toList();
  }

  void _handleSaveForm() {
    widget.onSaved?.call(_collectItems());
  }

  void _updateState(VoidCallback fn) {
    setState(() {
      fn();
      widget.onChanged?.call(_collectItems());
    });
  }
}
