import 'package:fifteen/board/domain/board.dart';
import 'package:fifteen/level/ui/level_widget/level_widget.dart';
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
      child: LevelWidget(
        board: board,
        imageAsset: imageAsset,
        locked: false,
      ),
      // child: ElevatedButton(
      //   onPressed: () => {},
      //   child: const Text("View Solution"),
      // ),
    );
  }
}
