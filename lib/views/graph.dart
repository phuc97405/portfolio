import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/views/round.dart';

class CustomView extends StatelessWidget {
  const CustomView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1c1727),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                padding: const EdgeInsets.all(8),
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(36),
                    border: Border.all(color: Colors.white)),
                child: Animate().custom(
                  begin: 0,
                  end: 1,
                  duration: 2.seconds,
                  builder: (_, value, __) => CustomPaint(
                    painter: GraphPainter(value),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class GraphPainter extends CustomPainter {
  final double percentage;

  GraphPainter(this.percentage);
  @override
  void paint(Canvas canvas, Size size) {
    final fullPath = Path();
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;
    final points = [
      Offset(50, 50),
      Offset(100, 100),
      Offset(150, 70),
      Offset(200, 30),
      Offset(250, 160),
      Offset(300, 120),
      Offset(350, 90),
      Offset(400, 110),
      Offset(450, 60),
      Offset(500, 140),
    ];

    for (int i = 0; i < points.length - 1; i++) {
      fullPath.moveTo(points[i].dx, points[i].dy);
      fullPath.cubicTo(
          (points[i].dx + points[i + 1].dx) / 2,
          points[i].dy,
          (points[i].dx + points[i + 1].dx) / 2,
          points[i + 1].dy,
          points[i + 1].dx,
          points[i + 1].dy);
    }
    final path = Path();
    final metrics = fullPath.computeMetrics().toList();
    final fullPathLength =
        metrics.fold(0.0, (prev, metric) => prev + metric.length);
    final pathEnd = percentage * fullPathLength;
    double currentPathEnd = 0;
    const step = 2;
    for (var metric in metrics) {
      final metricStart = currentPathEnd;
      final metricEnd = currentPathEnd + metric.length;
      while (currentPathEnd != metricEnd) {
        final upcomingPathEnd = min(currentPathEnd + step, metricEnd);
        final segment = metric.extractPath(
            currentPathEnd - metricStart, upcomingPathEnd - metricStart);
        path.addPath(segment, Offset.zero);
        currentPathEnd = upcomingPathEnd;
        if (currentPathEnd >= pathEnd) break;
      }
      if (currentPathEnd >= pathEnd) break;
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
