import 'package:fifteen/shared_ui/board_painter.dart';
import 'package:flutter/material.dart';

class BuilderPainter extends BoardPainter {
  BuilderPainter({required super.board});

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

    for (Offset o in board.getVertices()) {
      drawVertex(canvas, o, size);
    }
  }

  void drawVertex(Canvas canvas, Offset o, Size size) {
    canvas.drawCircle(
      Offset(o.dx * size.width, o.dy * size.height),
      size.width / 25,
      fillPaint,
    );
    canvas.drawCircle(
      Offset(o.dx * size.width, o.dy * size.height),
      size.width / 25,
      strokePaint,
    );
  }
}
