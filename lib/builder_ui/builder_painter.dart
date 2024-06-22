import 'package:fifteen/math/coord.dart';
import 'package:fifteen/math/double_point.dart';
import 'package:fifteen/shared_ui/board_painter.dart';
import 'package:flutter/material.dart';

class BuilderPainter extends BoardPainter {
  final Coord? selected, prevSelected, prevPrevSelected, prevPrevPrevSelected;
  BuilderPainter({
    required super.board,
    required this.selected,
    required this.prevSelected,
    required this.prevPrevSelected,
    required this.prevPrevPrevSelected,
  });

  @override
  void paint(Canvas canvas, Size size) {
    strokePaint.style = PaintingStyle.stroke;
    strokePaint.strokeWidth = 1;
    strokePaint.color = Colors.black;
    fillPaint.style = PaintingStyle.fill;
    fillPaint.color = Color(0x8822e8f0);

    for (int i = 0; i < board.quads.length; i++) {
      drawSubquads(canvas, board.quads[i], board.charts[i], size, strokePaint);
    }

    for (Coord c in board.getEdgeCoords()) {
      fillPaint.color = c == selected || c == prevSelected
          ? Colors.transparent
          : Color(0x8822e8f0);
      drawVertex(
        canvas,
        board.getVertex(c),
        1.0 / 25,
        size,
      );
    }

    fillPaint.color = Color(0x88f0e822);

    if (selected != null) {
      if (prevSelected != null) {
        if (prevPrevSelected != null && prevPrevPrevSelected != null) {
          drawVertex(
            canvas,
            board.getVertex(prevPrevSelected!),
            1.0 / 25,
            size,
          );
          drawVertex(
            canvas,
            board.getVertex(prevPrevPrevSelected!),
            1.0 / 25,
            size,
          );
          drawLine(
            canvas,
            board.getVertex(prevPrevSelected!),
            board.getVertex(prevPrevPrevSelected!),
            size,
          );
        }
        drawVertex(
          canvas,
          board.getVertex(prevSelected!),
          1.0 / 25,
          size,
        );
        drawLine(
          canvas,
          board.getVertex(selected!),
          board.getVertex(prevSelected!),
          size,
        );
      }
      drawVertex(
        canvas,
        board.getVertex(selected!),
        1.0 / 25,
        size,
      );
    }

    var eqs = board.constraints.equidistants;
    strokePaint.strokeWidth = 3;
    for (int i = 0; i < eqs.length; i++) {
      strokePaint.color =
          HSLColor.fromAHSL(1.0, 360.0 * i / eqs.length, 1.0, 0.5).toColor();
      for (var s in eqs[i].sides) {
        drawLine(
          canvas,
          board.getVertex(s.c1),
          board.getVertex(s.c2),
          size,
        );
      }
    }

    var coins = board.constraints.coincidents;
    strokePaint.strokeWidth = 1;
    strokePaint.color = Colors.black;
    for (int i = 0; i < coins.length; i++) {
      fillPaint.color =
          HSLColor.fromAHSL(1.0, 360.0 * i / coins.length, 1.0, 0.5).toColor();
      for (var c in coins[i].coords) {
        drawVertex(
          canvas,
          board.getVertex(c),
          1.0 / 50,
          size,
        );
      }
    }
  }

  void drawLine(Canvas canvas, DoublePoint? o, DoublePoint? p, Size size) {
    if (o == null || p == null) return;
    canvas.drawLine(
      Offset(o.x * size.width, o.y * size.height),
      Offset(p.x * size.width, p.y * size.height),
      strokePaint,
    );
  }

  void drawVertex(Canvas canvas, DoublePoint? o, double radius, Size size) {
    if (o == null) return;
    canvas.drawCircle(
      Offset(o.x * size.width, o.y * size.height),
      size.width * radius,
      fillPaint,
    );
    canvas.drawCircle(
      Offset(o.x * size.width, o.y * size.height),
      size.width * radius,
      strokePaint,
    );
  }
}
