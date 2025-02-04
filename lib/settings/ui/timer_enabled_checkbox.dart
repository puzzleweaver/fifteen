import 'package:fifteen/app/domain/preferences.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TimerEnabledCheckbox extends StatelessWidget {
  const TimerEnabledCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    Preferences prefs = Provider.of(context);
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      value: prefs.timerEnabled,
      onChanged: (newTimerEnabled) =>
          prefs.timerEnabled = newTimerEnabled ?? false,
      title: const Text("Timer Enabled"),
    );
  }
}
