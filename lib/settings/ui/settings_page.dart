import 'package:fifteen/settings/ui/ad_chance_slider.dart';
import 'package:fifteen/settings/ui/clear_data_tile.dart';
import 'package:fifteen/settings/ui/annoying_ads_enabled_checkbox.dart';
import 'package:fifteen/settings/ui/feedback_tile.dart';
import 'package:fifteen/settings/ui/move_count_enabled_checkbox.dart';
import 'package:fifteen/settings/ui/timer_enabled_checkbox.dart';
import 'package:fifteen/app/ui/preferences_widget.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: SingleChildScrollView(
        child: PreferencesWidget(
          builder: (context, preferences) => Center(
            child: Column(
              children: [
                const TimerEnabledCheckbox(),
                const MoveCountEnabledCheckbox(),
                const ExpansionTile(
                  leading: Icon(Icons.attach_money),
                  title: Text("Support the Dev"),
                  children: [
                    AnnoyingAdsEnabledCheckbox(),
                    AdChanceSlider(),
                  ],
                ),
                const FeedbackTile(),
                const ClearDataTile(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget card(Widget child) {
    // return Padding(
    //   padding: const EdgeInsets.all(5),
    //   child: Card(
    //     child: child,
    //   ),
    // );
    return child;
  }
}
