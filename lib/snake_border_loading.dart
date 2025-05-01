library snake_border_loading;

import 'package:flutter/material.dart';

part 'snake_border_painter.dart';

class SnakeBorderLoading extends StatefulWidget {
  final Widget child;
  final bool isLoading;
  final Color? beginColor, endColor;
  final Offset? thickness;
  final double? length;
  final Duration? duration;

  const SnakeBorderLoading({
    super.key,
    required this.child,
    required this.isLoading,
    this.beginColor,
    this.endColor,
    this.thickness,
    this.length,
    this.duration,
  });

  @override
  SnakeBorderLoadingState createState() => SnakeBorderLoadingState();
}

class SnakeBorderLoadingState extends State<SnakeBorderLoading> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: widget.duration ?? const Duration(seconds: 2));
    if (widget.isLoading) _controller.repeat();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant SnakeBorderLoading oldWidget) {
    widget.isLoading ? _controller.repeat() : _controller.stop();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      foregroundPainter: widget.isLoading
          ? SnakeBorderPainter(
              animation: _controller,
              borderBeginColor: widget.beginColor,
              borderEndColor: widget.endColor,
              borderLength: widget.length,
              borderWidth: widget.thickness,
            )
          : null,
      child: widget.child,
    );
  }
}
