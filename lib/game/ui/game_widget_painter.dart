import 'package:fifteen/board/domain/board.dart';
import 'package:fifteen/level/ui/level_renderer.dart';
import 'package:fifteen/game/domain/game.dart';
import 'package:fifteen/board/domain/quad.dart';
import 'package:fifteen/app/ui/custom_canvas.dart';
import 'package:flutter/material.dart';

class GameWidgetPainter extends FifteenPainter {
  final Game game;
  final Board board;

  GameWidgetPainter({
    required this.game,
    required this.board,
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

    // background
    renderer.drawQuadWithShader(
      from: Quad.unit(),
      to: Quad.unit(),
      shape: Quad.unit(),
    );

    List<Quad> quads = board.subquads;

    // rounded outline
    renderer.setStroke(strokeWidth: 5);
    // for (Quad quad in quads) {
    //   renderer.drawQuad(quad, renderer.strokePaint);
    // }
    renderer.drawSubquadOutlines(board);

    renderer.setFill(color: Colors.black);
    for (int i = 0; i < quads.length; i++) {
      Quad q = quads[i], from, to;
      from = q;
      to = game.getQuad(quads, i);
      if (game.isSpace(i)) {
        renderer.drawQuad(q, renderer.fillPaint);
      } else {
        renderer.drawQuadWithShader(from: from, to: to, shape: q);
      }
    }

    // draw subquad divisions
    renderer.setStroke(strokeWidth: 0.5);
    renderer.drawSubquadOutlines(board);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}
