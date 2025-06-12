part of 'snake_border_loading.dart';

class SnakeBorderPainter extends CustomPainter {
  final Animation<double> animation;
  final Color? borderBeginColor, borderEndColor;
  final Offset? borderWidth;
  final double? borderLength;

  SnakeBorderPainter({
    required this.animation,
    this.borderBeginColor,
    this.borderEndColor,
    this.borderWidth,
    this.borderLength,
  }) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()..addRRect(RRect.fromRectAndRadius(Offset.zero & size, const Radius.circular(12)));
    final metric = path.computeMetrics().first;
    final length = metric.length;
    double snakeLength = borderLength ?? 400.0;
    final double start = (animation.value * length) % length;
    const int steps = 250;
    for (int i = 0; i < steps; i++) {
      final double t = i / steps;
      final double localStart = (start + t * snakeLength) % length;
      final double localEnd = (start + (t + 1 / steps) * snakeLength) % length;
      if (localEnd < localStart) continue;
      final Path segment = metric.extractPath(localStart, localEnd);
      final paint = Paint()
        ..color = Color.lerp(borderEndColor ?? Colors.white, borderBeginColor ?? Colors.blue, t)!
        ..strokeWidth = thickness(borderWidth?.dx ?? 2, borderWidth?.dy ?? 2, t)
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke;
      canvas.drawPath(segment, paint);
    }
  }

  @override
  bool shouldRepaint(covariant SnakeBorderPainter oldDelegate) => true;
}

double thickness(num a, num b, double t) => a + (b - a) * t;