import 'package:fifteen/app/domain/preferences.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MoveCountEnabledCheckbox extends StatelessWidget {
  const MoveCountEnabledCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    Preferences prefs = Provider.of(context);
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      value: prefs.moveCountEnabled,
      onChanged: (newValue) => prefs.moveCountEnabled = newValue ?? false,
      title: const Text("Move Counter Enabled"),
    );
  }
}
