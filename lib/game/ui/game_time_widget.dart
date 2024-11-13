import 'package:fifteen/app/ui/preferences_widget.dart';
import 'package:fifteen/app/ui/time_display.dart';
import 'package:flutter/material.dart';

class GameTimeWidget extends StatelessWidget {
  final Duration time;

  const GameTimeWidget({super.key, required this.time});

  @override
  Widget build(BuildContext context) {
    return PreferencesWidget(
      builder: (context, preferences) {
        if (!preferences.timerEnabled) return const Text("\u00b7");
        return TimeDisplay(
          time: time,
          builder: (context, timeString) => Text(
            timeString,
            textScaler: TextScaler.linear(2),
          ),
        );
      },
    );
  }
}
