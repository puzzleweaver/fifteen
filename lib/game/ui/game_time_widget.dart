import 'package:fifteen/app/domain/preferences.dart';
import 'package:fifteen/app/ui/time_display.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GameTimeWidget extends StatelessWidget {
  final Duration time;

  const GameTimeWidget({super.key, required this.time});

  @override
  Widget build(BuildContext context) {
    Preferences prefs = Provider.of(context);
    if (!prefs.timerEnabled) return const Text("\u00b7");
    return TimeDisplay(
      time: time,
      builder: (context, timeString) => Text(
        timeString,
        textScaler: TextScaler.linear(2),
      ),
    );
  }
}
