import 'dart:developer';

import 'package:fifteen/main.dart';
import 'package:fifteen/shared/ui/banner_ad_widget.dart';
import 'package:fifteen/shared/ui/preferences_data.dart';
import 'package:fifteen/shared/ui/preferences_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _showSupportArea = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Load and obtain the shared preferences for this app.
    // final prefs = await SharedPreferences.getInstance();

    FifteenAppState appState = Provider.of<FifteenAppState>(context);

    return Scaffold(
      appBar: AppBar(
        title: BannerAdWidget(4),
      ),
      body: SingleChildScrollView(
        child: PreferencesWidget(
          builder: (context, preferences) => Center(
            child: Column(
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: preferences.timerEnabled,
                      onChanged: (newTimerEnabled) {
                        preferences.timerEnabled = newTimerEnabled ?? false;
                        setState(() {});
                      },
                    ),
                    const Text("Timer Enabled"),
                  ],
                ),
                const SizedBox.square(dimension: 16.0),
                if (_showSupportArea)
                  _supportDialog(appState)
                else
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        icon: const Icon(Icons.attach_money),
                        onPressed: () => setState(() {
                          _showSupportArea = !_showSupportArea;
                        }),
                        label: const Text("Support the Dev"),
                      )
                    ],
                  ),
                const SizedBox.square(dimension: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      icon: const Icon(Icons.mail),
                      label: const Text("Send Feedback"),
                      onPressed: sendFeedback,
                    )
                  ],
                ),
                const SizedBox.square(dimension: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      icon: const Icon(Icons.cancel),
                      label: const Text("Reset Adventure Progress"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.error,
                      ),
                      onPressed: areYouSureResetAdventure,
                    )
                  ],
                ),
                SafeArea(top: false, child: BannerAdWidget(6, padded: true)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _supportDialog(FifteenAppState appState) {
    return PreferencesWidget(
      builder: (context, preferences) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Support the Dev :-)", style: TextStyle(fontSize: 28)),
            CheckboxListTile(
              title: Text(
                  "Interstitial Ads${preferences.annoyingAdsEnabled ? ' <3' : ''}"),
              value: preferences.annoyingAdsEnabled,
              onChanged: (newAnnoyingAdsEnabled) {
                preferences.annoyingAdsEnabled = newAnnoyingAdsEnabled ?? false;
                setState(() {});
              },
              controlAffinity: ListTileControlAffinity.leading,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 5.0, right: 5.0),
              child: Text(
                "Showing an interstitial ad pays about 40x more than showing a banner. Each one you see goes a long way",
              ),
            ),
            const Divider(color: Colors.black),
            const Text("Ad Chance:"),
            Slider(
              value: preferences.adChance,
              onChanged: (newAdChance) {
                preferences.adChance = newAdChance;
                setState(() {});
              },
              min: 1.0 / 3.0,
              max: 1.0,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 5.0, right: 5.0),
              child: Text(
                "Banner Ads are shown with a certain probability. More ads means more money for the developer :)",
              ),
            ),
            const SizedBox.square(dimension: 16.0),
            BannerAdWidget(7, padded: true),
          ],
        ),
      ),
    );
  }

  void deleteAdventure() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    PreferencesData(preferences: prefs).solvedBoards = [];
  }

  void areYouSureDisableAdventure() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Are You Sure?"),
        content:
            const Text("This will probably be less exciting than following"),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("NEVER"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
              deleteAdventure();
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  void areYouSureResetAdventure() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Are You Sure?"),
        content: const Text("This might take a while to undo."),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("NEVER"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
              deleteAdventure();
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  void sendFeedback() async {
    log("sending feedback...");
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'aweaver2718@gmail.com',
      queryParameters: {'subject': 'Fifteent Feedback', 'body': "I hate you."},
    );
    if (!await launchUrl(emailUri)) {
      throw Exception('Could not launch $emailUri');
    }
  }
}
