import 'package:fifteen/board/domain/board.dart';
import 'package:fifteen/debug/ui/graph_widget/graph_widget.dart';
import 'package:fifteen/game/ui/game_page.dart';
import 'package:fifteen/app/data/assets.dart';
import 'package:fifteen/app/ui/json_widget.dart';
import 'package:fifteen/level/ui/level_widget/level_widget.dart';
import 'package:flutter/material.dart';

class DebugPageBoardButton extends StatelessWidget {
  final String boardAsset;

  const DebugPageBoardButton({super.key, required this.boardAsset});

  @override
  Widget build(BuildContext context) {
    const double dimension = 75;
    return JsonWidget(
      asset: boardAsset,
      getObject: (contents) => Board.fromJson(contents),
      builder: (context, board) => ElevatedButton(
        style: ElevatedButton.styleFrom(padding: EdgeInsets.zero),
        onPressed: () => goToGamePage(context, board),
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox.square(
                  dimension: dimension,
                  child: LevelWidget(
                    board: board,
                    imageAsset: null,
                    locked: false,
                  ),
                ),
                SizedBox.square(
                  dimension: dimension,
                  child: GraphWidget(board: board),
                ),
              ],
            ),
            Text(boardAsset.split("/")[2].replaceAll(".json", "")),
          ],
        ),
      ),
    );
  }

  void goToGamePage(BuildContext context, Board board) {
    String imageAsset = Assets.randomImage;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GamePage(
          board: board,
          imageAsset: imageAsset,
        ),
      ),
    );
  }
}
