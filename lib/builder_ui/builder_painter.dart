import 'package:fifteen/math/coord.dart';
import 'package:fifteen/math/double_point.dart';
import 'package:fifteen/shared_ui/board_painter.dart';
import 'package:flutter/material.dart';

class BuilderPainter extends BoardPainter {
  final List<Coord> selectedCoords;
  BuilderPainter({
    required super.board,
    required this.selectedCoords,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint strokePaint2 = Paint();
    strokePaint2.style = PaintingStyle.stroke;
    strokePaint.style = PaintingStyle.stroke;
    strokePaint.strokeWidth = 2;
    strokePaint.color = Colors.black;
    fillPaint.style = PaintingStyle.fill;
    fillPaint.color = Color(0x8822e8f0);

    // render the quads
    for (int i = 0; i < board.quads.length; i++) {
      drawSubquads(canvas, board.quads[i], board.charts[i], size, strokePaint);
    }
    fillPaint.color = Color(0x44000000);
    fillSpace(canvas, board, size);

    // render equidistant constraints
    var eqs = board.constraints.equidistants;
    for (int i = 0; i < eqs.length; i++) {
      strokePaint2.color =
          HSLColor.fromAHSL(0.25, 360.0 * i / eqs.length, 1.0, 0.5).toColor();
      strokePaint2.strokeWidth = 6;
      for (var s in eqs[i].sides) {
        drawLine(
          canvas,
          board.getVertex(s.c1),
          board.getVertex(s.c2),
          size,
          strokePaint2,
        );
      }
    }

    // render vertices
    for (Coord c in board.getEdgeCoords()) {
      fillPaint.color = selectedCoords.contains(c)
          ? Colors.transparent
          : Color.fromRGBO(34, 232, 240, 0.533);
      drawVertex(
        canvas,
        board.getVertex(c),
        1.0 / 25,
        size,
      );
    }

    // render selected stuff
    fillPaint.color = Color(0x88f0e822);
    for (Coord coord in selectedCoords) {
      // selected vertices
      drawVertex(
        canvas,
        board.getVertex(coord),
        1.0 / 25,
        size,
      );
    }
    for (int i = 0; 2 * i + 1 < selectedCoords.length; i++) {
      // selected sides
      Coord c1 = selectedCoords[2 * i], c2 = selectedCoords[2 * i + 1];
      drawLine(
        canvas,
        board.getVertex(c1),
        board.getVertex(c2),
        size,
        strokePaint,
      );
    }

    // render coincident constraints
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

  void drawLine(
      Canvas canvas, DoublePoint? o, DoublePoint? p, Size size, Paint paint) {
    if (o == null || p == null) return;
    canvas.drawLine(
      Offset(o.x * size.width, o.y * size.height),
      Offset(p.x * size.width, p.y * size.height),
      paint,
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
