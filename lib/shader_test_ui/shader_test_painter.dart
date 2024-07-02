import 'dart:math';
import 'dart:ui';
import 'dart:ui' as ui;

import 'package:fifteen/math/board.dart';
import 'package:fifteen/math/double_point.dart';
import 'package:fifteen/math/int_point.dart';
import 'package:fifteen/math/level.dart';
import 'package:fifteen/math/quad.dart';
import 'package:flutter/material.dart';

class ShaderTestPainter extends CustomPainter {
  final FragmentShader shader;
  final double time; // time
  final ui.Image? image;
  final bool quadTo, boardy;

  ShaderTestPainter({
    required this.shader,
    required this.time,
    required this.image,
    required this.quadTo,
    required this.boardy,
  });

  void setQuad(FragmentShader shader, index, Quad quad) {
    shader.setFloat(index, quad.p1.x);
    shader.setFloat(index + 1, quad.p1.y);
    shader.setFloat(index + 2, quad.p2.x);
    shader.setFloat(index + 3, quad.p2.y);
    shader.setFloat(index + 4, quad.p3.x);
    shader.setFloat(index + 5, quad.p3.y);
    shader.setFloat(index + 6, quad.p4.x);
    shader.setFloat(index + 7, quad.p4.y);
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

    Random r = Random(((time - 3.141) / 6.282).floor() * 10);
    Quad from, to;
    if (!boardy) {
      from = Quad.unit().lerpTo(
        Quad.unit()
            .sub(DoublePoint(0.5, 0.5))
            .rot(r.nextDouble() * 3.141 - 3.141 / 2)
            .mult(0.7 + 0.1 * r.nextDouble())
            .add(DoublePoint(0.5, 0.5))
            .dent(0.8 + 0.2 * r.nextDouble()),
        ctime,
      );
      to = quadTo ? from : Quad.unit();
    } else {
      Board board = Level.allBoards[r.nextInt(Level.allBoards.length)].board;
      List<Quad> quads = board.getSubquads();
      Quad q = quads[r.nextInt(quads.length)];
      from = q;
      to = from.lerpTo(
        quads[r.nextInt(quads.length)].rel(IntPoint.randomDir(r)),
        ctime,
      );
    }

    setQuad(shader, 2, from);
    setQuad(shader, 10, to);
    drawQuad(canvas, Quad.unit(), size, shaderPaint);

    strokePaint.strokeWidth = 2.0;
    strokePaint.color = Colors.green;
    drawQuad(canvas, to, size, strokePaint);
    strokePaint.strokeWidth = 1.0;
    strokePaint.color = Colors.red;
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
      [quad.p1.x, quad.p2.x, quad.p3.x, quad.p4.x, quad.p1.x],
      [quad.p1.y, quad.p2.y, quad.p3.y, quad.p4.y, quad.p1.y],
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
