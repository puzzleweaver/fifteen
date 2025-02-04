import 'package:fifteen/app/domain/preferences.dart';
import 'package:fifteen/board/domain/board.dart';
import 'package:fifteen/completion/data/completions.dart';
import 'package:fifteen/completion/data/preferences_completions.dart';
import 'package:fifteen/game/ui/game_page/game_page.dart';
import 'package:fifteen/app/data/assets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NextPuzzleButton extends StatelessWidget {
  final Widget child;
  final bool pushReplace;
  const NextPuzzleButton({
    super.key,
    required this.child,
    required this.pushReplace,
  });

  @override
  Widget build(BuildContext context) {
    Preferences prefs = Provider.of(context);
    Completions completions = PreferencesCompletions(prefs: prefs);
    List<Board> boardSequence = Provider.of(context);
    Board? nextBoard = completions.next(boardSequence);

    onPressed(Board board) => goToNext(
          context,
          board,
          Assets.images[boardSequence.indexOf(board)],
        );

    return ElevatedButton(
      onPressed: nextBoard == null ? null : () => onPressed(nextBoard),
      child: child,
    );
  }

  void goToNext(BuildContext context, Board board, String imageAsset) {
    Route route = MaterialPageRoute(
      builder: (context) => GamePage(
        board: board,
        imageAsset: imageAsset,
      ),
    );
    NavigatorState navigator = Navigator.of(context);
    (pushReplace ? navigator.pushReplacement : navigator.push)(route);
  }
}
