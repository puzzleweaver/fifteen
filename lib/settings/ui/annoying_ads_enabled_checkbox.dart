import 'package:fifteen/app/ui/preferences_widget.dart';
import 'package:flutter/material.dart';

class AnnoyingAdsEnabledCheckbox extends StatefulWidget {
  const AnnoyingAdsEnabledCheckbox({super.key});

  @override
  State<StatefulWidget> createState() => AnnoyingAdsEnabledCheckboxState();
}

class AnnoyingAdsEnabledCheckboxState
    extends State<AnnoyingAdsEnabledCheckbox> {
  @override
  Widget build(BuildContext context) {
    return PreferencesWidget(
      builder: (context, preferences) => Column(
        children: [
          CheckboxListTile(
            title: Text(
              "Interstitial Ads${preferences.annoyingAdsEnabled ? ' <3' : ''}",
            ),
            subtitle: const Text(
              "A full-screen ad shown between screens will pay about 40x more than a typical banner ad. Each one goes a long way, even if they're really annoying.",
            ),
            value: preferences.annoyingAdsEnabled,
            onChanged: (newAnnoyingAdsEnabled) {
              preferences.annoyingAdsEnabled = newAnnoyingAdsEnabled ?? false;
              setState(() {});
            },
            controlAffinity: ListTileControlAffinity.leading,
          ),
        ],
      ),
    );
  }
}
