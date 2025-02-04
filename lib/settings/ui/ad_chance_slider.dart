import 'dart:math';

import 'package:fifteen/app/domain/preferences.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdChanceSlider extends StatefulWidget {
  const AdChanceSlider({super.key});

  @override
  State<StatefulWidget> createState() => AdChanceSliderState();
}

class AdChanceSliderState extends State<AdChanceSlider> {
  @override
  Widget build(BuildContext context) {
    Preferences prefs = Provider.of(context);
    return ListTile(
      title: Row(
        children: [
          const Text("Ad Chance:"),
          Expanded(
            child: Slider(
              value: prefs.adChance,
              onChanged: (newAdChance) {
                prefs.adChance = newAdChance;
                setState(() {});
              },
              min: min(0.4, prefs.adChance),
              max: max(0.8, prefs.adChance),
            ),
          ),
        ],
      ),
      subtitle: const Text(
        "Ads are shown with a random chance, and showing more means more money for the developer. Either way, thank you!",
      ),
    );
  }
}
