import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'dart:ui' as ui;

import 'package:fifteen/main.dart';
import 'package:fifteen/math/quad.dart';
import 'package:fifteen/game_ui/game_painter.dart';
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
  late Timer timer;
  double delta = 0;
  FragmentShader? shader;
  ui.Image? image;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadShader();
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

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
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () => widget.appState.shuffle(),
                  child: Text("Gumption"),
                ),
                GamePreviewWidget(
                  imageAsset: widget.imagePath,
                  board: widget.appState.board,
                  dimension: 100,
                ),
                SizedBox.square(dimension: 10),
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
          painter: GamePlayPainter(
            shader: shader!,
            image: image,
            game: widget.appState.game,
            board: widget.appState.board,
          ),
        ),
      );
    }
  }

  void goToSettings() {
    print("TODO lmao XD");
  }

  Size getSize(BuildContext context) {
    final box = context.findRenderObject() as RenderBox;
    double dim = min(box.size.width, box.size.height);
    return Size(dim, dim);
  }

  void onWidgetTap(TapDownDetails tapDetails, Size size) {
    var pos = tapDetails.localPosition;
    pos = Offset(pos.dx / size.width, pos.dy / size.height);

    List<Quad> quads = widget.appState.board.getSubquads();
    for (int i = 0; i < quads.length; i++) {
      if (quads[i].isInside(pos)) {
        widget.appState.tapAtIndex(i);
      }
    }
  }

  Future<void> _loadShader() async {
    final imageData = await rootBundle.load(widget.imagePath);
    image = await decodeImageFromList(imageData.buffer.asUint8List());

    final program = await FragmentProgram.fromAsset(widget.shaderPath);
    shader = program.fragmentShader();
    setState(() {
      //trigger a repaint
    });

    timer = Timer.periodic(const Duration(milliseconds: 16), (timer) {
      if (!mounted) return;
      setState(() {
        delta += 1 / 60;
      });
    });
  }
}
