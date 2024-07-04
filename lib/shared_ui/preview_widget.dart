import 'package:fifteen/math/level.dart';
import 'package:fifteen/shared_ui/board_painter.dart';
import 'package:flutter/material.dart';

class PreviewWidget extends StatelessWidget {
  final Level level;
  final bool locked;
  final bool showImage;
  final bool showBackground;

  PreviewWidget({
    required this.level,
    required this.locked,
    this.showImage = true,
    this.showBackground = true,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: Stack(
        fit: StackFit.expand,
        children: [
          if (showBackground)
            Image.asset(
              "assets/images/bg${level.background}.png",
              fit: BoxFit.fill,
            ),
          if (showImage)
            Image.asset(
              level.image,
              fit: BoxFit.fill,
            ),
          CustomPaint(
            painter: BoardPreviewPainter(
              board: level.board,
              locked: locked,
            ),
          ),
        ],
      ),
    );
  }
}
