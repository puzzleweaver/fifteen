import 'package:fifteen/board/data/boards.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Levels"),
      ),
      body: FutureBuilder(
        future: Boards.getSequence(context),
        builder: (context, snapshot) {
          List<Board>? boardSequence = snapshot.data;
          if (boardSequence == null) {
            return const Center(child: CircularProgressIndicator());
          }
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
                    crossAxisCount: 3,
                    padding: const EdgeInsets.all(5.0),
                    mainAxisSpacing: 5.0,
                    crossAxisSpacing: 5.0,
                    children: [
                      for (int i = 0; i < boardSequence.length; i++)
                        LevelListButton(
                          isLocked: completions.isLocked(
                            boardSequence.map((board) => board.id).toList(),
                            boardSequence[i].id,
                          ),
                          isSolved: completions.isSolved(boardSequence[i].id),
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
}
