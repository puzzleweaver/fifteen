import 'dart:async';

import 'package:fifteen/game/ui/endgame_dialog.dart';
import 'package:fifteen/game/ui/game_page_popup_menu.dart';
import 'package:fifteen/game/ui/game_widget.dart';
import 'package:fifteen/main.dart';
import 'package:fifteen/math/level.dart';
import 'package:fifteen/shared/ui/banner_ad_widget.dart';
import 'package:fifteen/shared/ui/preferences_data.dart';
import 'package:fifteen/shared/ui/preferences_widget.dart';
import 'package:fifteen/shared/ui/preview_widget.dart';
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
      setState(() => currentTime = DateTime.now());
    });
  }

  Future<void> _saveLevelSolved(String? boardAsset) async {
    if (boardAsset == null) return;
    final prefs = await SharedPreferences.getInstance();
    PreferencesData preferences = PreferencesData(preferences: prefs);
    setState(() {
      preferences.solvedBoards = [
        ...preferences.solvedBoards,
        boardAsset,
      ];
    });
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
                            Expanded(child: Container()),
                            Text(displayTime,
                                style: const TextStyle(fontSize: 14 * 3)),
                            Expanded(child: Container()),
                          ]
                        : []),
                    GestureDetector(
                      onTapDown: (details) => setState(() => previewing = true),
                      onTapUp: (details) => setState(() => previewing = false),
                      onTapCancel: () => setState(() => previewing = false),
                      child: PreviewWidget(
                        level: widget.level,
                        locked: false,
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

  void _checkForDialog(FifteenAppState appState) {
    if (appState.game.isSolved && !dialogShown) {
      setState(() => dialogShown = true);
      Level level = widget.level;
      _saveLevelSolved(widget.boardAsset);
      InterstitialAdWidget.load();
      timer?.cancel();
      timer = null;
      showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.5),
        transitionDuration: const Duration(milliseconds: 1000),
        barrierDismissible: false,
        barrierLabel: '',
        context: context,
        pageBuilder: (context, animation, secondaryAnimation) => Container(),
        transitionBuilder: (context, a1, a2, widget) {
          final curvedValue = Curves.easeOut.transform(a1.value) - 1.0;
          return Transform(
            transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
            child: Opacity(
              opacity: a1.value,
              child: PreferencesWidget(
                builder: (context, preferences) => EndgameDialog(
                  level: level,
                  time: displayTime,
                  hasNext: false,
                  timerEnabled: preferences.timerEnabled,
                ),
              ),
            ),
          );
        },
      );
    }
  }
}
