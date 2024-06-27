import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'dart:ui' as ui;

import 'package:fifteen/builder_ui/builder_page.dart';
import 'package:fifteen/main.dart';
import 'package:fifteen/math/double_point.dart';
import 'package:fifteen/math/quad.dart';
import 'package:fifteen/game_ui/game_painter.dart';
import 'package:fifteen/settings_ui/settings_page.dart';
import 'package:fifteen/shared_ui/banner_ad_widget.dart';
import 'package:fifteen/shared_ui/game_preview_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GamePage extends StatefulWidget {
  const GamePage({
    super.key,
    required this.shaderPath,
    required this.imagePath,
    required this.appState,
  });

  final String shaderPath;
  final String imagePath;
  final FifteenAppState appState;

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  FragmentShader? shader;
  ui.Image? image;
  bool previewing = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadShader();
    });
    super.initState();
    widget.appState.addListener(_checkForDialog);
  }

  Future<void> _loadShader() async {
    final imageData = await rootBundle.load(widget.imagePath);
    final loadedImage = await decodeImageFromList(
      imageData.buffer.asUint8List(),
    );
    final program = await FragmentProgram.fromAsset(widget.shaderPath);
    setState(() {
      shader = program.fragmentShader();
      image = loadedImage;
    });
  }

  @override
  void dispose() {
    widget.appState.removeListener(_checkForDialog);
    super.dispose();
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
                Text("3:04", style: TextStyle(fontSize: 14 * 3)),
                GestureDetector(
                  onTapDown: (details) => setState(() => previewing = true),
                  onTapUp: (details) => setState(() => previewing = false),
                  child: GamePreviewWidget(
                    imageAsset: widget.imagePath,
                    board: widget.appState.board,
                    dimension: 100,
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
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("You Solved This Board!"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: Text("Home"),
              ),
            ],
          )
        ],
      ),
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
}
