import 'package:fifteen/math/board.dart';
import 'package:fifteen/shared_ui/board_painter.dart';
import 'package:flutter/material.dart';

class GamePreviewWidget extends StatelessWidget {
  final String imageAsset;
  final Board board;
  final double dimension;

  GamePreviewWidget(
      {required this.imageAsset, required this.board, required this.dimension});

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: dimension,
      child: Stack(
        children: [
          Image.asset(
            imageAsset,
          ),
          SizedBox.expand(
            child: CustomPaint(
              painter: BoardPreviewPainter(board: board),
            ),
          ),
        ],
      ),
    );
  }
}
