import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'dart:ui' as ui;

import 'package:fifteen/builder_ui/builder_page.dart';
import 'package:fifteen/main.dart';
import 'package:fifteen/math/double_point.dart';
import 'package:fifteen/math/level.dart';
import 'package:fifteen/math/quad.dart';
import 'package:fifteen/game_ui/game_painter.dart';
import 'package:fifteen/settings_ui/settings_page.dart';
import 'package:fifteen/shared_ui/banner_ad_widget.dart';
import 'package:fifteen/shared_ui/preview_widget.dart';
import 'package:fifteen/shared_ui/interstitial.dart';
import 'package:fifteen/shared_ui/prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  FragmentShader? shader;
  ui.Image? image;
  bool previewing = false;

  Set<int> _adventureData = {};
  bool _timerEnabled = Prefs.timerEnabledDefault;

  Timer? timer;
  DateTime? initialTime, currentTime;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadShader();
    });
    widget.appState.addListener(_checkForDialog);
    _loadSharedPreferences();
    initialTime = DateTime.now();
    timer = Timer.periodic(Duration(milliseconds: 100), (Timer t) {
      setState(() => currentTime = DateTime.now());
    });
    super.initState();
  }

  Future<void> _loadSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _adventureData = Prefs.getAdventureData(prefs);
      _timerEnabled =
          prefs.getBool(Prefs.timerEnabledLabel) ?? Prefs.timerEnabledDefault;
    });
  }

  Future<void> _saveLevelSolved(int? solvedLevelIndex) async {
    if (solvedLevelIndex == null) return;
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _adventureData = Prefs.setAdventureData(prefs, {
        ..._adventureData,
        solvedLevelIndex,
      });
    });
  }

  Future<void> _loadShader() async {
    final imageData = await rootBundle.load(widget.level.image);
    final loadedImage = await decodeImageFromList(
      imageData.buffer.asUint8List(),
    );
    final program = await FragmentProgram.fromAsset("shaders/image_quad.frag");
    setState(() {
      shader = program.fragmentShader();
      image = loadedImage;
    });
  }

  @override
  void dispose() {
    widget.appState.removeListener(_checkForDialog);
    timer?.cancel();
    timer = null;
    super.dispose();
  }

  String getTimeDisplay() {
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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: BannerAdWidget(0),
        actions: [
          PopupMenuButton<String>(
            onSelected: handleMore,
            itemBuilder: (BuildContext context) {
              return {'Shuffle', 'Solve', 'Build', 'Settings'}
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
            BannerAdWidget(1, padded: true),
            Expanded(child: Container()),
            SizedBox.square(
              dimension: min(size.width, size.height),
              child: _body(),
            ),
            SizedBox.square(dimension: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ...(_timerEnabled
                    ? [
                        Expanded(child: Container()),
                        Text(getTimeDisplay(),
                            style: TextStyle(fontSize: 14 * 3)),
                        Expanded(child: Container()),
                      ]
                    : []),
                GestureDetector(
                  onTapDown: (details) => setState(() => previewing = true),
                  onTapUp: (details) => setState(() => previewing = false),
                  onTapCancel: () => setState(() => previewing = false),
                  child: PreviewWidget(
                    level: widget.level,
                    dimension: 100,
                    locked: false,
                  ),
                ),
              ],
            ),
            Expanded(child: Container()),
            SafeArea(top: false, child: BannerAdWidget(2)),
          ],
        ),
      ),
    );
  }

  Widget _body() {
    if (shader == null) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return GestureDetector(
        onTapDown: (tapDetails) => onWidgetTap(tapDetails, getSize(context)),
        child: CustomPaint(
          painter: GamePainter(
            shader: shader!,
            image: image,
            game: widget.appState.game,
            board: widget.appState.board,
            previewing: previewing,
          ),
        ),
      );
    }
  }

  void _checkForDialog() {
    if (widget.appState.game.isSolved()) {
      _saveLevelSolved(widget.level.index);
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
              child: _dialog(),
            ),
          );
        },
        transitionDuration: Duration(milliseconds: 1000),
        barrierDismissible: false,
        barrierLabel: '',
        context: context,
        pageBuilder: (context, animation, secondaryAnimation) => Container(),
      );
    }
  }

  Widget _dialog() {
    bool hasNext = widget.level.hasNext();
    return AlertDialog(
      title: Text("You Solved This Board!"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PreviewWidget(
            level: widget.level,
            locked: false,
            dimension: 200,
          ),
          if (_timerEnabled)
            Text(
              "Your time was ${getTimeDisplay()}.",
            ),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: onHome,
          child: Text("Home"),
        ),
        SizedBox.square(dimension: 8.0),
        ElevatedButton(
          onPressed: onAgain,
          child: Text("Again"),
        ),
        if (hasNext) SizedBox.square(dimension: 8.0),
        if (hasNext)
          ElevatedButton(
            onPressed: onNext,
            child: Text("Next"),
          ),
      ],
    );
  }

  Size getSize(BuildContext context) {
    final box = context.findRenderObject() as RenderBox;
    double dim = min(box.size.width, box.size.height);
    return Size(dim, dim);
  }

  void onWidgetTap(TapDownDetails tapDetails, Size size) {
    DoublePoint pos = DoublePoint.fromOffset(tapDetails.localPosition);
    pos = DoublePoint(pos.x / size.width, pos.y / size.height);

    List<Quad> quads = widget.appState.board.getSubquads();
    for (int i = 0; i < quads.length; i++) {
      if (quads[i].isInside(pos)) {
        widget.appState.tapAtIndex(i);
        setState(() {}); // trigger repaint
      }
    }
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
      MaterialPageRoute(builder: (context) => SettingsPage()),
    );
  }

  void goToBuilder() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BuilderPage(appState: widget.appState),
      ),
    );
  }

  void onHome() {
    Navigator.pop(context); // dismiss "you win" dialog
    Navigator.pop(context); // dismiss game page
    Interstitial.show();
  }

  void onAgain() {
    Navigator.pop(context);
    Navigator.pop(context);
    Interstitial.show();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          widget.appState.setBoard(widget.level.board);
          return GamePage(
            level: widget.level,
            appState: widget.appState,
          );
        },
      ),
    );
  }

  void onNext() {
    Navigator.pop(context);
    Navigator.pop(context);
    Interstitial.show();
    assert(widget.level.hasNext());
    Level next = widget.level.next;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          widget.appState.setBoard(next.board);
          return GamePage(
            level: next,
            appState: widget.appState,
          );
        },
      ),
    );
  }
}
