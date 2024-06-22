import 'dart:math';

import 'package:fifteen/builder_ui/builder_painter.dart';
import 'package:fifteen/game_ui/game_page.dart';
import 'package:fifteen/main.dart';
import 'package:fifteen/math/board.dart';
import 'package:fifteen/math/constraint.dart';
import 'package:fifteen/math/coord.dart';
import 'package:fifteen/math/quad.dart';
import 'package:fifteen/math/side.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as dev;

class BuilderPage extends StatefulWidget {
  const BuilderPage({super.key, required this.appState});

  final MyAppState appState;

  @override
  State<BuilderPage> createState() => _BuilderPageState();
}

class _BuilderPageState extends State<BuilderPage> {
  // State Variables for BuilderPage
  Coord? selectedCoord;
  Coord? prevSelectedCoord;
  Coord? prevPrevSelectedCoord;
  Coord? prevPrevPrevSelectedCoord;

  List<Board> history = [];

  Board get board => widget.appState.board;
  MyAppState get appState => widget.appState;

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
            Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.blueAccent)),
              child: SizedBox.square(
                dimension: min(size.width, size.height),
                child: GestureDetector(
                  onTapDown: (tapDetails) =>
                      onWidgetTap(tapDetails, getSize(context)),
                  child: CustomPaint(
                    painter: BuilderPainter(
                      board: board,
                      selected: selectedCoord,
                      prevSelected: prevSelectedCoord,
                      prevPrevSelected: prevPrevSelectedCoord,
                      prevPrevPrevSelected: prevPrevPrevSelectedCoord,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox.square(dimension: 8.0),
            Wrap(
              runSpacing: 5.0,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: add,
                  child: Icon(Icons.add),
                ),
                SizedBox.square(dimension: 8.0),
                ElevatedButton(
                  onPressed: delete,
                  child: Icon(Icons.remove),
                ),
                SizedBox.square(dimension: 8.0),
                ElevatedButton(
                  onPressed: solve,
                  child: Icon(Icons.calculate),
                ),
                SizedBox.square(dimension: 8.0),
                ElevatedButton(
                  onPressed: recenter,
                  child: Icon(Icons.crop),
                ),
                SizedBox.square(dimension: 8.0),
                ElevatedButton(
                  onPressed: () => rotateBy(-0.1),
                  child: Icon(Icons.rotate_right),
                ),
                SizedBox.square(dimension: 8.0),
                ElevatedButton(
                  onPressed: () => rotateBy(0.1),
                  child: Icon(Icons.rotate_left),
                ),
                SizedBox.square(dimension: 8.0),
                ElevatedButton(
                  onPressed: () => scale(1.1),
                  child: Icon(Icons.zoom_out_map),
                ),
                SizedBox.square(dimension: 8.0),
                ElevatedButton(
                  onPressed: () => scale(1.0 / 1.1),
                  child: Icon(Icons.zoom_in_map),
                ),
                SizedBox.square(dimension: 8.0),
                ElevatedButton(
                  onPressed: linkCoords,
                  child: Icon(Icons.link),
                ),
                SizedBox.square(dimension: 8.0),
                ElevatedButton(
                  onPressed: linkSides,
                  child: Icon(Icons.straighten),
                ),
                SizedBox.square(dimension: 8.0),
                ElevatedButton(
                  onPressed: () => setState(() => selectedCoord = null),
                  child: Icon(Icons.cancel),
                ),
                SizedBox.square(dimension: 8.0),
                ElevatedButton(
                  onPressed: history.isEmpty ? null : undo,
                  child: Icon(Icons.undo),
                ),
                SizedBox.square(dimension: 8.0),
                ElevatedButton(
                  onPressed: goToGamePage,
                  child: Icon(Icons.science),
                ),
                SizedBox.square(dimension: 8.0),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void resetSelection() {
    setState(() {
      selectedCoord = null;
      prevSelectedCoord = null;
      prevPrevSelectedCoord = null;
      prevPrevPrevSelectedCoord = null;
    });
  }

  Size getSize(BuildContext context) {
    final box = context.findRenderObject() as RenderBox;
    double dim = min(box.size.width, box.size.height);
    return Size(dim, dim);
  }

  void onWidgetTap(TapDownDetails tapDetails, Size size) {
    var pos = tapDetails.localPosition;
    pos = Offset(pos.dx / size.width, pos.dy / size.height);

    List<Coord> edgeCoords = board.getEdgeCoords();
    for (int i = 0; i < edgeCoords.length; i++) {}
    List<Quad> quads = board.getSubquads();
    for (int i = 0; i < edgeCoords.length; i++) {
      double dist = (pos - board.getVertex(edgeCoords[i])).distance;
      if (dist <= 1.0 / 25) {
        tapCoord(edgeCoords[i]);
        return;
      }
    }
    for (int i = 0; i < quads.length; i++) {
      if (quads[i].isInside(pos)) {
        tapCoord(board.getCoord(i)!);
        return;
      }
    }
    tapNothing(pos);
  }

  void tapCoord(Coord tappedCoord) {
    if (selectedCoord == null) {
      setState(() => selectedCoord = tappedCoord);
    } else {
      if (tappedCoord.isVertex && selectedCoord!.isVertex) {
        setState(() {
          prevPrevPrevSelectedCoord = prevPrevSelectedCoord;
          prevPrevSelectedCoord = prevSelectedCoord;
          prevSelectedCoord = selectedCoord;
          selectedCoord = tappedCoord;
        });
      }
    }
  }

  void tapNothing(Offset where) {
    if (selectedCoord != null) {
      if (selectedCoord?.isVertex == false) {
        setBoard(
          mapBoard(board, (o) => (o - board.getVertex(selectedCoord!) + where)),
        );
      } else {
        setBoard(
          board.setCoordLocation(selectedCoord!, where),
        );
      }
    }
    resetSelection();
  }

  void delete() {
    if (selectedCoord?.isVertex == false) {
      setBoard(widget.appState.board.withoutChart(selectedCoord!.a));
      resetSelection();
    }
  }

  void add() {
    setBoard(board.add());
  }

  Board mapBoard(Board board, Offset Function(Offset) map) {
    return Board(
      convs: board.convs,
      quads: [
        for (int a = 0; a < board.quads.length; a++)
          isSelected(a)
              ? Quad(
                  map(board.quads[a].p1),
                  map(board.quads[a].p2),
                  map(board.quads[a].p3),
                  map(board.quads[a].p4),
                )
              : board.quads[a]
      ],
      charts: board.charts,
      constraints: board.constraints,
    );
  }

  bool isSelected(int a) {
    return selectedCoord == null ||
        selectedCoord?.a == a ||
        prevSelectedCoord?.a == a;
  }

  Offset getQuadCenter(Quad q) {
    return (q.p1 + q.p2 + q.p3 + q.p4) / 4;
  }

  Offset getSelectionCenter(Board board) {
    var list = [
      for (int i = 0; i < board.quads.length; i++)
        if (isSelected(i)) getQuadCenter(board.quads[i])
    ];
    return list.reduce((val, o) => val + o) / list.length.toDouble();
  }

  void scale(double scale) {
    Offset center = getSelectionCenter(board);
    setBoard(mapBoard(board, (o) => (o - center) * scale + center));
  }

  void rotateBy(double amt) {
    Offset center = getSelectionCenter(board);
    setBoard(
      mapBoard(
        board,
        (o) {
          Offset op = o - center;
          return op * cos(amt) + Offset(op.dy, -op.dx) * sin(amt) + center;
        },
      ),
    );
    setState(() {});
  }

  void linkCoords() {
    setBoard(
      Board(
        charts: board.charts,
        convs: board.convs,
        quads: board.quads,
        constraints: board.constraints.addCoincident(
          CoincidentBoardConstraint.createNew(
            prevSelectedCoord,
            selectedCoord,
          ),
        ),
      ),
    );
    resetSelection();
  }

  void linkSides() {
    if (selectedCoord == null ||
        prevSelectedCoord == null ||
        prevPrevSelectedCoord == null ||
        prevPrevPrevSelectedCoord == null) return;
    setBoard(
      Board(
        charts: board.charts,
        convs: board.convs,
        quads: board.quads,
        constraints: board.constraints.addEquidistant(
          EquidistantBoardConstraint.createNew(
            Side(prevSelectedCoord!, selectedCoord!),
            Side(prevPrevSelectedCoord!, prevPrevPrevSelectedCoord!),
          ),
        ),
      ),
    );
    resetSelection();
  }

  void solve() {
    Board newBoard = Board(
      charts: board.charts,
      convs: board.constraints.generateConvs(board),
      constraints: board.constraints,
      quads: board.quads,
    );
    setBoard(newBoard.constraints.solve(newBoard));
    resetSelection();
  }

  void recenter() {
    var edgePoints = board.getEdgeCoords().map((c) => board.getVertex(c));
    Offset lo = edgePoints.reduce(
          (Offset val, o) => Offset(
            min(val.dx, o.dx),
            min(val.dy, o.dy),
          ),
        ),
        hi = edgePoints.reduce(
          (Offset val, o) => Offset(
            max(val.dx, o.dx),
            max(val.dy, o.dy),
          ),
        );
    Offset diff = (lo + hi) / 2, half = Offset(0.5, 0.5);
    double scale = 1.0 / max(hi.dx - lo.dx, hi.dy - lo.dy);
    setBoard(mapBoard(board, (o) => (o - diff) * scale + half));
  }

  void submit() {
    dev.log("$board");
  }

  void goToGamePage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return GamePage(
            imagePath: "assets/images/img4.png",
            shaderPath: "shaders/image_quad.frag",
            appState: appState,
          );
        },
      ),
    );
  }

  void setBoard(Board newBoard) {
    setState(() {
      history = [...history, board];
    });
    appState.setBoard(newBoard);
  }

  void undo() {
    if (history.isEmpty) return;
    appState.setBoard(history.last);
    setState(() {
      history = [for (int i = 0; i < history.length - 1; i++) history[i]];
    });
  }
}
