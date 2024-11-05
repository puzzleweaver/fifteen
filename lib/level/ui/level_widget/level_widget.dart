import 'package:fifteen/board/domain/board.dart';
import 'package:fifteen/app/data/assets.dart';
import 'package:fifteen/level/ui/level_widget/level_widget_painter.dart';
import 'package:fifteen/app/ui/custom_canvas.dart';
import 'package:flutter/material.dart';

class LevelWidget extends StatelessWidget {
  final Board board;
  final String? imageAsset;
  final bool locked;

  const LevelWidget({
    super.key,
    required this.board,
    required this.imageAsset,
    required this.locked,
  });

  @override
  Widget build(BuildContext context) {
    String? imageAsset = this.imageAsset;
    return AspectRatio(
      aspectRatio: 1.0,
      child: Stack(
        fit: StackFit.expand,
        children: [
          if (imageAsset != null)
            Image.asset(
              imageAsset,
              fit: BoxFit.fill,
            ),
          FifteenCanvas(
            getPainter: (shader, image) => LevelWidgetPainter(
              board: board,
              locked: locked,
              shader: shader,
              image: image,
            ),
            imagePath: Assets.defaultImage,
          ),
        ],
      ),
    );
  }
}
