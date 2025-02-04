import 'package:fifteen/app/domain/preferences_data.dart';
import 'package:flutter/material.dart';

class Preferences extends ChangeNotifier {
  final PreferencesData data;

  Preferences(this.data);

  double get adChance => data.adChance;
  set adChance(double newValue) {
    data.adChance = newValue;
    notifyListeners();
  }

  bool get annoyingAdsEnabled => data.annoyingAdsEnabled;
  set annoyingAdsEnabled(bool newValue) {
    data.annoyingAdsEnabled = newValue;
    notifyListeners();
  }

  int get animationSpeed => data.animationSpeed;
  set animationSpeed(int newValue) {
    data.animationSpeed = newValue;
    notifyListeners();
  }

  bool get timerEnabled => data.timerEnabled;
  set timerEnabled(bool newValue) {
    data.timerEnabled = newValue;
    notifyListeners();
  }

  bool get moveCountEnabled => data.moveCountEnabled;
  set moveCountEnabled(bool newValue) {
    data.moveCountEnabled = newValue;
    notifyListeners();
  }

  List<String> get solvedBoards => data.solvedBoards;
  set solvedBoards(List<String> newValue) {
    data.solvedBoards = newValue;
    notifyListeners();
  }
}
