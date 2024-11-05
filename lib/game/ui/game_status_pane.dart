import 'package:fifteen/app/ui/preferences_widget.dart';
import 'package:fifteen/app/ui/time_display.dart';
import 'package:flutter/material.dart';

class GameStatusWidget extends StatelessWidget {
  final List<Widget> children;
  final int moveCount;
  final Duration time;

  const GameStatusWidget({
    super.key,
    required this.children,
    required this.moveCount,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return PreferencesWidget(
      builder: (context, preferences) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (preferences.timerEnabled || preferences.moveCountEnabled)
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (preferences.timerEnabled)
                  TimeDisplay(
                    time: time,
                    builder: (context, timeString) => Text(
                      timeString,
                      style: const TextStyle(fontSize: 14 * 3),
                    ),
                  ),
                if (preferences.moveCountEnabled)
                  Text(
                    "moves: $moveCount",
                    style: const TextStyle(fontSize: 14 * 2),
                  ),
              ],
            ),
          ...children,
        ],
      ),
    );
  }
}
