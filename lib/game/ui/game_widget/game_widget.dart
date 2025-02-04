import 'package:fifteen/game/ui/game_page/gameplay_state.dart';
import 'package:fifteen/game/ui/game_page/slide_state.dart';
import 'package:fifteen/game/ui/game_widget/game_widget_painter.dart';
import 'package:fifteen/board/domain/double_point.dart';
import 'package:fifteen/board/domain/quad.dart';
import 'package:fifteen/app/ui/custom_canvas.dart';
import 'package:flutter/material.dart';

class GameWidget extends StatelessWidget {
  final bool previewing;
  final GameplayState gameplayState;
  final String imageAsset;
  final void Function(int index) tapSquare;
  final SlideState slideState;

  const GameWidget({
    super.key,
    required this.previewing,
    required this.gameplayState,
    required this.imageAsset,
    required this.tapSquare,
    required this.slideState,
  });

  get board => gameplayState.board;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(color: ColorScheme.of(context).primary),
        Center(
          child: FifteenCanvas(
            imagePath: imageAsset,
            getPainter: (shader, image) => GameWidgetPainter(
              shader: shader,
              image: image,
              gameplayState:
                  previewing ? gameplayState.previewing : gameplayState,
              slideState: slideState,
            ),
            onTap: (pos) => onWidgetTap(pos),
          ),
        ),
      ],
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
