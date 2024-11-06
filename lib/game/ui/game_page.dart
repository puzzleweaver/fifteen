import 'dart:async';

import 'package:fifteen/board/domain/board.dart';
import 'package:fifteen/completion/data/completions.dart';
import 'package:fifteen/completion/data/preferences_completions.dart';
import 'package:fifteen/completion/domain/completion.dart';
import 'package:fifteen/game/domain/game.dart';
import 'package:fifteen/game/ui/game_preview_button.dart';
import 'package:fifteen/game/ui/game_status_pane.dart';
import 'package:fifteen/game/ui/solved_game_page.dart';
import 'package:fifteen/game/ui/game_page_popup_menu.dart';
import 'package:fifteen/game/ui/game_widget.dart';
import 'package:fifteen/board/ui/builder/board_builder_page.dart';
import 'package:fifteen/app/ui/ads/banner_ad_widget.dart';
import 'package:fifteen/app/domain/preferences_data.dart';
import 'package:fifteen/app/ui/preferences_widget.dart';
import 'package:fifteen/app/ui/ads/interstitial_ad_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GamePage extends StatefulWidget {
  final Board board;
  final String imageAsset;

  const GamePage({
    super.key,
    required this.imageAsset,
    required this.board,
  });

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  bool previewing = false;

  Timer? timer;
  DateTime initialTime = DateTime.now(), currentTime = DateTime.now();

  int moveCount = 0;

  Game game = Game.createNew();

  @override
  void initState() {
    game = Game.fromBoard(widget.board).shuffle(widget.board);
    _loadTimer();
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    timer = null;
    super.dispose();
  }

  void _loadTimer() {
    timer = Timer.periodic(
      const Duration(milliseconds: 100),
      (Timer t) {
        setState(() => currentTime = DateTime.now());
      },
    );
  }

  Duration get time => currentTime.difference(initialTime);

  Future<void> saveLevelSolved() async {
    final prefs = await SharedPreferences.getInstance();
    PreferencesData preferences = PreferencesData(preferences: prefs);
    if (mounted) {
      Completions completions = PreferencesCompletions(
        preferences: preferences,
      );
      completions.save(
        Completion.createNew(
          boardId: widget.board.id,
          time: time,
          moveCount: moveCount,
        ),
      );
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BannerAdWidget(),
        actions: [
          GamePagePopupMenu(
            shuffle: shuffle,
            solve: solve,
            boardBuild: () => goToBuilder(context),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: BannerAdWidget(padded: true),
            ),
            Expanded(
              flex: 6,
              child: Center(
                child: GameWidget(
                  game: game,
                  board: widget.board,
                  imageAsset: widget.imageAsset,
                  previewing: previewing,
                  tapSquare: tapSquare,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: GameStatusWidget(
                moveCount: moveCount,
                time: time,
                children: [
                  GamePreviewButton(
                    board: widget.board,
                    imageAsset: widget.imageAsset,
                    setPreviewing: setPreviewing,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: SafeArea(
                top: false,
                child: BannerAdWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void setPreviewing(bool newPreviewing) {
    setState(() => previewing = newPreviewing);
  }

  void checkIfSolved() async {
    if (game.isSolved) {
      NavigatorState navigator = Navigator.of(context);
      await saveLevelSolved();
      InterstitialAdWidget.load();

      navigator.pushReplacement(
        PageRouteBuilder(
          transitionDuration: const Duration(seconds: 1),
          transitionsBuilder: (context, a1, a2, child) => FadeTransition(
            opacity: a1,
            child: child,
          ),
          pageBuilder: (context, a1, a2) => PreferencesWidget(
            builder: (context, preferences) => SolvedGamePage(
              board: widget.board,
              imageAsset: widget.imageAsset,
              time: time,
              hasNext: false,
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
        builder: (context) => BoardBuilderPage(
          initialBoard: widget.board,
        ),
      ),
    );
  }

  void shuffle() {
    setState(
      () => game = game.shuffle(widget.board),
    );
  }

  void solve() {
    setState(
      () => game = game.solve(),
    );
  }

  void tapSquare(int index) {
    Game? newGame = game.tapAtIndex(
      widget.board,
      index,
    );
    if (newGame != null) {
      setState(() {
        game = newGame;
        moveCount++;
      });
      checkIfSolved();
    }
  }
}
