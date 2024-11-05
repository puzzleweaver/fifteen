import 'package:fifteen/board/domain/board.dart';
import 'package:fifteen/board/domain/double_point.dart';
import 'package:fifteen/board/domain/quad.dart';
import 'package:fifteen/level/ui/level_renderer.dart';
import 'package:fifteen/shared/ui/custom_canvas.dart';
import 'package:flutter/material.dart';

class PreviewWidgetPainter extends FifteenPainter {
  final Board board;
  final bool locked;

  PreviewWidgetPainter({
    required this.board,
    required this.locked,
    required super.shader,
    required super.image,
  });

  @override
  void paint(Canvas canvas, Size size) {
    LevelRenderer renderer = LevelRenderer(
      canvas: canvas,
      size: size,
      shader: shader,
      image: image,
    );

    // render the lines
    renderer.setStroke(color: const Color(0xff000000));
    renderer.drawSubquadOutlines(board);
    renderer.setFill(color: const Color(0x88000000));
    if (board.subquads.isNotEmpty) {
      renderer.drawQuad(
        board.subquads[board.subquads.length - 1],
        renderer.fillPaint,
      );
    }

    if (locked) {
      renderer.setStroke(color: const Color(0xbb000000), strokeWidth: 1);
      int n = 10;
      for (int i = 0; i <= n; i++) {
        renderer.drawLine(
          DoublePoint(i / n, 0),
          DoublePoint(0, i / n),
        );

        renderer.drawLine(
          DoublePoint(i / n, 1.0),
          DoublePoint(1.0, i / n),
        );
      }
      // TODO draw the outer square
      renderer.drawQuad(Quad.unit(), renderer.strokePaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
