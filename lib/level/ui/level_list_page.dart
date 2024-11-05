import 'dart:math';

import 'package:fifteen/level/ui/level_list_button.dart';
import 'package:fifteen/shared/data/assets.dart';
import 'package:fifteen/shared/ui/preferences_widget.dart';
import 'package:flutter/material.dart';

class LevelListPage extends StatelessWidget {
  const LevelListPage({super.key});

  @override
  Widget build(BuildContext context) {
    int levelCount = min(Assets.images.length, Assets.boards.length);

    return Scaffold(
      appBar: AppBar(
        title: const Text("All Levels"),
      ),
      body: PreferencesWidget(
        builder: (context, preferences) {
          int furthestSolved = preferences.solvedBoards
              .map((asset) => Assets.boards.indexOf(asset))
              .reduce(
                (best, index) => max(best, index),
              );
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
                  for (int i = 0; i < levelCount; i++)
                    LevelListButton(
                      isLocked: i == 0 ? false : i > furthestSolved + 1,
                      isSolved: preferences.solvedBoards.contains(
                        Assets.boards[i],
                      ),
                      imageAsset: Assets.images[i],
                      boardAsset: Assets.boards[i],
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
