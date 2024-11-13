import 'package:fifteen/app/ui/preferences_widget.dart';
import 'package:flutter/material.dart';

class GameMoveCountWidget extends StatelessWidget {
  final int moveCount;

  const GameMoveCountWidget({super.key, required this.moveCount});

  @override
  Widget build(BuildContext context) {
    return PreferencesWidget(
      builder: (context, preferences) {
        if (!preferences.moveCountEnabled) return const Text("\u00b7");
        return Text(
          "moves: $moveCount",
          textScaler: TextScaler.linear(2),
        );
      },
    );
  }
}
