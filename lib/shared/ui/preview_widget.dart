import 'package:fifteen/math/level.dart';
import 'package:fifteen/shared/ui/board_painter.dart';
import 'package:flutter/material.dart';

class PreviewWidget extends StatelessWidget {
  final Level level;
  final bool locked;
  final bool showImage;

  const PreviewWidget({
    super.key,
    required this.level,
    required this.locked,
    this.showImage = true,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: Stack(
        fit: StackFit.expand,
        children: [
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
