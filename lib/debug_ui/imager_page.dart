// ignore_for_file: unnecessary_const

import 'dart:io';
import 'dart:math';
import 'dart:ui';
import 'dart:ui' as ui;

import 'package:fifteen/debug_ui/numbers.dart';
import 'package:fifteen/game_ui/game_page.dart';
import 'package:fifteen/main.dart';
import 'package:fifteen/math/board.dart';
import 'package:fifteen/math/board_list.dart';
import 'package:fifteen/math/double_point.dart';
import 'package:fifteen/math/level.dart';
import 'package:fifteen/math/quad.dart';
import 'package:fifteen/shared_ui/preview_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

class ImagerPage extends StatefulWidget {
  @override
  State<ImagerPage> createState() => _ImagerPageState();
}

class _ImagerPageState extends State<ImagerPage> {
  String? mostRecent;
  Board board = BoardList.cube2;
  FragmentShader? shader;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadShader();
    });
    super.initState();
  }

  Future<void> _loadShader() async {
    final program = await FragmentProgram.fromAsset("shaders/foreground.frag");
    shader = program.fragmentShader();
    setState(() {
      //trigger a repaint
    });
  }

  @override
  Widget build(BuildContext context) {
    FifteenAppState appState = context.watch<FifteenAppState>();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 6,
                mainAxisSpacing: 5.0,
                crossAxisSpacing: 5.0,
                children: [
                  for (Board board in BoardList.all)
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(padding: EdgeInsets.zero),
                      onPressed: () async {
                        setState(() {
                          this.board = board;
                        });
                        await draw("${board.uuid}.png");
                        // goToGame(appState);
                      },
                      child: PreviewWidget(
                        level: Level(
                            board: board, image: "assets/images/img3.png"),
                        locked: false,
                      ),
                    ),
                ],
              ),
              PreviewWidget(
                level: Level(board: board, image: mostRecent),
                locked: false,
              ),
              if (mostRecent != null) Image.asset(mostRecent!, scale: 0.3),
              if (mostRecent != null)
                ElevatedButton(
                  onPressed: () => goToGame(appState),
                  child: Icon(Icons.science),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> writeToFile(ByteData data, String filename) async {
    final directory = await getApplicationDocumentsDirectory();
    final buffer = data.buffer;
    String path = "${directory.path}/$filename";
    File file = await File(path).create(recursive: true);
    file = await file.writeAsBytes(
      buffer.asUint8List(
        data.offsetInBytes,
        data.lengthInBytes,
      ),
    );
    setState(() => mostRecent = file.path);
  }

  void paintText(
    Canvas c,
    int width,
    int height,
    int text,
    double x,
    double y,
  ) {
    final textPainter = TextPainter(
      text: numbers[text],
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: 1.0 * width,
    );
    final xCenter = x * width - textPainter.width / 2;
    final yCenter = y * height - textPainter.height / 2;
    final offset = Offset(xCenter, yCenter);
    textPainter.paint(c, offset);
  }

  Future<void> draw(String filename) async {
    int width = 400, height = 400;
    shader?.setFloat(0, 1.0 * width);
    shader?.setFloat(1, 1.0 * height);

    print("Generating...");
    PictureRecorder recorder = PictureRecorder();
    Canvas c = Canvas(recorder);
    Paint paint = Paint();
    paint.color = Color(0x00ffffff);
    c.drawPaint(paint);
    paint.color = Color(0xffffffff);
    paint.strokeWidth = 20;

    shader?.setFloat(3, Random().nextDouble() * 6.282);

    List<Quad> quads = board.getSubquads();
    quads.sort((a, b) {
      DoublePoint am = (a.p1 + a.p2 + a.p3 + a.p4) / 4,
          bm = (b.p1 + b.p2 + b.p3 + b.p4) / 4;
      return (am.x + am.y * 50).compareTo(bm.x + bm.y * 50);
    });
    for (int i = 0; i < quads.length; i++) {
      Quad quad = quads[i];
      DoublePoint pt = (quad.p1 + quad.p2 + quad.p3 + quad.p4) / 4;
      print(pt);
      Path path = Path();
      path.moveTo(quad.p1.x * width, quad.p1.y * height);
      path.lineTo(quad.p2.x * width, quad.p2.y * height);
      path.lineTo(quad.p3.x * width, quad.p3.y * height);
      path.lineTo(quad.p4.x * width, quad.p4.y * height);
      path.close();
      shader?.setFloat(2, i / quads.length);
      // paint.shader = shader;
      paint.color = Colors.white;

      c.drawPath(path, paint);
      paintText(c, width, height, i + 1, pt.x, pt.y);
    }

    Picture p = recorder.endRecording();
    ui.Image image = await p.toImage(width, height);
    ByteData? data = await image.toByteData(format: ImageByteFormat.png);
    if (data != null) {
      writeToFile(data, filename);
    }
  }

  void goToGame(FifteenAppState appState) {
    appState.setBoard(board);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return GamePage(
            level: Level(board: board, image: mostRecent),
            appState: appState,
          );
        },
      ),
    );
  }
}
