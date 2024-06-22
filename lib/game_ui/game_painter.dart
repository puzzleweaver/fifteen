import 'dart:ui';
import 'dart:ui' as ui;

import 'package:fifteen/math/game.dart';
import 'package:fifteen/math/quad.dart';
import 'package:fifteen/shared_ui/board_painter.dart';
import 'package:flutter/material.dart';

class GamePainter extends BoardPainter {
  final FragmentShader shader;
  final ui.Image? image;
  final Game game;

  GamePainter({
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
      Quad q = quads[i], from, to;
      if (game.isSolved(i)) {
        from = to = Quad.unit(); // NEVER distort the solved image
      } else {
        from = q;
        to = game.getQuad(quads, i);
      }
      setQuads(2, from, to);
      drawQuad(canvas, q, size, game.isSpace(i) ? fillPaint : shaderPaint);

      drawQuad(canvas, q, size, strokePaint);
    }
  }
}

class BoardPreviewPainter extends BoardPainter {
  BoardPreviewPainter({required super.board});

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
