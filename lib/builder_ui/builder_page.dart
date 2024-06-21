import 'dart:math';

import 'package:fifteen/builder_ui/builder_painter.dart';
import 'package:fifteen/main.dart';
import 'package:fifteen/math/coord.dart';
import 'package:fifteen/math/quad.dart';
import 'package:flutter/material.dart';

class BuilderPage extends StatefulWidget {
  const BuilderPage({super.key, required this.appState});

  final MyAppState appState;

  @override
  State<BuilderPage> createState() => _BuilderPageState();
}

class _BuilderPageState extends State<BuilderPage> {
  // State Variables for BuilderPage
  // TODO mode, selection, etc
  Coord? selected;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Build a Board"),
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: submit,
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
              child: GestureDetector(
                onTapDown: (tapDetails) =>
                    onWidgetTap(tapDetails, getSize(context)),
                child: CustomPaint(
                  painter: BuilderPainter(
                    board: widget.appState.board,
                  ),
                ),
              ),
            ),
            SizedBox.square(dimension: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: add,
                  child: Icon(Icons.add),
                ),
                SizedBox.square(dimension: 8.0),
                ElevatedButton(
                  onPressed: () => widget.appState.shuffle(),
                  child: Icon(Icons.remove),
                ),
                SizedBox.square(dimension: 8.0),
                ElevatedButton(
                  onPressed: () => print("Gumption"),
                  child: Icon(Icons.calculate),
                ),
                SizedBox.square(dimension: 8.0),
                ElevatedButton(
                  onPressed: () => print("Gumption"),
                  child: Icon(Icons.crop),
                ),
                SizedBox.square(dimension: 8.0),
                ElevatedButton(
                  onPressed: () => print("Gumption"),
                  child: Icon(Icons.image),
                ),
                SizedBox.square(dimension: 8.0),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Size getSize(BuildContext context) {
    final box = context.findRenderObject() as RenderBox;
    double dim = min(box.size.width, box.size.height);
    return Size(dim, dim);
  }

  void onWidgetTap(TapDownDetails tapDetails, Size size) {
    var pos = tapDetails.localPosition;
    pos = Offset(pos.dx / size.width, pos.dy / size.height);

    List<Offset> verts = widget.appState.board.getVertices();
    for (int i = 0; i < verts.length; i++) {}
    List<Quad> quads = widget.appState.board.getSubquads();
    for (int i = 0; i < quads.length; i++) {
      if (quads[i].isInside(pos)) {
        selected = widget.appState.board.getCoord(i);
      }
    }
  }

  void add() {
    widget.appState.setBoard(
      widget.appState.board.add(),
    );
    setState(() {}); // repaint
  }

  void submit() {
    // TODO finalize the board and save it (print it out?)
    print([for (int i = 0; i < 20; i++) "-"].join(""));
    print(widget.appState.board);
    print([for (int i = 0; i < 20; i++) "-"].join(""));
  }
}
