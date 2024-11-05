import 'package:fifteen/board/domain/board.dart';
import 'package:fifteen/game/ui/game_widget_painter.dart';
import 'package:fifteen/board/domain/double_point.dart';
import 'package:fifteen/board/domain/quad.dart';
import 'package:fifteen/game/domain/game.dart';
import 'package:fifteen/app/ui/custom_canvas.dart';
import 'package:flutter/material.dart';

class GameWidget extends StatelessWidget {
  final bool previewing;
  final Board board;
  final Game game;
  final String imageAsset;
  final void Function(int index) tapSquare;

  const GameWidget({
    super.key,
    required this.previewing,
    required this.board,
    required this.game,
    required this.imageAsset,
    required this.tapSquare,
  });

  @override
  Widget build(BuildContext context) {
    return FifteenCanvas(
      imagePath: imageAsset,
      getPainter: (shader, image) => GameWidgetPainter(
        shader: shader,
        image: image,
        game: previewing ? Game.fromBoard(board) : game,
        board: board,
      ),
      onTap: (pos) => onWidgetTap(pos),
    );
  }

  void onWidgetTap(DoublePoint pos) {
    List<Quad> quads = board.subquads;
    for (int i = 0; i < quads.length; i++) {
      if (quads[i].isInside(pos)) {
        tapSquare(i);
        return;
      }
    }
  }
}
