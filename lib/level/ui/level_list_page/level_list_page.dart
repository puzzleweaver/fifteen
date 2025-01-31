import 'package:fifteen/app/ui/loading_widget.dart';
import 'package:fifteen/app/ui/orienter.dart';
import 'package:fifteen/board/data/boards.dart';
import 'package:fifteen/board/data/file_boards.dart';
import 'package:fifteen/board/domain/board.dart';
import 'package:fifteen/completion/data/completions.dart';
import 'package:fifteen/completion/data/preferences_completions.dart';
import 'package:fifteen/level/ui/level_list_page/level_list_button.dart';
import 'package:fifteen/app/data/assets.dart';
import 'package:fifteen/app/ui/preferences_widget.dart';
import 'package:flutter/material.dart';

class LevelListPage extends StatelessWidget {
  const LevelListPage({super.key});

  @override
  Widget build(BuildContext context) {
    Boards boards = FileBoards(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Levels"),
      ),
      body: FutureBuilder(
        future: boards.sequence(),
        builder: (context, snapshot) {
          List<Board>? boardSequence = snapshot.data;
          if (boardSequence == null) return const LoadingWidget();
          return PreferencesWidget(
            builder: (context, preferences) {
              Completions completions =
                  PreferencesCompletions(preferences: preferences);
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: Orienter(context).isTall ? 3 : 5,
                    padding: const EdgeInsets.all(5.0),
                    mainAxisSpacing: 5.0,
                    crossAxisSpacing: 5.0,
                    children: [
                      for (int i = 0; i < boardSequence.length; i++)
                        streamLevelButton(
                          isLockedStream: completions.isLocked(
                            boardSequence,
                            boardSequence[i].id,
                          ),
                          isSolvedStream:
                              completions.isSolved(boardSequence[i].id),
                          imageAsset: Assets.images[i],
                          board: boardSequence[i],
                        ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget streamLevelButton({
    required Stream<bool> isSolvedStream,
    required Stream<bool> isLockedStream,
    required Board board,
    required String imageAsset,
  }) =>
      StreamBuilder(
        stream: isLockedStream,
        builder: (context, isLockedSnapshot) => StreamBuilder(
          stream: isSolvedStream,
          builder: (context, isSolvedSnapshot) {
            bool? isLocked = isLockedSnapshot.data;
            bool? isSolved = isSolvedSnapshot.data;
            if (isSolved == null || isLocked == null) {
              return const LoadingWidget();
            }
            return LevelListButton(
              isLocked: isLocked,
              isSolved: isSolved,
              imageAsset: imageAsset,
              board: board,
            );
          },
        ),
      );
}
