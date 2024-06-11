import 'dart:ui';

import 'package:flutter/material.dart';

class GeneralPainter extends CustomPainter {
  final FragmentShader shader;
  final double time;

  GeneralPainter(FragmentShader fragmentShader, this.time)
      : shader = fragmentShader;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);
    shader.setFloat(2, time);
    paint.shader = shader;

    int n = 5, m = 5;
    for (int i = 0; i < n; i++) {
      for (int j = 0; j < m; j++) {
        shader.setFloat(0, size.width * (i + 1) / n);
        shader.setFloat(1, size.height * (j + 1) / m);
        Path path = Path();
        path.moveTo(size.width * i / n, size.height * j / m);
        path.lineTo(size.width * (i + 1) / n - 5, size.height * j / m);
        path.lineTo(
            size.width * (i + 1) / n - 20, size.height * (j + 1) / m - 15);
        path.lineTo(size.width * i / n, size.height * (j + 1) / m - 5);
        canvas.drawPath(path, paint);
      }
    }
    // canvas.drawRect(
    //     Rect.fromLTWH(
    //         size.width / 4, size.height / 4, size.width / 2, size.height / 2),
    //     paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
