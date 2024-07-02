import 'dart:math';
import 'dart:math' as math;

import 'package:fifteen/builder_ui/builder_painter.dart';
import 'package:fifteen/game_ui/game_page.dart';
import 'package:fifteen/main.dart';
import 'package:fifteen/math/board.dart';
import 'package:fifteen/math/constraint.dart';
import 'package:fifteen/math/coord.dart';
import 'package:fifteen/math/double_point.dart';
import 'package:fifteen/math/level.dart';
import 'package:fifteen/math/quad.dart';
import 'package:fifteen/math/side.dart';
import 'package:fifteen/shared_ui/border_box.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as dev;

class BuilderPage extends StatefulWidget {
  const BuilderPage({super.key, required this.appState});

  final FifteenAppState appState;

  @override
  State<BuilderPage> createState() => _BuilderPageState();
}

class _BuilderPageState extends State<BuilderPage> {
  // State Variables for BuilderPage
  List<Coord> selectedCoords = [];

  List<Board> history = [];

  Board get board => widget.appState.board;
  FifteenAppState get appState => widget.appState;

  @override
  Widget build(BuildContext context) {
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AspectRatio(
            aspectRatio: 1.0,
            child: _board(),
          ),
          GridView.count(
            crossAxisCount: 7,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.all(5.0),
            mainAxisSpacing: 5.0,
            crossAxisSpacing: 5.0,
            children: [
              builderButton(Icons.add, add),
              builderButton(Icons.addchart, addDialog),
              builderButton(Icons.calculate, solve),
              builderButton(Icons.crop, recenter),
              builderButton(
                Icons.rotate_right,
                () => rotateBy(-math.pi / 8),
              ),
              builderButton(Icons.rotate_left, () => rotateBy(math.pi / 8)),
              builderButton(
                Icons.vertical_align_center,
                (selectedCoords.length < 2) ? null : rotateVertical,
              ),
              builderButton(Icons.zoom_out_map, () => scale(1.1)),
              builderButton(Icons.zoom_in_map, () => scale(1.0 / 1.1)),
              builderButton(
                Icons.link,
                selectedCoords.length < 2 ? null : linkCoords,
              ),
              builderButton(
                Icons.straighten,
                selectedCoords.length < 4 ? null : linkSides,
              ),
              builderButton(Icons.cancel, resetSelection),
              builderButton(Icons.undo, history.isEmpty ? null : undo),
              builderButton(Icons.science, goToGamePage),
            ],
          ),
        ],
      ),
    );
  }

  Widget builderButton(IconData icon, void Function()? onPressed) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(padding: EdgeInsets.zero),
      onPressed: onPressed,
      child: Icon(icon),
    );
  }

  Widget _board() {
    return LayoutBuilder(
      builder: (context, constraints) => GestureDetector(
        onTapDown: (tapDetails) => onWidgetTap(tapDetails, context),
        child: BorderBox(
          CustomPaint(
            painter: BuilderPainter(
              board: board,
              selectedCoords: selectedCoords,
            ),
          ),
        ),
      ),
    );
  }

  void resetSelection() {
    setState(() {
      selectedCoords = [];
    });
  }

  void onWidgetTap(TapDownDetails tapDetails, BuildContext context) {
    final size = context.size ?? Size(1.0, 1.0);
    var pos = DoublePoint.fromOffset(tapDetails.localPosition);
    pos = DoublePoint(pos.x / size.width, pos.y / size.height);

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
    if (selectedCoords.isEmpty) {
      setState(() => selectedCoords = [tappedCoord]);
    } else {
      if (tappedCoord.isVertex && selectedCoords[0].isVertex) {
        setState(() {
          selectedCoords = [tappedCoord, ...selectedCoords];
        });
      }
    }
  }

  void tapNothing(DoublePoint where) {
    if (selectedCoords.isNotEmpty) {
      if (!selectedCoords[0].isVertex) {
        setBoard(
          mapBoard(
            board,
            (o) => o - board.getVertex(selectedCoords[0]) + where,
          ),
        );
      } else {
        setBoard(board.setCoordLocation(selectedCoords[0], where));
      }
    }
    resetSelection();
  }

  void add() {
    setBoard(board.add(1, 1));
  }

  void addDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Add Chart"),
        content: Wrap(
          children: [
            for (int i = 1; i <= 5; i++)
              for (int j = i; j <= 5; j++)
                ElevatedButton(
                  style: ElevatedButton.styleFrom(padding: EdgeInsets.all(8.0)),
                  onPressed: () {
                    setBoard(widget.appState.board.add(i, j));
                    Navigator.pop(context);
                  },
                  child: Text("${i}x$j"),
                ),
          ],
        ),
      ),
    );
  }

  Board mapBoard(Board board, DoublePoint Function(DoublePoint) map) {
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

  Iterable<CoincidentBoardConstraint> getCoincidentsWithA(int a) {
    return board.constraints.coincidents.where((conv) => conv.hasA(a));
  }

  List<int> getConnectedAs(int a) {
    Set<int> ret = {}, fringe = {a};
    while (fringe.isNotEmpty) {
      int currentA = fringe.first;
      fringe.remove(currentA);
      if (ret.contains(currentA)) continue;
      for (var coin in getCoincidentsWithA(currentA)) {
        for (var newA in coin.coords.map((c) => c.a)) {
          if (!ret.contains(newA)) fringe.add(newA);
        }
      }
      ret.add(currentA);
    }
    return ret.toList();
  }

  bool isSelected(int a) {
    if (selectedCoords.isEmpty) return true;
    return getConnectedAs(selectedCoords[0].a).contains(a);
  }

  DoublePoint getQuadCenter(Quad q) {
    return (q.p1 + q.p2 + q.p3 + q.p4) / 4.0;
  }

  DoublePoint getSelectionCenter(Board board) {
    var list = [
      for (int i = 0; i < board.quads.length; i++)
        if (isSelected(i)) getQuadCenter(board.quads[i])
    ];
    return list.isEmpty
        ? DoublePoint(0, 0)
        : list.reduce((val, o) => val + o) / list.length.toDouble();
  }

  void scale(double scale) {
    DoublePoint center = getSelectionCenter(board);
    setBoard(mapBoard(board, (o) => (o - center) * scale + center));
  }

  void rotateBy(double amt) {
    DoublePoint center = getSelectionCenter(board);
    setBoard(
      mapBoard(
        board,
        (o) {
          DoublePoint op = o - center;
          return op * cos(amt) + op.normal() * sin(amt) + center;
        },
      ),
    );
    setState(() {});
  }

  void rotateVertical() {
    Coord c1 = selectedCoords[0], c2 = selectedCoords[1];
    DoublePoint axis = board.getVertex(c2) - board.getVertex(c1);
    rotateBy(math.pi - atan2(axis.y, axis.x));
    resetSelection();
  }

  void linkCoords() {
    Board nboard = board;
    for (int i = 1; i < selectedCoords.length; i++) {
      nboard = Board(
        charts: nboard.charts,
        convs: nboard.convs,
        quads: nboard.quads,
        constraints: nboard.constraints.addCoincident(
          CoincidentBoardConstraint.createNew(
            selectedCoords[i],
            selectedCoords[0],
          ),
        ),
      );
    }
    setBoard(nboard);
    resetSelection();
  }

  void linkSides() {
    Board nboard = board;
    for (int i = 2; i + 1 < selectedCoords.length; i += 2) {
      nboard = Board(
        charts: nboard.charts,
        convs: nboard.convs,
        quads: nboard.quads,
        constraints: nboard.constraints.addEquidistant(
          EquidistantBoardConstraint.createNew(
            Side(selectedCoords[1], selectedCoords[0]),
            Side(selectedCoords[i], selectedCoords[i + 1]),
          ),
        ),
      );
    }
    setBoard(nboard);
    // instead of resetting the whole selection, allow for chaining
    setState(() {
      selectedCoords = [selectedCoords[0], selectedCoords[1]];
    });
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
    if (edgePoints.isEmpty) return;
    DoublePoint lo = edgePoints.reduce(
          (DoublePoint val, o) => DoublePoint(
            min(val.x, o.x),
            min(val.y, o.y),
          ),
        ),
        hi = edgePoints.reduce(
          (DoublePoint val, o) => DoublePoint(
            max(val.x, o.x),
            max(val.y, o.y),
          ),
        );
    DoublePoint diff = (lo + hi) / 2.0, half = DoublePoint(0.5, 0.5);
    double scale = 1.0 / max(hi.x - lo.x, hi.y - lo.y);
    setBoard(mapBoard(board, (o) => (o - diff) * scale + half));
  }

  void submit() {
    dev.log("$board");
  }

  void goToGamePage() {
    appState.rerollAds();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return GamePage(
            level: Level(board: board),
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
