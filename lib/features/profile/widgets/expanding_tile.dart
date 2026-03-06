import 'package:flutter/material.dart';

import 'arrow_icon.dart';

class ExpandingTile extends StatefulWidget {
  static const tilePadding = EdgeInsets.only(left: 16, right: 0);

  final bool initiallyExpanded;
  final Widget leading;
  final Widget title;
  final Widget? subtitle;
  final List<Widget> children;
  final VisualDensity? visualDensity;
  final void Function()? onTap;
  final void Function(bool)? onExpansionChanged;

  const ExpandingTile({
    super.key,
    this.initiallyExpanded = false,
    required this.leading,
    required this.title,
    this.subtitle,
    required this.children,
    this.visualDensity,
    this.onTap,
    this.onExpansionChanged,
  });

  @override
  State<ExpandingTile> createState() => _ExpandingTileState();
}

class _ExpandingTileState extends State<ExpandingTile> {
  final _controller = ExpansibleController();
  late ValueNotifier<bool> _isExpanded;

  @override
  void initState() {
    super.initState();
    _isExpanded = ValueNotifier(widget.initiallyExpanded);
    if (_isExpanded.value) _controller.expand();
  }

  @override
  void dispose() {
    _controller.dispose();
    _isExpanded.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final iconColor = Theme.of(context).colorScheme.onSurfaceVariant;

    return ExpansionTile(
      controller: _controller,
      visualDensity: widget.visualDensity,
      shape: const Border(),
      collapsedShape: const Border(),
      iconColor: iconColor,
      collapsedIconColor: iconColor,
      tilePadding: ExpandingTile.tilePadding,
      leading: widget.leading,
      title: widget.title,
      subtitle: widget.subtitle,
      trailing: widget.children.isNotEmpty ? _buildExpansionArrow() : const SizedBox(),
      children: widget.children,
      onExpansionChanged: (value) => _handleExpansion(value),
    );
  }

  Widget _buildExpansionArrow() {
    return ValueListenableBuilder<bool>(
      valueListenable: _isExpanded,
      builder: (_, expanded, _) => ArrowIcon(isExpanded: expanded, onPressed: _toggleExpansion),
    );
  }

  void _toggleExpansion() {
    final isExpanded = !_isExpanded.value;
    _isExpanded.value = isExpanded;

    isExpanded ? _controller.expand() : _controller.collapse();
    widget.onExpansionChanged?.call(isExpanded);
  }

  void _handleExpansion(bool expanded) {
    if (_isExpanded.value != expanded) {
      _isExpanded.value = expanded;
      widget.onTap?.call();
    }
  }
}
