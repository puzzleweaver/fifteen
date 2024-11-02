import 'package:fifteen/shared/ui/preferences_widget.dart';
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
              "Showing an interstitial ad pays about 40x more than showing a banner. Each one you see goes a long way",
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
