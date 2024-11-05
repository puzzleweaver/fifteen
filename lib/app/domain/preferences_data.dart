import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class PreferencesData {
  final SharedPreferences preferences;
  PreferencesData({required this.preferences});

  static const String adChanceLabel = "ad_chance";
  double get adChance => preferences.getDouble(adChanceLabel) ?? 0.5;
  set adChance(double newAdChance) => preferences.setDouble(
        adChanceLabel,
        newAdChance,
      );

  static const String timerEnabledLabel = 'timer_enabled';
  bool get timerEnabled => preferences.getBool(timerEnabledLabel) ?? false;
  set timerEnabled(bool newTimerEnabled) => preferences.setBool(
        timerEnabledLabel,
        newTimerEnabled,
      );

  static const String moveCountEnabledLabel = 'move_count_enabled';
  bool get moveCountEnabled =>
      preferences.getBool(moveCountEnabledLabel) ?? false;
  set moveCountEnabled(bool newMoveCountEnabled) => preferences.setBool(
        moveCountEnabledLabel,
        newMoveCountEnabled,
      );

  static const String annoyingAdsEnabledLabel = 'annoying_ads';
  bool get annoyingAdsEnabled =>
      preferences.getBool(annoyingAdsEnabledLabel) ?? false;
  set annoyingAdsEnabled(bool newAnnoyingAdsEnabled) => preferences.setBool(
        annoyingAdsEnabledLabel,
        newAnnoyingAdsEnabled,
      );

  static const String solvedBoardsLabel = 'adventure_progress';
  List<String> get solvedBoards => List<String>.from(jsonDecode(
        preferences.getString(solvedBoardsLabel) ?? "[]",
      ));
  set solvedBoards(List<String> newSolvedBoards) {
    String solvedBoards = jsonEncode(newSolvedBoards.toList());
    preferences.setString(solvedBoardsLabel, solvedBoards);
  }
}
