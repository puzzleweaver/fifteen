import 'package:fifteen/board/ui/builder/board_builder_page.dart';
import 'package:fifteen/game/ui/game_widget.dart';
import 'package:fifteen/level/ui/level_decorator_page.dart';
import 'package:fifteen/math/level.dart';
import 'package:flutter/material.dart';

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
        "Decorate Level",
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
        LevelDecoratorPage(
          level: current,
          setLevel: set,
        ),
        const GameWidget(previewing: false),
      ][index];
}
