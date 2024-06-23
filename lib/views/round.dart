import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class RoundScreen extends StatelessWidget {
  const RoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade200,
      body: Center(
          child: Container(
              width: 200,
              height: 200,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.yellow),
              alignment: Alignment.center,
              child: Stack(
                children: [
                  Center(
                    child: Animate().custom(
                        begin: 0,
                        end: 80,
                        duration: const Duration(seconds: 1),
                        builder: (_, value, __) {
                          return Text(
                            '${value.round()}%',
                            style: const TextStyle(
                                fontSize: 40, fontWeight: FontWeight.bold),
                          );
                        }),
                  ),
                  Animate().custom(
                      begin: 0,
                      end: 80,
                      duration: 1.seconds,
                      builder: (_, value, __) {
                        return CustomPaint(
                          size: const Size(200, 200),
                          painter: ProgressPainter(value.round()),
                        );
                      })
                ],
              ))),
    );
  }
}

class ProgressPainter extends CustomPainter {
  final int percentage;

  ProgressPainter(this.percentage);

  @override
  void paint(Canvas canvas, Size size) {
    assert(size.width == size.height, "Width must be equal to height");
    canvas.drawArc(
        Offset.zero & size,
        -pi / 2,
        -percentage / 100 * (2 * pi),
        false,
        Paint()
          ..color = Colors.black
          ..strokeWidth = 10
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round); //2pi 360o
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate is ProgressPainter &&
        oldDelegate.percentage != percentage;
  }
}
