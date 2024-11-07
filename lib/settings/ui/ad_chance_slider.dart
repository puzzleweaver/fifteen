import 'dart:math';

import 'package:fifteen/app/ui/preferences_widget.dart';
import 'package:flutter/material.dart';

class AdChanceSlider extends StatefulWidget {
  const AdChanceSlider({super.key});

  @override
  State<StatefulWidget> createState() => AdChanceSliderState();
}

class AdChanceSliderState extends State<AdChanceSlider> {
  @override
  Widget build(BuildContext context) {
    return PreferencesWidget(
      builder: (context, preferences) => ListTile(
        title: Row(
          children: [
            const Text("Ad Chance:"),
            Expanded(
              child: Slider(
                value: preferences.adChance,
                onChanged: (newAdChance) {
                  preferences.adChance = newAdChance;
                  setState(() {});
                },
                min: min(0.4, preferences.adChance),
                max: max(0.8, preferences.adChance),
              ),
            ),
          ],
        ),
        subtitle: const Text(
          "Ads are shown with a random chance, and showing more means more money for the developer. Either way, thank you!",
        ),
      ),
    );
  }
}
