import 'dart:ui';
import 'dart:ui' as ui;

import 'package:fifteen/game/ui/game_painter.dart';
import 'package:fifteen/main.dart';
import 'package:fifteen/math/double_point.dart';
import 'package:fifteen/math/level.dart';
import 'package:fifteen/math/quad.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GameWidget extends StatelessWidget {
  final FragmentShader? shader;
  final ui.Image? image;
  final bool previewing;
  final Level level;

  const GameWidget({
    super.key,
    this.shader,
    this.image,
    required this.previewing,
    required this.level,
  });

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<FifteenAppState>();

    return AspectRatio(
      aspectRatio: 1.0,
      child: (shader == null || image == null)
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
              child: GestureDetector(
                onTapDown: (tapDetails) =>
                    onWidgetTap(tapDetails, appState, context),
                child: CustomPaint(
                  painter: GamePainter(
                    shader: shader!,
                    image: image,
                    game: appState.game,
                    board: level.board,
                    previewing: previewing,
                    background: level.background,
                  ),
                ),
              ),
            ),
    );
  }

  void onWidgetTap(
    TapDownDetails tapDetails,
    FifteenAppState appState,
    BuildContext context,
  ) {
    final size = context.size ?? const Size(1.0, 1.0);

    DoublePoint pos = DoublePoint.fromOffset(tapDetails.localPosition);
    pos = DoublePoint(pos.x / size.width, pos.y / size.height);

    List<Quad> quads = appState.board.getSubquads();
    for (int i = 0; i < quads.length; i++) {
      if (quads[i].isInside(pos)) {
        appState.tapAtIndex(i);
      }
    }
  }
}
