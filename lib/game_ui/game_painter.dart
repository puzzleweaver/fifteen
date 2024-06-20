import 'dart:ui';
import 'dart:ui' as ui;

import 'package:fifteen/math/board.dart';
import 'package:fifteen/math/game.dart';
import 'package:fifteen/math/quad.dart';
import 'package:flutter/material.dart';

abstract class GamePainter extends CustomPainter {
  final Board board;

  GamePainter({required this.board});

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

  void drawQuad(Canvas canvas, Quad quad, Size size, Paint paint) {
    quad = quad.scale(size.width, size.height);
    drawPoly(
      canvas,
      [quad.p1.dx, quad.p2.dx, quad.p3.dx, quad.p4.dx, quad.p1.dx],
      [quad.p1.dy, quad.p2.dy, quad.p3.dy, quad.p4.dy, quad.p1.dy],
      paint,
    );
  }

  void drawSubquads(
    Canvas canvas,
    Quad quad,
    (int, int) chart,
    Size size,
    Paint paint,
  ) {
    quad = quad.scale(size.width, size.height);
    for (int i = 0; i <= chart.$1; i++) {
      double s = i / chart.$1;
      canvas.drawLine(
        Offset.lerp(quad.p1, quad.p2, s)!,
        Offset.lerp(quad.p4, quad.p3, s)!,
        paint,
      );
    }
    for (int j = 0; j <= chart.$2; j++) {
      double s = j / chart.$1;
      canvas.drawLine(
        Offset.lerp(quad.p2, quad.p3, s)!,
        Offset.lerp(quad.p1, quad.p4, s)!,
        paint,
      );
    }
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

class GamePlayPainter extends GamePainter {
  final FragmentShader shader;
  final ui.Image? image;
  final Game game;

  GamePlayPainter({
    required this.shader,
    required this.image,
    required this.game,
    required super.board,
  });

  void _setFloats(int index, Offset o) {
    shader.setFloat(index, o.dx);
    shader.setFloat(index + 1, o.dy);
  }

  void _setQuad(int index, Quad q) {
    _setFloats(index, q.p1);
    _setFloats(index + 2, q.p2);
    _setFloats(index + 4, q.p3);
    _setFloats(index + 6, q.p4);
  }

  // fills shader float input range [ index, index+16 )
  void setQuads(int index, Quad from, Quad to) {
    _setQuad(index, from);
    _setQuad(index + 8, to);
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
    setQuads(2, Quad.unit(), Quad.unit());
    canvas.drawRect(Offset.zero & size, shaderPaint);

    strokePaint.color = Colors.black;
    strokePaint.strokeWidth = 2;
    List<Quad> quads = board.getSubquads();
    for (int i = 0; i < quads.length; i++) {
      Quad q = quads[i];
      Quad from = q, to = game.getQuad(quads, i);
      setQuads(2, from, to);
      drawQuad(canvas, q, size, game.isSpace(i) ? fillPaint : shaderPaint);

      drawQuad(canvas, q, size, strokePaint);
    }
  }
}

class GamePreviewPainter extends GamePainter {
  GamePreviewPainter({required super.board});

  @override
  void paint(Canvas canvas, Size size) {
    final strokePaint = Paint();
    strokePaint.style = PaintingStyle.stroke;
    strokePaint.strokeWidth = 1;
    strokePaint.color = Color(0x88000000);
    for (int i = 0; i < board.quads.length; i++) {
      drawSubquads(canvas, board.quads[i], board.charts[i], size, strokePaint);
    }
  }
}
