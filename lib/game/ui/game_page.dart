import 'dart:async';

import 'package:fifteen/game/ui/game_preview_button.dart';
import 'package:fifteen/game/ui/solved_game_page.dart';
import 'package:fifteen/game/ui/game_page_popup_menu.dart';
import 'package:fifteen/game/ui/game_widget.dart';
import 'package:fifteen/level/ui/level_builder_page.dart';
import 'package:fifteen/main.dart';
import 'package:fifteen/math/level.dart';
import 'package:fifteen/shared/ui/banner_ad_widget.dart';
import 'package:fifteen/shared/ui/preferences_data.dart';
import 'package:fifteen/shared/ui/preferences_widget.dart';
import 'package:fifteen/shared/ui/interstitial_ad_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GamePage extends StatefulWidget {
  final String? boardAsset;
  final Level level;

  const GamePage({
    super.key,
    required this.level,
    this.boardAsset,
  });

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  bool previewing = false;
  bool dialogShown = false;

  Timer? timer;
  DateTime? initialTime, currentTime;

  @override
  void initState() {
    _loadTimer();
    super.initState();
  }

  void _loadTimer() {
    initialTime = DateTime.now();
    timer = Timer.periodic(const Duration(milliseconds: 100), (Timer t) {
      if (mounted) setState(() => currentTime = DateTime.now());
    });
  }

  Future<void> _saveLevelSolved(String? boardAsset) async {
    if (boardAsset == null) return;
    final prefs = await SharedPreferences.getInstance();
    PreferencesData preferences = PreferencesData(preferences: prefs);
    if (mounted) {
      setState(() {
        preferences.solvedBoards = [
          ...preferences.solvedBoards,
          boardAsset,
        ];
      });
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    timer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<FifteenAppState>(context);
    appState.addListener(
      () => _checkForDialog(appState),
    );
    return Scaffold(
      appBar: AppBar(
        title: BannerAdWidget(0),
        actions: [
          GamePagePopupMenu(
            shuffle: () {
              appState.shuffle();
              setState(() {});
            },
            solve: () {
              appState.solveGame();
              setState(() {});
            },
            boardBuild: () => goToBuilder(context),
          ),
        ],
      ),
      body: PreferencesWidget(
        builder: (context, preferences) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: BannerAdWidget(1, padded: true),
              ),
              Expanded(
                flex: 6,
                child: Center(
                  child: GameWidget(
                    previewing: previewing,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ...(preferences.timerEnabled
                        ? [
                            // Expanded(child: Container()),
                            Text(displayTime,
                                style: const TextStyle(fontSize: 14 * 3)),
                            // Expanded(child: Container()),
                          ]
                        : []),
                    GamePreviewButton(
                      level: widget.level,
                      setPreviewing: (newPreviewing) => setState(
                        () => previewing = newPreviewing,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: SafeArea(
                  top: false,
                  child: BannerAdWidget(2),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String get displayTime {
    DateTime? t0 = initialTime, t1 = currentTime;
    if (t0 == null || t1 == null) return "XX:XX";
    Duration delta = t1.difference(t0);
    int hours = delta.inHours,
        minutes = delta.inMinutes.remainder(60),
        seconds = delta.inSeconds.remainder(60);
    String hourStr = hours == 0 ? "" : "${hours.toString().padLeft(2, "0")}:",
        minuteStr = "${minutes.toString().padLeft(2, '0')}:",
        secondStr = seconds.toString().padLeft(2, '0');
    return "$hourStr$minuteStr$secondStr";
  }

  void _checkForDialog(FifteenAppState appState) async {
    if (appState.game.isSolved && !dialogShown) {
      NavigatorState navigator = Navigator.of(context);
      setState(() => dialogShown = true);
      Level level = widget.level;
      await _saveLevelSolved(widget.boardAsset);
      InterstitialAdWidget.load();
      timer?.cancel();
      timer = null;

      navigator.pushReplacement(
        PageRouteBuilder(
          transitionDuration: const Duration(seconds: 1),
          transitionsBuilder: (context, a1, a2, child) => FadeTransition(
            opacity: a1,
            child: child,
          ),
          pageBuilder: (context, a1, a2) => PreferencesWidget(
            builder: (context, preferences) => SolvedGamePage(
              level: level,
              time: displayTime,
              hasNext: false,
              timerEnabled: preferences.timerEnabled,
            ),
          ),
        ),
      );
    }
  }

  void goToBuilder(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LevelBuilderPage(
          initialLevel: widget.level,
        ),
      ),
    );
  }
}
