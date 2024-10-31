import 'package:fifteen/board/ui/builder/board_builder_page.dart';
import 'package:fifteen/game/ui/game_page.dart';
import 'package:fifteen/main.dart';
import 'package:fifteen/math/level.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LevelBuilderTabs {
  static const items = [
    BottomNavigationBarItem(
      icon: Icon(Icons.construction),
      label: "board",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.palette),
      label: "level",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: "test",
    ),
  ];

  static String title(int index) => [
        "Build Board",
        "Build Level",
        "Test Level",
      ][index];

  static Widget tab({
    required Level current,
    required void Function(Level newLevel, String description) set,
    required int index,
    required BuildContext context,
  }) =>
      [
        BoardBuilderPage(
          level: current,
          setBoard: (newBoard, description) => set(
            current.copyWith(board: newBoard),
            description,
          ),
        ),
        const Center(child: Text("hOi")),
        GamePage(
          level: current,
          appState: Provider.of<FifteenAppState>(context),
        ),
      ][index];
}
