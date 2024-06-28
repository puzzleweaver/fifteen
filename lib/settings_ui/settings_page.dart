import 'package:fifteen/main.dart';
import 'package:fifteen/shared_ui/banner_ad_widget.dart';
import 'package:fifteen/shared_ui/prefs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _adventureEnabled = Prefs.adventureEnabledDefault;
  bool _timerEnabled = Prefs.timerEnabledDefault;
  bool _annoyingAds = Prefs.annoyingAdsDefault;
  double _adChance = Prefs.adChanceDefault;

  bool _showSupportArea = false;

  @override
  void initState() {
    super.initState();
    _loadSharedPreferences();
  }

  Future<void> _loadSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _adventureEnabled = prefs.getBool(Prefs.adventureEnabledLabel) ??
          Prefs.adventureEnabledDefault;
      _timerEnabled =
          prefs.getBool(Prefs.timerEnabledLabel) ?? Prefs.timerEnabledDefault;
      _annoyingAds =
          prefs.getBool(Prefs.annoyingAdsLabel) ?? Prefs.annoyingAdsDefault;
      _adChance = prefs.getDouble(Prefs.adChanceLabel) ?? Prefs.adChanceDefault;
    });
  }

  Future<void> _setAdventureEnabled(bool? newValue) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _adventureEnabled = newValue ?? Prefs.adventureEnabledDefault;
      prefs.setBool(Prefs.adventureEnabledLabel, _adventureEnabled);
    });
  }

  Future<void> _setTimer(bool? newValue) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _timerEnabled = newValue ?? Prefs.timerEnabledDefault;
      prefs.setBool(Prefs.timerEnabledLabel, _timerEnabled);
    });
  }

  Future<void> _setAnnoyingAds(bool? newValue) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _annoyingAds = newValue ?? Prefs.annoyingAdsDefault;
      prefs.setBool(Prefs.annoyingAdsLabel, _annoyingAds);
    });
  }

  Future<void> _setAdChance(double? newValue) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _adChance = newValue ?? Prefs.adChanceDefault;
      prefs.setDouble(Prefs.adChanceLabel, _adChance);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Load and obtain the shared preferences for this app.
    // final prefs = await SharedPreferences.getInstance();

    FifteenAppState appState = context.watch<FifteenAppState>();

    // // Save the counter value to persistent storage under the 'counter' key.
    // await prefs.setInt('counter', counter);
    return Scaffold(
      appBar: AppBar(
        title: BannerAdWidget(4),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              BannerAdWidget(5, padded: true),
              Row(
                children: [
                  Checkbox(
                      value: _adventureEnabled,
                      onChanged: _setAdventureEnabled),
                  Text("Adventure Enabled"),
                ],
              ),
              Row(
                children: [
                  Checkbox(value: _timerEnabled, onChanged: _setTimer),
                  Text("Timer Enabled"),
                ],
              ),
              SizedBox.square(dimension: 16.0),
              if (_showSupportArea)
                _supportDialog(appState)
              else
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      icon: Icon(Icons.attach_money),
                      onPressed: () => setState(() {
                        _showSupportArea = !_showSupportArea;
                      }),
                      label: Text("Support the Dev"),
                    )
                  ],
                ),
              SizedBox.square(dimension: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    icon: Icon(Icons.cancel),
                    label: Text("Reset Adventure Progress"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.error,
                    ),
                    onPressed: () => showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("Are You Sure?"),
                        content: Text("This might take a while to undo."),
                        actions: [
                          ElevatedButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text("NEVER"),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.pop(context);
                              deleteAdventure();
                            },
                            child: Text("OK"),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SafeArea(top: false, child: BannerAdWidget(6, padded: true)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _supportDialog(FifteenAppState appState) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Support the Dev :-)", style: TextStyle(fontSize: 28)),
          Row(
            children: [
              Checkbox(value: _annoyingAds, onChanged: _setAnnoyingAds),
              Text("Interstitial Ads"),
            ],
          ),
          Text(
            "Showing an interstitial ad pays about 40x more than showing a banner. Each one you see goes a long way <3",
          ),
          Divider(color: Colors.black),
          Row(
            children: [
              Text("Ad Chance:"),
              Slider(
                value: _adChance,
                onChanged: _setAdChance,
                min: 1.0 / 3.0,
                max: 1.0,
              ),
            ],
          ),
          Text(
            "Banner Ads are shown with a certain probability. More ads means more money for the developer, of course.",
          ),
          Divider(color: Colors.black),
          ElevatedButton(
            onPressed: () => print("THANKS"),
            child: Text("Donate :)"),
          ),
          BannerAdWidget(7, padded: true),
        ],
      ),
    );
  }

  void deleteAdventure() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Prefs.setAdventureData(prefs, {});
  }
}
