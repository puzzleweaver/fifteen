import 'package:fifteen/math/board.dart';
import 'package:fifteen/math/double_point.dart';
import 'package:fifteen/math/quad.dart';
import 'package:flutter/material.dart';

abstract class BoardPainter extends CustomPainter {
  final Board board;

  final Paint strokePaint = Paint(), fillPaint = Paint(), shaderPaint = Paint();

  BoardPainter({required this.board});

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
      [quad.p1.x, quad.p2.x, quad.p3.x, quad.p4.x, quad.p1.x],
      [quad.p1.y, quad.p2.y, quad.p3.y, quad.p4.y, quad.p1.y],
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
    for (int i = 0; i <= chart.$2; i++) {
      double s = i / chart.$2;
      canvas.drawLine(
        DoublePoint.lerp(quad.p1, quad.p2, s).toOffset(),
        DoublePoint.lerp(quad.p4, quad.p3, s).toOffset(),
        paint,
      );
    }
    for (int j = 0; j <= chart.$1; j++) {
      double s = j / chart.$1;
      canvas.drawLine(
        DoublePoint.lerp(quad.p2, quad.p3, s).toOffset(),
        DoublePoint.lerp(quad.p1, quad.p4, s).toOffset(),
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

  void fillSpace(Canvas canvas, Board board, Size size) {
    var subquads = board.getSubquads();
    if (subquads.isNotEmpty) {
      drawQuad(canvas, subquads[subquads.length - 1], size, fillPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}

class BoardPreviewPainter extends BoardPainter {
  final bool locked;

  BoardPreviewPainter({
    required super.board,
    required this.locked,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final strokePaint = Paint();
    strokePaint.style = PaintingStyle.stroke;
    strokePaint.strokeWidth = 1;

    // render the lines
    strokePaint.color = const Color(0xff000000);
    for (int i = 0; i < board.quads.length; i++) {
      drawSubquads(canvas, board.quads[i], board.charts[i], size, strokePaint);
    }
    // render the space.
    fillPaint.color = const Color(0x44000000);
    fillSpace(canvas, board, size);

    if (locked) {
      strokePaint.color = const Color(0xbb000000);
      // canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), fillPaint);
      int n = 10;
      for (int i = 0; i <= n; i++) {
        canvas.drawLine(Offset(size.width * i / n, 0),
            Offset(0, size.height * i / n), strokePaint);
        canvas.drawLine(Offset(size.width * i / n, size.height),
            Offset(size.width, size.height * i / n), strokePaint);
      }
      canvas.drawRect(
          Rect.fromLTWH(0, 0, size.width, size.height), strokePaint);
      canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), fillPaint);
    }
  }
}
