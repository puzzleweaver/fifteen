import 'dart:math';

import 'package:fifteen/debug_ui/debug_page.dart';
import 'package:fifteen/main.dart';
import 'package:fifteen/game_ui/game_page.dart';
import 'package:fifteen/math/level.dart';
import 'package:fifteen/settings_ui/settings_page.dart';
import 'package:fifteen/shared_ui/banner_ad_widget.dart';
import 'package:fifteen/shared_ui/preview_widget.dart';
import 'package:fifteen/shared_ui/prefs.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _controller = ScrollController();
  double _alpha = 0.0;
  Set<int> _adventureData = {};

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
      _adventureData = Prefs.getAdventureData(prefs);
    });
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<FifteenAppState>();
    var theme = Theme.of(context);

    _loadSharedPreferences();

    var gameButtons =
        Level.adventure.map((lvl) => getButton(lvl, theme, appState));

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          actions: [
            if (kDebugMode)
              IconButton(
                icon: Icon(Icons.build),
                color: Color(0x11000000),
                onPressed: goToDebug,
              ),
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () => goToSettings(appState),
            ),
          ],
          leading: AnimatedOpacity(
            opacity: _alpha,
            duration: Durations.short1,
            child: IconButton(
              icon: Icon(Icons.expand_less),
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
                  padding: EdgeInsets.all(50.0).copyWith(top: 75.0),
                  child: SizedBox.square(
                    child: Image.asset(
                      "assets/images/header.png",
                      fit: BoxFit.fill,
                      opacity: AlwaysStoppedAnimation(1.0 - _alpha),
                    ),
                  ),
                ),
                Wrap(
                  runSpacing: 5.0,
                  spacing: 5.0,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    ...gameButtons,
                  ],
                ),
                SafeArea(child: BannerAdWidget(3, padded: true)),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget getButton(Level level, ThemeData theme, FifteenAppState appState) {
    bool levelCompleted =
        level.index != null && _adventureData.contains(level.index ?? -1);
    bool levelLocked = isLevelLocked(level.index);
    return ElevatedButton(
      onPressed: levelLocked ? null : () => goToGame(level, appState),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(8.0),
        backgroundColor: levelCompleted
            ? theme.colorScheme.secondary
            : theme.colorScheme.primary,
      ),
      // child: Text(label),
      child: PreviewWidget(
        level: level,
        dimension: getDim(context),
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
      MaterialPageRoute(builder: (context) => SettingsPage()),
    );
  }

  void goToGame(Level level, FifteenAppState appState) {
    appState.rerollAds();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          appState.setBoard(level.board);
          return GamePage(
            level: level,
            appState: appState,
          );
        },
      ),
    );
  }

  bool isLevelLocked(int? index) {
    if (index == null) return false;
    if (_adventureData.contains(index)) {
      return false; // never lock solved levels
    }
    if (index == 0 || index == 1 || index == 2) {
      return false; // initial levels
    }
    return !_adventureData.contains(index - 3) &&
        !_adventureData.contains(index - 2) &&
        !_adventureData.contains(index - 1);
  }

  void resetScroll() {}

  void goToDebug() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DebugPage()),
    );
  }
}
