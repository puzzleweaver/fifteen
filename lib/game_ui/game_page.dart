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
  final MyAppState appState;

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  FragmentShader? shader;
  ui.Image? image;
  bool solvedGame = false;
  bool showedDialog = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadShader();
    });
    super.initState();
    widget.appState.addListener(_checkForDialog);
  }

  @override
  void dispose() {
    widget.appState.removeListener(_checkForDialog);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Fifteen :)"),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: goToSettings,
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox.square(
              dimension: min(size.width, size.height),
              child: _body(),
            ),
            SizedBox.square(dimension: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(""),
                ElevatedButton(
                  onPressed: () {
                    widget.appState.shuffle();
                    setState(() {}); // trigger repaint
                  },
                  child: Text("Shuffle"),
                ),
                ElevatedButton(
                  onPressed: goToBuilder,
                  child: Text("Build"),
                ),
                ElevatedButton(
                  onPressed: () {
                    widget.appState.solveGame();
                    setState(() {});
                  },
                  child: Text("Solve"),
                ),
                GamePreviewWidget(
                  imageAsset: widget.imagePath,
                  board: widget.appState.board,
                  dimension: 100,
                ),
              ],
            ),
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
          ),
        ),
      );
    }
  }

  void _checkForDialog() {
    if (!showedDialog && widget.appState.game.isSolved()) {
      solvedGame = true;
      if (!showedDialog) {
        showDialog(
          context: context,
          builder: (context) => _dialog(),
        );
      }
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
                onPressed: () => Navigator.pop(context),
                child: Text("Back"),
              ),
              SizedBox.square(dimension: 8.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  print("TODO navigate to next board.");
                },
                child: Text("Next"),
              ),
            ],
          )
        ],
      ),
    );
  }

  void goToSettings() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SettingsPage()),
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

  Future<void> _loadShader() async {
    final imageData = await rootBundle.load(widget.imagePath);
    image = await decodeImageFromList(imageData.buffer.asUint8List());

    final program = await FragmentProgram.fromAsset(widget.shaderPath);
    shader = program.fragmentShader();
    setState(() {}); // trigger a repaint
  }

  void goToBuilder() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return BuilderPage(
            appState: widget.appState,
          );
        },
      ),
    );
  }
}
