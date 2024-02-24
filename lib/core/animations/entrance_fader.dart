import 'package:flutter/material.dart';

class EntranceFader extends StatefulWidget {
  const EntranceFader({
    Key? key,
    required this.child,
    this.delay = const Duration(milliseconds: 0),
    this.duration = const Duration(milliseconds: 400),
    this.offset = const Offset(0.0, 32.0),
  }) : super(key: key);

  /// Child to be animated on entrance
  final Widget child;

  /// Delay after which the animation will start
  final Duration delay;

  /// Duration of entrance animation
  final Duration duration;

  /// Starting point from which the widget will fade to its default position
  final Offset offset;

  @override
  EntranceFaderState createState() {
    return EntranceFaderState();
  }
}

class EntranceFaderState extends State<EntranceFader>
    with SingleTickerProviderStateMixin {
  late AnimationController? _controller;
  late Animation<double>? _dxAnimation;
  late Animation<double>? _dyAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _dxAnimation =
        Tween<double>(begin: widget.offset.dx, end: 0.0).animate(_controller!);
    _dyAnimation =
        Tween<double>(begin: widget.offset.dy, end: 0.0).animate(_controller!);
    Future<void>.delayed(widget.delay, () {
      if (mounted) {
        _controller!.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller!,
      builder: (BuildContext context, Widget? child) => Opacity(
        opacity: _controller!.value,
        child: Transform.translate(
          offset: Offset(_dxAnimation!.value, _dyAnimation!.value),
          child: widget.child,
        ),
      ),
    );
  }
}
