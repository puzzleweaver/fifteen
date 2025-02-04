import 'package:fifteen/app/domain/preferences.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnnoyingAdsEnabledCheckbox extends StatelessWidget {
  const AnnoyingAdsEnabledCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    Preferences prefs = Provider.of(context);
    return Column(
      children: [
        CheckboxListTile(
          title: Text(
            "Interstitial Ads${prefs.annoyingAdsEnabled ? ' <3' : ''}",
          ),
          subtitle: const Text(
            "A full-screen ad shown between screens will pay about 40x more than a typical banner ad. Each one goes a long way, even if they're really annoying.",
          ),
          value: prefs.annoyingAdsEnabled,
          onChanged: (newAnnoyingAdsEnabled) =>
              prefs.annoyingAdsEnabled = newAnnoyingAdsEnabled ?? false,
          controlAffinity: ListTileControlAffinity.leading,
        ),
      ],
    );
  }
}
