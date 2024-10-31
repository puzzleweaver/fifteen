import 'dart:async';

import 'package:fifteen/game/ui/endgame_dialog.dart';
import 'package:fifteen/game/ui/game_widget.dart';
import 'package:fifteen/level/ui/level_builder_page.dart';
import 'package:fifteen/main.dart';
import 'package:fifteen/board/domain/board.dart';
import 'package:fifteen/math/level.dart';
import 'package:fifteen/settings/ui/settings_page.dart';
import 'package:fifteen/shared/ui/banner_ad_widget.dart';
import 'package:fifteen/shared/ui/preview_widget.dart';
import 'package:fifteen/shared/ui/interstitial.dart';
import 'package:fifteen/shared/ui/prefs.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GamePage extends StatefulWidget {
  const GamePage({
    super.key,
    required this.level,
    required this.appState,
  });

  final Level level;
  final FifteenAppState appState;

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  bool previewing = false;

  Set<String> _solvedBoards = {};
  bool _timerEnabled = Prefs.timerEnabledDefault;

  Timer? timer;
  DateTime? initialTime, currentTime;

  @override
  void initState() {
    _loadSharedPreferences();
    _checkForDialog();
    _loadTimer();
    super.initState();
  }

  Future<void> _loadSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _solvedBoards = Prefs.getSolvedBoards(prefs);
      _timerEnabled =
          prefs.getBool(Prefs.timerEnabledLabel) ?? Prefs.timerEnabledDefault;
    });
  }

  void _loadTimer() {
    initialTime = DateTime.now();
    timer = Timer.periodic(const Duration(milliseconds: 100), (Timer t) {
      setState(() => currentTime = DateTime.now());
    });
  }

  Future<void> _saveLevelSolved(Board? solvedBoard) async {
    if (solvedBoard == null) return;
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _solvedBoards = Prefs.setSolvedBoards(prefs, {
        ..._solvedBoards,
        solvedBoard.id,
      });
    });
  }

  @override
  void dispose() {
    widget.appState.removeListener(_checkForDialog);
    timer?.cancel();
    timer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BannerAdWidget(0),
        actions: [
          PopupMenuButton<String>(
            onSelected: handleMore,
            itemBuilder: (BuildContext context) {
              return {
                'Shuffle',
                if (kDebugMode) 'Solve',
                if (kDebugMode) 'Build',
                'Settings',
              }
                  .map(
                    (String choice) => PopupMenuItem<String>(
                      value: choice,
                      child: Text(choice),
                    ),
                  )
                  .toList();
            },
          ),
        ],
      ),
      body: Center(
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
                  ...(_timerEnabled
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

  void _checkForDialog() {
    widget.appState.addListener(() {
      if (widget.appState.game.isSolved) {
        Level level = widget.level;
        _saveLevelSolved(widget.level.board);
        Interstitial.load();
        timer?.cancel();
        timer = null;
        showGeneralDialog(
          barrierColor: Colors.black.withOpacity(0.5),
          transitionBuilder: (context, a1, a2, widget) {
            final curvedValue = Curves.easeOut.transform(a1.value) - 1.0;
            return Transform(
              transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
              child: Opacity(
                opacity: a1.value,
                child: EndgameDialog(
                  level: level,
                  time: displayTime,
                  hasNext: level.hasNext(),
                  timerEnabled: _timerEnabled,
                ),
              ),
            );
          },
          transitionDuration: const Duration(milliseconds: 1000),
          barrierDismissible: false,
          barrierLabel: '',
          context: context,
          pageBuilder: (context, animation, secondaryAnimation) => Container(),
        );
      }
    });
  }

  void handleMore(String label) {
    switch (label) {
      case 'Shuffle':
        widget.appState.shuffle();
        setState(() {});
      case 'Settings':
        goToSettings();
      case 'Solve':
        widget.appState.solveGame();
        setState(() {});
      case 'Build':
        goToBuilder();
    }
  }

  void goToSettings() {
    widget.appState.rerollAds();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SettingsPage()),
    );
  }

  void goToBuilder() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LevelBuilderPage(
          initialLevel: widget.appState.level,
        ),
      ),
    );
  }
}
