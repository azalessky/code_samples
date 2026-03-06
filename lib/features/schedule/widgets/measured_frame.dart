import 'package:flutter/material.dart';

class MeasuredFrame extends StatefulWidget {
  final Color color;
  final double width;
  final Widget reference;
  final Widget content;

  const MeasuredFrame({
    required this.color,
    this.width = 1.0,
    required this.reference,
    required this.content,
    super.key,
  });

  @override
  State<MeasuredFrame> createState() => _MeasuredFrameState();
}

class _MeasuredFrameState extends State<MeasuredFrame> {
  final GlobalKey _measureKey = GlobalKey();
  Size? _measuredSize;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _measureSize());
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Offstage(
          offstage: true,
          child: Container(key: _measureKey, child: widget.reference),
        ),
        if (_measuredSize != null)
          Container(
            width: _measuredSize!.width,
            height: _measuredSize!.height,
            decoration: BoxDecoration(
              border: Border.all(color: widget.color, width: widget.width),
            ),
            child: widget.content,
          )
      ],
    );
  }

  void _measureSize() {
    final context = _measureKey.currentContext;
    if (context != null) {
      setState(() => _measuredSize = context.size);
    }
  }
}
