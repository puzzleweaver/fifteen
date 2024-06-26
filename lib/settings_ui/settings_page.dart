import 'package:fifteen/shared_ui/banner_ad_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  static const String _adventureEnabledLabel = 'adventure_enabled';
  static const bool _adventureEnabledDefault = true;

  static const String _timerEnabledLabel = 'timer_enabled';
  static const bool _timerEnabledDefault = true;

  static const String _annoyingAdsLabel = 'annoying_ads';
  static const bool _annoyingAdsDefault = false;

  static const String _adChanceLabel = 'ad_chance';
  static const double _adChanceDefault = 0.2;

  bool _adventureEnabled = _adventureEnabledDefault;
  bool _timerEnabled = _timerEnabledDefault;
  bool _annoyingAds = _annoyingAdsDefault;
  double _adChance = _adChanceDefault;

  bool _showSupportArea = false;

  @override
  void initState() {
    super.initState();
    _loadSharedPreferences();
  }

  Future<void> _loadSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _adventureEnabled =
          prefs.getBool(_adventureEnabledLabel) ?? _adventureEnabledDefault;
      _timerEnabled = prefs.getBool(_timerEnabledLabel) ?? _timerEnabledDefault;
      _annoyingAds = prefs.getBool(_annoyingAdsLabel) ?? _annoyingAdsDefault;
      _adChance = prefs.getDouble(_adChanceLabel) ?? _adChanceDefault;
    });
  }

  Future<void> _setAdventure(bool? newValue) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _adventureEnabled = newValue ?? _adventureEnabledDefault;
      prefs.setBool(_adventureEnabledLabel, _adventureEnabled);
    });
  }

  Future<void> _setTimer(bool? newValue) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _timerEnabled = newValue ?? _timerEnabledDefault;
      prefs.setBool(_timerEnabledLabel, _timerEnabled);
    });
  }

  Future<void> _setAnnoyingAds(bool? newValue) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _annoyingAds = newValue ?? _annoyingAdsDefault;
      prefs.setBool(_annoyingAdsLabel, _annoyingAds);
    });
  }

  Future<void> _setAdChance(double? newValue) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _adChance = newValue ?? _adChanceDefault;
      prefs.setDouble(_adChanceLabel, _adChance);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Load and obtain the shared preferences for this app.
    // final prefs = await SharedPreferences.getInstance();

    // // Save the counter value to persistent storage under the 'counter' key.
    // await prefs.setInt('counter', counter);
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              BannerAdWidget(),
              Row(
                children: [
                  Checkbox(value: _adventureEnabled, onChanged: _setAdventure),
                  Text("Adventure Enabled"),
                ],
              ),
              Row(
                children: [
                  Checkbox(value: _timerEnabled, onChanged: _setTimer),
                  Text("Timer Enabled"),
                ],
              ),
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
              if (_showSupportArea) _supportDialog(),
              BannerAdWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _supportDialog() {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Gimme Money", style: TextStyle(fontSize: 28)),
          Row(
            children: [
              Checkbox(value: _annoyingAds, onChanged: _setAnnoyingAds),
              Text("Interstitial Ads"),
            ],
          ),
          Row(
            children: [
              Text("Ad Chance"),
              Slider(value: _adChance, onChanged: _setAdChance),
            ],
          ),
          ElevatedButton(
            onPressed: () => print("THANKS"),
            child: Text("Donate :)"),
          ),
          BannerAdWidget(),
        ],
      ),
    );
  }
}
