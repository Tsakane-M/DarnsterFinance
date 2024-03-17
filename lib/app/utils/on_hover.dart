import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class OnHover extends StatefulWidget {
  const OnHover({
    super.key,
    required this.builder,
    this.xTranslation,
  });

  final Widget Function(BuildContext, bool) builder;
  final double? xTranslation;

  @override
  State<OnHover> createState() => _OnHoverState();
}

class _OnHoverState extends State<OnHover> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    final double xValue = widget.xTranslation ?? 0;
    final Matrix4 hovered = Matrix4.identity()
      ..translate(xValue, -10, 0)
      ..scale(1.2);
    final Matrix4 transform = _isHovering ? hovered : Matrix4.identity();
    return MouseRegion(
      onEnter: (PointerEnterEvent event) => onEntered(true),
      onExit: (PointerExitEvent event) => onEntered(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: transform,
        child: widget.builder(context, _isHovering),
      ),
    );
  }

  void onEntered(bool isHovering) {
    setState(() {
      _isHovering = isHovering;
    });
  }
}
