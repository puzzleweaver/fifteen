import 'package:fifteen/app/ui/loading_widget.dart';
import 'package:fifteen/board/data/boards.dart';
import 'package:fifteen/board/data/file_boards.dart';
import 'package:fifteen/board/domain/board.dart';
import 'package:fifteen/completion/data/completions.dart';
import 'package:fifteen/completion/data/preferences_completions.dart';
import 'package:fifteen/game/ui/game_page.dart';
import 'package:fifteen/app/data/assets.dart';
import 'package:fifteen/app/ui/preferences_widget.dart';
import 'package:flutter/material.dart';

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
    Boards boards = FileBoards(context);
    return FutureBuilder(
      future: boards.sequence(),
      builder: (context, boardSequenceSnapshot) {
        List<Board>? boardSequence = boardSequenceSnapshot.data;
        if (boardSequence == null) return const LoadingWidget();
        return PreferencesWidget(
          builder: (context, preferences) {
            Completions completions = PreferencesCompletions(
              preferences: preferences,
            );
            return StreamBuilder(
              stream: completions.next(boardSequence),
              builder: (context, snapshot) {
                Board? nextBoard = snapshot.data;
                final onPressed = nextBoard == null
                    ? null
                    : () => goToNext(context, nextBoard,
                        Assets.images[boardSequence.indexOf(nextBoard)]);
                return ElevatedButton(
                  onPressed: onPressed,
                  child: child,
                );
              },
            );
          },
        );
      },
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
