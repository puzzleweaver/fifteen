import 'package:fifteen/app/domain/preferences.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnimationSettingsWidget extends StatelessWidget {
  const AnimationSettingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Preferences prefs = Provider.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Animation Speed:"),
        Wrap(
          spacing: 10,
          children: [
            _choiceButton(speed: 0, label: "Off", prefs: prefs),
            if (kDebugMode)
              _choiceButton(
                speed: 2000,
                label: "Debug",
                prefs: prefs,
              ),
            _choiceButton(speed: 300, label: "Medium", prefs: prefs),
            _choiceButton(speed: 100, label: "Fast", prefs: prefs),
            _choiceButton(speed: 50, label: "Very Fast", prefs: prefs),
          ],
        ),
      ],
    );
  }

  Widget _choiceButton({
    required Preferences prefs,
    required int speed,
    required String label,
  }) {
    return ElevatedButton(
      onPressed: speed == prefs.animationSpeed
          ? null
          : () => prefs.animationSpeed = speed,
      child: Text(label),
    );
  }
}
