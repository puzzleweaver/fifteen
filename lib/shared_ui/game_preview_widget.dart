import 'package:fifteen/math/level.dart';
import 'package:fifteen/shared_ui/board_painter.dart';
import 'package:flutter/material.dart';

class PreviewWidget extends StatelessWidget {
  final Level level;
  final double dimension;
  final bool locked;

  PreviewWidget({
    required this.level,
    required this.dimension,
    required this.locked,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: dimension,
      child: Stack(
        children: [
          Image.asset(level.image),
          SizedBox.expand(
            child: CustomPaint(
              painter: BoardPreviewPainter(
                board: level.board,
                locked: locked,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
