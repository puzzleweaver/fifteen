import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static const String adChanceLabel = "ad_chance";
  static const double adChanceDefault = 0.5;

  static const String timerEnabledLabel = 'timer_enabled';
  static const bool timerEnabledDefault = true;

  static const String annoyingAdsLabel = 'annoying_ads';
  static const bool annoyingAdsDefault = false;

  static const String solvedBoardsLabel = 'adventure_progress';
  static const String solvedBoardsDefault = "[]";
  static Set<String> getSolvedBoards(SharedPreferences prefs) {
    String solvedBoards =
        prefs.getString(solvedBoardsLabel) ?? solvedBoardsDefault;
    return List<String>.from(jsonDecode(solvedBoards)).toSet();
  }

  static Set<String> setSolvedBoards(
    SharedPreferences prefs,
    Set<String> newSolvedBoards,
  ) {
    String solvedBoards = jsonEncode(newSolvedBoards.toList());
    prefs.setString(solvedBoardsLabel, solvedBoards);
    return newSolvedBoards;
  }
}
