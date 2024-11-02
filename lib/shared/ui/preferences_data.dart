import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class PreferencesData {
  static const String adChanceLabel = "ad_chance";
  static const String timerEnabledLabel = 'timer_enabled';
  static const String annoyingAdsEnabledLabel = 'annoying_ads';
  static const String solvedBoardsLabel = 'adventure_progress';

  final SharedPreferences preferences;

  PreferencesData({required this.preferences});

  double get adChance => preferences.getDouble(adChanceLabel) ?? 0.5;
  bool get timerEnabled => preferences.getBool(timerEnabledLabel) ?? true;
  bool get annoyingAdsEnabled =>
      preferences.getBool(annoyingAdsEnabledLabel) ?? false;
  List<String> get solvedBoards {
    String solvedBoards = preferences.getString(solvedBoardsLabel) ?? "[]";
    return List<String>.from(jsonDecode(solvedBoards));
  }

  set adChance(double newAdChance) => preferences.setDouble(
        adChanceLabel,
        newAdChance,
      );

  set timerEnabled(bool newTimerEnabled) => preferences.setBool(
        timerEnabledLabel,
        newTimerEnabled,
      );

  set annoyingAdsEnabled(bool newAnnoyingAdsEnabled) => preferences.setBool(
        annoyingAdsEnabledLabel,
        newAnnoyingAdsEnabled,
      );

  set solvedBoards(
    List<String> newSolvedBoards,
  ) {
    String solvedBoards = jsonEncode(newSolvedBoards.toList());
    preferences.setString(solvedBoardsLabel, solvedBoards);
  }
}
