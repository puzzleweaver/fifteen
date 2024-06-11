import 'dart:ui';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class ImagePainter extends CustomPainter {
  final FragmentShader shader;
  final double time; // time
  final ui.Image? image;

  ImagePainter(FragmentShader fragmentShader, this.time, this.image)
      : shader = fragmentShader;

  @override
  void paint(Canvas canvas, Size size) {
    shader.setImageSampler(0, image!);
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);
    shader.setFloat(2, time);

    final paint = Paint();

    paint.shader = shader;
    // canvas.drawRect(Offset.zero & size, paint);

    int n = 4, m = 4;
    for (int i = 0; i < n; i++) {
      for (int j = 0; j < m; j++) {
        // shader.setFloat(2, size.width * i / n);
        // shader.setFloat(0, size.width * (i + 1) / n);
        // shader.setFloat(1, size.height * (j + 1) / m);
        drawRect(
          canvas,
          size.width * i / n,
          size.height * j / m,
          size.width / n - 5,
          size.height / m - 5,
          paint,
        );
      }
    }
  }

  void drawRect(
    Canvas canvas,
    double x,
    double y,
    double w,
    double h,
    Paint paint,
  ) {
    drawPoly(canvas, [x, x + w, x + w, x], [y, y, y + h, y + h], paint);
  }

  void drawPoly(Canvas canvas, List<double> xs, List<double> ys, Paint paint) {
    Path path = Path();
    path.moveTo(xs[0], ys[0]);
    for (int i = 1; i < xs.length; i++) {
      path.lineTo(xs[i], ys[i]);
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
