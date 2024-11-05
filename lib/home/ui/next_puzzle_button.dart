import 'package:fifteen/board/domain/board.dart';
import 'package:fifteen/game/ui/game_page.dart';
import 'package:fifteen/app/data/assets.dart';
import 'package:fifteen/app/domain/preferences_data.dart';
import 'package:fifteen/app/ui/preferences_widget.dart';
import 'package:flutter/material.dart';

class NextPuzzleButton extends StatelessWidget {
  const NextPuzzleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferencesWidget(
      builder: (context, preferences) => ElevatedButton(
        onPressed: () => goToNext(context, preferences),
        child: const Text("Play Next Puzzle"),
      ),
    );
  }

  void goToNext(BuildContext context, PreferencesData preferences) async {
    NavigatorState navigator = Navigator.of(context);

    String boardAsset = Assets.boards
        .where((asset) => !preferences.solvedBoards.contains(asset))
        .first;

    String data = await DefaultAssetBundle.of(context).loadString(boardAsset);
    Board nextBoard = Board.fromJson(data);

    String imageAsset = Assets.images[Assets.boards.indexOf(boardAsset)];

    navigator.push(
      MaterialPageRoute(
        builder: (context) => GamePage(
          board: nextBoard,
          imageAsset: imageAsset,
        ),
      ),
    );
  }
}
