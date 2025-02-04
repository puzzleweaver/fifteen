import 'package:fifteen/app/domain/preferences.dart';
import 'package:fifteen/app/ui/orienter.dart';
import 'package:fifteen/board/domain/board.dart';
import 'package:fifteen/completion/data/completions.dart';
import 'package:fifteen/completion/data/preferences_completions.dart';
import 'package:fifteen/level/ui/level_list_page/level_list_button.dart';
import 'package:fifteen/app/data/assets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LevelListPage extends StatelessWidget {
  const LevelListPage({super.key});

  @override
  Widget build(BuildContext context) {
    Preferences prefs = Provider.of(context);
    List<Board> boardSequence = Provider.of(context);
    Completions completions = PreferencesCompletions(prefs: prefs);
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Levels"),
      ),
      body: SingleChildScrollView(
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
                  isLocked: completions.isLocked(
                    boardSequence,
                    boardSequence[i].id,
                  ),
                  isSolved: completions.isSolved(boardSequence[i].id),
                  imageAsset: Assets.images[i],
                  board: boardSequence[i],
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget streamLevelButton({
    required bool isSolved,
    required bool isLocked,
    required Board board,
    required String imageAsset,
  }) {
    return LevelListButton(
      isLocked: isLocked,
      isSolved: isSolved,
      imageAsset: imageAsset,
      board: board,
    );
  }
}
