import 'package:fifteen/game/ui/game_painter.dart';
import 'package:fifteen/main.dart';
import 'package:fifteen/board/domain/double_point.dart';
import 'package:fifteen/board/domain/quad.dart';
import 'package:fifteen/math/game.dart';
import 'package:fifteen/shared/ui/custom_canvas.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GameWidget extends StatelessWidget {
  final bool previewing;

  const GameWidget({
    super.key,
    required this.previewing,
  });

  @override
  Widget build(BuildContext context) {
    FifteenAppState appState = Provider.of(context);

    return FifteenCanvas(
      imagePath: appState.level.image,
      getPainter: (shader, image) => GameWidgetPainter(
        shader: shader,
        image: image,
        game: previewing ? Game.fromBoard(appState.board) : appState.game,
        level: appState.level,
      ),
      onTap: (pos) => onWidgetTap(pos, appState),
    );
  }

  void onWidgetTap(DoublePoint pos, FifteenAppState appState) {
    List<Quad> quads = appState.board.subquads;
    for (int i = 0; i < quads.length; i++) {
      if (quads[i].isInside(pos)) {
        appState.tapAtIndex(i);
      }
    }
  }
}
