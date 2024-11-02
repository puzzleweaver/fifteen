import 'package:fifteen/board/domain/board.dart';
import 'package:fifteen/game/ui/game_page.dart';
import 'package:fifteen/main.dart';
import 'package:fifteen/math/level.dart';
import 'package:fifteen/shared/ui/json_widget.dart';
import 'package:fifteen/shared/ui/preview_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      getObject: (content) => Level(
        board: Board.fromJson(content),
        image: imageAsset,
      ),
      builder: (context, level) => ElevatedButton(
        onPressed: isLocked ? null : () => goToGame(context, level),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(8.0),
          backgroundColor: isSolved ? Colors.green : Colors.blue,
        ),
        child: PreviewWidget(
          level: level,
          locked: isLocked,
        ),
      ),
    );
  }

  void goToGame(BuildContext context, Level level) {
    Provider.of<FifteenAppState>(context, listen: false)
      ..rerollAds()
      ..setLevel(level);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return GamePage(
            level: level,
            boardAsset: boardAsset,
          );
        },
      ),
    );
  }
}
