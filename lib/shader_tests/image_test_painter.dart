import 'dart:math';
import 'dart:ui';
import 'dart:ui' as ui;

import 'package:fifteen/math/quad.dart';
import 'package:flutter/material.dart';

class ImageTestPainter extends CustomPainter {
  final FragmentShader shader;
  final double time; // time
  final ui.Image? image;

  ImageTestPainter(FragmentShader fragmentShader, this.time, this.image)
      : shader = fragmentShader;

  void setQuad(FragmentShader shader, xIndex, yIndex, Quad quad) {
    shader.setFloat(xIndex, quad.p1.dx);
    shader.setFloat(xIndex + 1, quad.p2.dx);
    shader.setFloat(xIndex + 2, quad.p3.dx);
    shader.setFloat(xIndex + 3, quad.p4.dx);
    shader.setFloat(yIndex, quad.p1.dy);
    shader.setFloat(yIndex + 1, quad.p2.dy);
    shader.setFloat(yIndex + 2, quad.p3.dy);
    shader.setFloat(yIndex + 3, quad.p4.dy);
  }

  @override
  void paint(Canvas canvas, Size size) {
    shader.setImageSampler(0, image!);
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);
    shader.setFloat(2, time);

    final shaderPaint = Paint();
    shaderPaint.shader = shader;

    final strokePaint = Paint();
    strokePaint.style = PaintingStyle.stroke;
    strokePaint.strokeWidth = 10;
    strokePaint.color = Colors.white;

    // cyclic time
    double ctime = 0.25 * (1.0 + cos(time)) * (1.0 + cos(time));

    Random r = Random(((time - 3.141) / 6.282).floor());
    Quad from = Quad.unit().lerpTo(
      Quad.unit()
          .sub(Offset(0.5, 0.5))
          .rot(r.nextDouble() * 3.141 - 3.141 / 2)
          .mult(r.nextDouble())
          .add(Offset(0.5, 0.5))
          .dent(r.nextDouble()),
      ctime,
    );
    Quad to = Quad.unit();

    setQuad(shader, 2, 6, from);
    setQuad(
      shader,
      10,
      14,
      to,
    );
    drawQuad(canvas, Quad.unit(), size, shaderPaint);

    strokePaint.color = Colors.red;
    drawQuad(canvas, to, size, strokePaint);
    strokePaint.color = Colors.green;
    drawQuad(canvas, from, size, strokePaint);
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

  void drawQuad(Canvas canvas, Quad quad0, Size size, Paint paint) {
    Quad quad = quad0.scale(size.width, size.height);
    drawPoly(
      canvas,
      [quad.p1.dx, quad.p2.dx, quad.p3.dx, quad.p4.dx, quad.p1.dx],
      [quad.p1.dy, quad.p2.dy, quad.p3.dy, quad.p4.dy, quad.p1.dy],
      paint,
    );
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
