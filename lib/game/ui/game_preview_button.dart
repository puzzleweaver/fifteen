import 'package:fifteen/board/domain/board.dart';
import 'package:flutter/material.dart';

class GamePreviewButton extends StatelessWidget {
  final Board board;
  final String imageAsset;
  final void Function(bool previewing) setPreviewing;

  const GamePreviewButton({
    super.key,
    required this.setPreviewing,
    required this.board,
    required this.imageAsset,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) => setPreviewing(true),
      onTapUp: (details) => setPreviewing(false),
      onTapCancel: () => setPreviewing(false),
      // child: LevelWidget(
      //   board: board,
      //   imageAsset: imageAsset,
      //   locked: false,
      // ),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Text(
          "View Solution",
          textScaler: TextScaler.linear(1.5),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
