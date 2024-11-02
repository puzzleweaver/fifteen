import 'package:fifteen/shared/ui/preferences_widget.dart';
import 'package:flutter/material.dart';

class TimerEnabledCheckbox extends StatefulWidget {
  const TimerEnabledCheckbox({super.key});

  @override
  State<StatefulWidget> createState() => TimerEnabledCheckboxState();
}

class TimerEnabledCheckboxState extends State<TimerEnabledCheckbox> {
  @override
  Widget build(BuildContext context) {
    return PreferencesWidget(
      builder: (context, preferences) => CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        value: preferences.timerEnabled,
        onChanged: (newTimerEnabled) {
          preferences.timerEnabled = newTimerEnabled ?? false;
          setState(() {});
        },
        title: const Text("Timer Enabled"),
      ),
    );
  }
}
