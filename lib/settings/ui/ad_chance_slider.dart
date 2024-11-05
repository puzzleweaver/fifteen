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
                min: 1.0 / 3.0,
                max: 1.0,
              ),
            ),
          ],
        ),
        subtitle: const Text(
          "Banner Ads are shown with a certain probability. More ads means more money for the developer :)",
        ),
      ),
    );
  }
}
