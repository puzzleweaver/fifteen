import 'package:fifteen/board/domain/board.dart';
import 'package:fifteen/board/domain/coord.dart';
import 'package:fifteen/level/ui/level_renderer.dart';
import 'package:fifteen/math/level.dart';
import 'package:fifteen/shared/ui/custom_canvas.dart';
import 'package:flutter/material.dart';

class BoardBuilderPainter extends FifteenPainter {
  final Level level;
  final List<Coord> selectedCoords;

  BoardBuilderPainter({
    required super.image,
    required super.shader,
    required this.level,
    required this.selectedCoords,
  });

  Board get board => level.board;

  @override
  void paint(Canvas canvas, Size size) {
    LevelRenderer renderer = LevelRenderer(
      canvas: canvas,
      size: size,
      shader: shader,
      image: image,
    );
    renderer.drawBackground(Colors.grey.withAlpha(255 ~/ 10));
    renderer.drawSubquadOutlines(board);
    renderer.setFill(color: const Color(0x88000000));
    if (board.charts.isNotEmpty) {
      renderer.drawQuad(
        board.subquads[board.subquads.length - 1],
        renderer.fillPaint,
      );
    }
    drawEquidistantConstraints(renderer);
    drawControlPoints(renderer);
    drawSelection(renderer);
    drawCoincidentConstraints(renderer);
  }

  void drawEquidistantConstraints(LevelRenderer renderer) {
    var eqs = board.constraints.equidistants;
    for (int i = 0; i < eqs.length; i++) {
      renderer.setStroke(
        strokeWidth: 10,
        color:
            HSLColor.fromAHSL(0.5, 360.0 * i / eqs.length, 1.0, 0.5).toColor(),
      );
      for (var s in eqs[i].sides) {
        renderer.drawLine(
          board.getVertex(s.c1),
          board.getVertex(s.c2),
        );
      }
    }
  }

  void drawCoincidentConstraints(LevelRenderer renderer) {
    var coins = board.constraints.coincidents;
    renderer.setStroke(color: Colors.black, strokeWidth: 1);
    for (final coin in coins) {
      // renderer.setFill(
      //   color: HSLColor.fromAHSL(1, 360.0 * i / coins.length, 1, 0.5).toColor(),
      // );
      renderer.setFill(color: Colors.black);
      renderer.drawVertices(board, coin.coords, 0.015);
      for (int i = 0; i < coin.coords.length; i++) {
        for (int j = i + 1; j < coin.coords.length; j++) {
          renderer.drawLine(
            board.getVertex(coin.coords.toList()[i]),
            board.getVertex(coin.coords.toList()[j]),
          );
        }
      }
    }
  }

  void drawSelection(LevelRenderer renderer) {
    if (selectedCoords.isEmpty) {
      return;
    } else if (selectedCoords.first.isSpace) {
      renderer.setFill(color: const Color(0x88ffff00));
      for (Coord coord in selectedCoords) {
        renderer.drawQuad(
          board.subquads[board.getIndex(coord)],
          renderer.fillPaint,
        );
      }
    } else {
      renderer.setStroke(strokeWidth: 8, color: const Color(0x88000000));
      for (int i = 0; i + 1 < selectedCoords.length; i++) {
        renderer.setStroke(
          color: i % 2 == 0 ? const Color(0xbb000000) : const Color(0x88000000),
        );
        renderer.drawLine(
          board.getVertex(selectedCoords[i]),
          board.getVertex(selectedCoords[i + 1]),
        );
      }
      renderer.setStroke(color: const Color(0x44000000), strokeWidth: 2);
      renderer.setFill(color: const Color.fromRGBO(255, 255, 0, 0.5));
      renderer.drawVertices(board, selectedCoords, 0.04);
    }
  }

  void drawControlPoints(LevelRenderer renderer) {
    renderer.setStroke(color: const Color(0x00000000), strokeWidth: 2);
    renderer.setFill(color: const Color.fromRGBO(0, 255, 255, 0.25));
    renderer.drawVertices(board, board.edgeCoords, 0.04);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
