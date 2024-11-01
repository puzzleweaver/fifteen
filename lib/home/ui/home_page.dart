import 'dart:math';

import 'package:fifteen/debug/ui/debug_page.dart';
import 'package:fifteen/main.dart';
import 'package:fifteen/game/ui/game_page.dart';
import 'package:fifteen/math/level.dart';
import 'package:fifteen/settings/ui/settings_page.dart';
import 'package:fifteen/shared/data/assets.dart';
import 'package:fifteen/shared/ui/banner_ad_widget.dart';
import 'package:fifteen/shared/ui/prefs.dart';
import 'package:fifteen/shared/ui/preview_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _controller = ScrollController();
  double _alpha = 0.0;
  Set<String> _solvedBoards = {};

  @override
  void initState() {
    super.initState();
    // context.watch<FifteenAppState>();
    _controller.addListener(() {
      setState(() {
        _alpha = _controller.position.pixels / 300;
        _alpha = _alpha.clamp(0, 1);
      });
    });
    _loadSharedPreferences();
  }

  Future<void> _loadSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _solvedBoards = Prefs.getSolvedBoards(prefs);
    });
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<FifteenAppState>();
    var theme = Theme.of(context);

    _loadSharedPreferences();

    var size = MediaQuery.of(context).size;

    var gameButtons =
        Assets.boards.map((lvl) => getButton(lvl, theme, appState));

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          actions: [
            if (kDebugMode)
              IconButton(
                icon: const Icon(Icons.build),
                color: const Color(0x11000000),
                onPressed: goToDebug,
              ),
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => goToSettings(appState),
            ),
          ],
          leading: AnimatedOpacity(
            opacity: _alpha,
            duration: Durations.short1,
            child: IconButton(
              icon: const Icon(Icons.expand_less),
              onPressed: () => _controller.animateTo(
                0.0,
                duration: Durations.long1,
                curve: Curves.easeInOut,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          controller: _controller,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: size.width / 8,
                    right: size.width / 8,
                    top: size.height / 16,
                    bottom: size.height / 16,
                  ),
                  child: SizedBox.square(
                    child: Image.asset(
                      "assets/images/header.png",
                      fit: BoxFit.fill,
                      opacity: AlwaysStoppedAnimation(1.0 - _alpha),
                    ),
                  ),
                ),
                GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  padding: const EdgeInsets.all(5.0),
                  mainAxisSpacing: 5.0,
                  crossAxisSpacing: 5.0,
                  children: [
                    ...gameButtons,
                  ],
                ),
                SafeArea(
                  child: BannerAdWidget(3, padded: true),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget getButton(String asset, ThemeData theme, FifteenAppState appState) {
    Level level = Level.createNew();
    bool levelCompleted =
        level.index != null && _solvedBoards.contains(level.board.id);
    bool levelLocked = _isLevelLocked(level.index);
    return ElevatedButton(
      onPressed: levelLocked ? null : () => goToGame(level, appState),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(8.0),
        backgroundColor: levelCompleted
            ? theme.colorScheme.secondary
            : theme.colorScheme.primary,
      ),
      child: PreviewWidget(
        level: level,
        locked: levelLocked,
      ),
    );
  }

  double getDim(BuildContext context) {
    final box = MediaQuery.of(context);
    return min(box.size.width, box.size.height) / 4;
  }

  void goToSettings(FifteenAppState appState) {
    appState.rerollAds();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SettingsPage()),
    );
  }

  void goToGame(Level level, FifteenAppState appState) {
    appState.rerollAds();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          appState.setLevel(level);
          return GamePage(
            level: level,
            appState: appState,
          );
        },
      ),
    );
  }

  bool _isLevelSolved(int? index) {
    if (index == null) return false;
    return _solvedBoards.contains(Level.createNew().board.id);
  }

  bool _isLevelLocked(int? index) {
    if (index == null ||
        _isLevelSolved(index) ||
        index == 0 ||
        index == 1 ||
        index == 2) {
      return false; // initial levels
    }
    return !_isLevelSolved(index - 3) &&
        !_isLevelSolved(index - 2) &&
        !_isLevelSolved(index - 1);
  }

  void resetScroll() {}

  void goToDebug() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const DebugPage()),
    );
  }
}
