import 'dart:ui';
import 'dart:ui' as ui;

import 'package:fifteen/math/board.dart';
import 'package:fifteen/math/game.dart';
import 'package:fifteen/math/quad.dart';
import 'package:flutter/material.dart';

class GamePainter extends CustomPainter {
  final FragmentShader shader;
  final double time; // time
  final ui.Image? image;
  final Game game;
  final Board board;

  GamePainter(FragmentShader fragmentShader, this.time, this.image, this.game,
      this.board)
      : shader = fragmentShader;

  void setQuad(FragmentShader shader, int index, Quad quad) {
    shader.setFloat(index, quad.p1.dx);
    shader.setFloat(index + 1, quad.p1.dy);
    shader.setFloat(index + 2, quad.p2.dx);
    shader.setFloat(index + 3, quad.p2.dy);
    shader.setFloat(index + 4, quad.p3.dx);
    shader.setFloat(index + 5, quad.p3.dy);
    shader.setFloat(index + 6, quad.p4.dx);
    shader.setFloat(index + 7, quad.p4.dy);
  }

  @override
  void paint(Canvas canvas, Size size) {
    shader.setImageSampler(0, image!);
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);

    final shaderPaint = Paint();
    shaderPaint.shader = shader;

    final strokePaint = Paint();
    strokePaint.style = PaintingStyle.stroke;
    strokePaint.strokeWidth = 2;
    strokePaint.color = Colors.black;

    final fillPaint = Paint();
    fillPaint.style = PaintingStyle.fill;
    fillPaint.color = Colors.black;

    // background
    setQuad(shader, 2, Quad.unit());
    setQuad(shader, 10, Quad.unit());
    canvas.drawRect(Offset.zero & size, shaderPaint);

    strokePaint.color = Colors.black;
    strokePaint.strokeWidth = 2;
    List<Quad> quads = board.getSubquads();
    for (int i = 0; i < quads.length; i++) {
      Quad q = quads[i];
      Quad from = q, to = game.getQuad(quads, i);
      setQuad(shader, 2, from);
      setQuad(shader, 10, to);
      drawQuad(canvas, q, size, game.isSpace(i) ? fillPaint : shaderPaint);

      drawQuad(canvas, q, size, strokePaint);
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
