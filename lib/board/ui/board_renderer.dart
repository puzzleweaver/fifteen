import 'package:fifteen/board/domain/board.dart';
import 'package:fifteen/board/domain/coord.dart';
import 'package:fifteen/board/domain/double_point.dart';
import 'package:fifteen/board/domain/quad.dart';
import 'package:flutter/material.dart';

class BoardRenderer {
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

  BoardRenderer({
    required this.canvas,
    required this.size,
  });

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

  void drawVertices(
    Board board,
    Iterable<Coord> coords,
    double radius, {
    Color Function(Coord)? fill,
  }) {
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

  void drawQuad(Quad quad, Paint paint) {
    quad = quad.scale(size.width, size.height);
    Path path = Path();
    path.moveTo(quad.p1.x, quad.p1.y);
    for (DoublePoint p in [quad.p2, quad.p3, quad.p4]) {
      path.lineTo(p.x, p.y);
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  void drawSubquadOutlines(Board board) {
    List<Quad> quads = board.subquads;
    for (int i = 0; i < quads.length; i++) {
      drawQuad(quads[i], strokePaint);
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
}
