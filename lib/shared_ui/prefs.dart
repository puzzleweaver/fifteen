import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static const String adChanceLabel = "ad_chance";
  static const double adChanceDefault = 0.5;

  static const String adventureEnabledLabel = 'adventure_enabled';
  static const bool adventureEnabledDefault = true;

  static const String timerEnabledLabel = 'timer_enabled';
  static const bool timerEnabledDefault = true;

  static const String annoyingAdsLabel = 'annoying_ads';
  static const bool annoyingAdsDefault = false;

  static const String adventureDataLabel = 'adventure_progress';
  static const String adventureDataDefault = "[]";
  static Set<int> getAdventureData(SharedPreferences prefs) {
    String adventureData =
        prefs.getString(adventureDataLabel) ?? adventureDataDefault;
    List<int> adventureDataList = List<int>.from(jsonDecode(adventureData));
    return adventureDataList.toSet();
  }

  static Set<int> setAdventureData(
    SharedPreferences prefs,
    Set<int> newProgress,
  ) {
    String newAdventureData = jsonEncode(newProgress.toList());
    prefs.setString(adventureDataLabel, newAdventureData);
    return newProgress;
  }
}
