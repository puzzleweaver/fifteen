import 'package:fifteen/app/ui/preferences_widget.dart';
import 'package:flutter/material.dart';

class MoveCountEnabledCheckbox extends StatefulWidget {
  const MoveCountEnabledCheckbox({super.key});

  @override
  State<StatefulWidget> createState() => MoveCountEnabledCheckboxState();
}

class MoveCountEnabledCheckboxState extends State<MoveCountEnabledCheckbox> {
  @override
  Widget build(BuildContext context) {
    return PreferencesWidget(
      builder: (context, preferences) => CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        value: preferences.moveCountEnabled,
        onChanged: (newTimerEnabled) {
          preferences.moveCountEnabled = newTimerEnabled ?? false;
          setState(() {});
        },
        title: const Text("Move Counter Enabled"),
      ),
    );
  }
}
