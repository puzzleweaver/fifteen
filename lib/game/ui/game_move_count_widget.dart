import 'package:fifteen/app/domain/preferences.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GameMoveCountWidget extends StatelessWidget {
  final int moveCount;

  const GameMoveCountWidget({super.key, required this.moveCount});

  @override
  Widget build(BuildContext context) {
    Preferences prefs = Provider.of(context);
    if (!prefs.moveCountEnabled) return const Text("\u00b7");
    return Text(
      "moves: $moveCount",
      textScaler: TextScaler.linear(2),
    );
  }
}
