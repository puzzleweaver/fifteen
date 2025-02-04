import 'dart:async';

import 'package:fifteen/app/domain/preferences.dart';
import 'package:fifteen/app/ui/orienter.dart';
import 'package:fifteen/board/domain/board.dart';
import 'package:fifteen/board/domain/quad.dart';
import 'package:fifteen/completion/data/preferences_completions.dart';
import 'package:fifteen/completion/domain/completion.dart';
import 'package:fifteen/game/ui/game_move_count_widget.dart';
import 'package:fifteen/game/ui/game_page/gameplay_animation.dart';
import 'package:fifteen/game/ui/game_page/slide_state.dart';
import 'package:fifteen/game/ui/game_preview_button.dart';
import 'package:fifteen/game/ui/game_time_widget.dart';
import 'package:fifteen/game/ui/game_page/gameplay_state.dart';
import 'package:fifteen/game/ui/solved_game_page.dart';
import 'package:fifteen/game/ui/game_page_popup_menu.dart';
import 'package:fifteen/game/ui/game_widget/game_widget.dart';
import 'package:fifteen/board/ui/builder/board_builder_page.dart';
import 'package:fifteen/app/ui/ads/banner_ad_widget.dart';
import 'package:fifteen/app/ui/ads/interstitial_ad_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

class _GamePageState extends State<GamePage>
    with SingleTickerProviderStateMixin {
  // state for gamepage (ui/app ONLY)
  bool previewing = false;
  Timer? timer;
  DateTime initialTime = DateTime.now(), currentTime = DateTime.now();
  AnimationController? controller;

  // gameplay state (which handles itself)
  GameplayState gameplayState = GameplayState.empty;

  // derived stuff / getters
  get board => widget.board;
  get imageAsset => widget.imageAsset;
  Duration get time => currentTime.difference(initialTime);

  @override
  void initState() {
    gameplayState = GameplayState.fromBoard(board).shuffled;
    controller = AnimationController(duration: Duration.zero, vsync: this);
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

  @override
  Widget build(BuildContext context) {
    Preferences prefs = Provider.of(context);
    List<Board> boards = Provider.of(context);

    AnimationController? controller = this.controller;
    if (controller == null) return Center(child: CircularProgressIndicator());
    controller.duration = Duration(milliseconds: prefs.animationSpeed);

    return Scaffold(
      appBar: AppBar(
        title: Text("Level ${boards.indexOf(board) + 1}"),
        actions: [
          GamePagePopupMenu(
            shuffle: shuffle,
            solve: solve,
            boardBuild: () => goToBuilder(context),
          ),
        ],
      ),
      body: pageLayout(
        context,
        gameWidget: GameplayAnimation(
          controller: controller,
          builder: (context, value) => GameWidget(
            gameplayState: gameplayState,
            imageAsset: imageAsset,
            previewing: previewing,
            tapSquare: tapSquare,
            slideState: SlideState(
              q: Quad.unit(),
              r: Quad.unit(),
              value: value,
            ),
          ),
        ),
        infoWidgets: [
          GameTimeWidget(time: time),
          GameMoveCountWidget(moveCount: gameplayState.moveCount),
          GamePreviewButton(
            board: board,
            imageAsset: imageAsset,
            setPreviewing: setPreviewing,
          ),
        ],
      ),
    );
  }

  Widget pageLayout(
    BuildContext context, {
    required Widget gameWidget,
    required List<Widget> infoWidgets,
  }) {
    if (Orienter(context).isTall) {
      return Center(
        child: Column(
          children: [
            BannerAdWidget(),
            const Text(""),
            Expanded(child: gameWidget),
            const Text(""),
            ...infoWidgets,
            const Text(""),
            BannerAdWidget(),
          ],
        ),
      );
    }

    return Row(
      children: [
        Expanded(child: gameWidget),
        Column(
          children: [
            BannerAdWidget(padded: true),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: infoWidgets,
              ),
            ),
            BannerAdWidget(padded: true),
          ],
        ),
      ],
    );
  }

  void setPreviewing(bool newPreviewing) {
    setState(() => previewing = newPreviewing);
  }

  void checkIfSolved(BuildContext context) {
    if (!gameplayState.isSolved) return;

    Preferences prefs = Provider.of(context, listen: false);
    PreferencesCompletions(prefs: prefs).save(completion);

    NavigatorState navigator = Navigator.of(context);
    Duration waitTime = Duration(milliseconds: prefs.animationSpeed + 50);
    Future.delayed(waitTime).then(
      (_) => goToNextLevel(navigator),
    );
  }

  Completion get completion => Completion.createNew(
        boardId: board.id,
        time: time,
        moveCount: gameplayState.moveCount,
      );

  void goToNextLevel(NavigatorState navigator) {
    InterstitialAdWidget.load();
    navigator.pushReplacement(
      PageRouteBuilder(
        transitionDuration: const Duration(seconds: 1),
        transitionsBuilder: (context, a1, a2, child) => FadeTransition(
          opacity: a1,
          child: child,
        ),
        pageBuilder: (context, a1, a2) => SolvedGamePage(
          board: board,
          imageAsset: imageAsset,
          time: time,
        ),
      ),
    );
  }

  void goToBuilder(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BoardBuilderPage(
          initialBoard: board,
        ),
      ),
    );
  }

  void setGameplayState(GameplayState? newState) {
    if (newState == null) return;
    setState(() => gameplayState = newState);
    controller?.forward(from: 0);
  }

  void shuffle() => setGameplayState(gameplayState.shuffled);
  void solve() => setGameplayState(gameplayState.solved);
  void tapSquare(int index) {
    setGameplayState(gameplayState.tap(index));
    checkIfSolved(context);
  }
}
