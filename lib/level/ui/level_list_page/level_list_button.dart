import 'package:fifteen/board/domain/board.dart';
import 'package:fifteen/game/ui/game_page.dart';
import 'package:fifteen/app/ui/json_widget.dart';
import 'package:fifteen/level/ui/level_widget/level_widget.dart';
import 'package:flutter/material.dart';

class LevelListButton extends StatelessWidget {
  final bool isLocked;
  final bool isSolved;
  final String imageAsset;
  final String boardAsset;

  const LevelListButton({
    super.key,
    required this.isLocked,
    required this.isSolved,
    required this.imageAsset,
    required this.boardAsset,
  });

  @override
  Widget build(BuildContext context) {
    return JsonWidget(
      asset: boardAsset,
      getObject: (content) => Board.fromJson(content),
      builder: (context, board) => ElevatedButton(
        onPressed: isLocked ? null : () => goToGame(context, board, imageAsset),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(8.0),
          backgroundColor: isSolved ? Colors.green : Colors.blue,
        ),
        child: LevelWidget(
          board: board,
          imageAsset: imageAsset,
          locked: isLocked,
        ),
      ),
    );
  }

  void goToGame(BuildContext context, Board board, String imageAsset) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return GamePage(
            board: board,
            imageAsset: imageAsset,
            boardAsset: boardAsset,
          );
        },
      ),
    );
  }
}
