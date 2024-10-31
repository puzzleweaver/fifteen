import 'dart:ui';
import 'dart:ui' as ui;

import 'package:fifteen/board/domain/board.dart';
import 'package:fifteen/board/domain/coord.dart';
import 'package:fifteen/board/domain/double_point.dart';
import 'package:fifteen/board/domain/quad.dart';
import 'package:flutter/material.dart';

class LevelRenderer {
  static const bgColors = {
    -2: Colors.transparent,
    -1: Colors.grey,
    0: Color(0xff8b4513),
    1: Color(0xffdeb887),
    2: Color(0xffb47e4d),
    3: Color(0xff762800),
    4: Color(0xff9f6130),
    5: Color(0xffc99b6a),
    null: Colors.grey,
  };

  final Size size;
  final Canvas canvas;
  final FragmentShader shader;
  final ui.Image image;

  LevelRenderer({
    required this.canvas,
    required this.size,
    required this.shader,
    required this.image,
  }) {
    shader.setImageSampler(0, image);
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);
    shader.setFloat(2, 0); // no checkering
    shaderPaint.shader = shader;
  }

  final Paint fillPaint = Paint()..style = PaintingStyle.fill,
      strokePaint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2
        ..color = Colors.black,
      shaderPaint = Paint();

  void drawBackground(Color color) {
    fillPaint.color = color;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), fillPaint);
  }

  void drawVertices(Board board, Iterable<Coord> coords, double radius,
      {Color Function(Coord)? fill}) {
    for (var c in coords) {
      if (fill != null) setFill(color: fill(c));
      drawVertex(board.getVertex(c), radius);
    }
  }

  void drawVertex(DoublePoint? point, double radius) {
    if (point == null) return;
    Offset offset = Offset(point.x * size.width, point.y * size.height);
    canvas.drawCircle(offset, size.width * radius, fillPaint);
    canvas.drawCircle(offset, size.width * radius, strokePaint);
  }

  void drawQuadWithShader({
    required Quad quad,
    // TODO quad from, quad to, etc
  }) {
    shader.setFloat(7, quad.p1.x);
    shader.setFloat(8, quad.p1.y);
    shader.setFloat(9, quad.p2.x);
    shader.setFloat(10, quad.p2.y);
    shader.setFloat(11, quad.p3.x);
    shader.setFloat(12, quad.p3.y);
    shader.setFloat(13, quad.p4.x);
    shader.setFloat(14, quad.p4.y);
    drawQuad(canvas, quad, size, shaderPaint);
  }

  void drawQuad(Canvas canvas, Quad quad, Size size, Paint paint) {
    quad = quad.scale(size.width, size.height);
    Path path = Path();
    path.moveTo(quad.p1.x, quad.p1.y);
    for (DoublePoint p in [quad.p2, quad.p3, quad.p4]) {
      path.lineTo(p.x, p.y);
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  void drawQuads(Board board) {
    List<Quad> quads = board.subquads;
    for (int i = 0; i < quads.length; i++) {
      drawQuad(canvas, quads[i], size, strokePaint);
    }
  }

  void setStroke({Color? color, double? strokeWidth}) {
    if (color != null) strokePaint.color = color;
    if (strokeWidth != null) strokePaint.strokeWidth = strokeWidth;
  }

  void setFill({Color? color}) {
    if (color != null) fillPaint.color = color;
  }

  void drawLine(DoublePoint? p1, DoublePoint? p2) {
    if (p1 == null || p2 == null) return;
    canvas.drawLine(
      Offset(p1.x * size.width, p1.y * size.height),
      Offset(p2.x * size.width, p2.y * size.height),
      strokePaint,
    );
  }

  void drawPlaceholderGraphic() {
    strokePaint.strokeWidth = 0.25;
    canvas.drawRect(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2),
        width: size.width * 0.9,
        height: size.height * 0.9,
      ),
      strokePaint,
    );
    canvas.drawLine(
      Offset(size.width * 0.05, size.height * 0.05),
      Offset(size.width * 0.95, size.height * 0.95),
      strokePaint,
    );
    canvas.drawLine(
      Offset(size.width * 0.95, size.height * 0.05),
      Offset(size.width * 0.05, size.height * 0.95),
      strokePaint,
    );
  }

  void drawBoard({
    required Board board,
  }) {
    for (Quad quad in board.subquads) {
      drawQuadWithShader(quad: quad);
    }
  }
}
