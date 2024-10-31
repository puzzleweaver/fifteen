import 'dart:math' as math;

import 'package:fifteen/board/domain/board.dart';
import 'package:fifteen/board/domain/double_point.dart';
import 'package:fifteen/board/domain/quad.dart';
import 'package:fifteen/board/domain/side.dart';
import 'package:fifteen/board/ui/builder/add_chart_dialog.dart';
import 'package:fifteen/board/ui/builder/board_builder_painter.dart';
import 'package:fifteen/board/ui/builder/board_transformations.dart';
import 'package:fifteen/board/domain/coord.dart';
import 'package:fifteen/math/level.dart';
import 'package:fifteen/shared/ui/builders.dart';
import 'package:fifteen/shared/ui/custom_canvas.dart';
import 'package:flutter/material.dart';

class BoardBuilderPage extends StatefulWidget {
  final Level level;
  final void Function(Board newBoard, String description) setBoard;
  const BoardBuilderPage({
    super.key,
    required this.setBoard,
    required this.level,
  });

  @override
  State<BoardBuilderPage> createState() => BoardBuilderPageState();
}

class BoardBuilderPageState extends State<BoardBuilderPage> {
  List<Coord> selectedCoords = [];

  Board get board => widget.level.board;
  void Function(Board newBoard, String description) get setBoard =>
      widget.setBoard;

  @override
  Widget build(BuildContext context) {
    return Builders.container(
      body: AspectRatio(
        aspectRatio: 1.0,
        child: FifteenCanvas(
          getPainter: (shader, image) => BoardBuilderPainter(
            shader: shader,
            image: image,
            level: widget.level,
            selectedCoords: selectedCoords,
          ),
          onTap: onTap,
        ),
      ),
      actions: [
        Builders.button(Icons.add, addChartDialog),
        Builders.button(Icons.calculate, solve),
        Builders.button(Icons.rotate_right, () => rotate(-math.pi / 8)),
        Builders.button(Icons.rotate_left, () => rotate(math.pi / 8)),
        Builders.button(
          Icons.vertical_align_center,
          (selectedCoords.length < 2) ? null : align,
        ),
        Builders.button(Icons.zoom_out_map, () => scale(1.1)),
        Builders.button(Icons.zoom_in_map, () => scale(1.0 / 1.1)),
        Builders.button(
          Icons.link,
          selectedCoords.length < 2 ? null : linkCoords,
        ),
        Builders.button(
          Icons.reorder,
          selectedCoords.length < 4
              ? null
              : () => addEquidistants(alternatingPairs),
        ),
        Builders.button(
          Icons.show_chart,
          selectedCoords.length < 4 ? null : () => addEquidistants(pathPairs),
        ),
        Builders.button(Icons.cancel, resetSelection),
      ],
    );
  }

  void resetSelection() {
    setState(() {
      selectedCoords = [];
    });
  }

  void onTap(DoublePoint pos) {
    List<Coord> edgeCoords = board.edgeCoords.toList();
    for (int i = 0; i < edgeCoords.length; i++) {}
    for (int i = 0; i < edgeCoords.length; i++) {
      double dist = (pos - board.getVertex(edgeCoords[i])).distance;
      if (dist <= 1.0 / 25) {
        tapCoord(edgeCoords[i], pos);
        return;
      }
    }

    List<Quad> quads = board.subquads;
    for (int i = 0; i < quads.length; i++) {
      if (quads[i].isInside(pos)) {
        tapCoord(board.getCoord(i)!, pos);
        return;
      }
    }

    tapNothing(pos);
  }

  void tapCoord(Coord tappedCoord, DoublePoint where) {
    if (selectedCoords.isEmpty) {
      setState(() => selectedCoords = [tappedCoord]);
      return;
    }

    if (tappedCoord.isVertex && selectedCoords[0].isVertex) {
      setState(() {
        selectedCoords = [tappedCoord, ...selectedCoords];
      });
      return;
    }

    tapNothing(where);
  }

  void tapNothing(DoublePoint where) {
    if (selectedCoords.isNotEmpty) {
      if (!selectedCoords[0].isVertex) {
        setBoard(
          BoardTransformations.mapped(
            board,
            (o) => o - board.getVertex(selectedCoords[0]) + where,
            selectedCoords.firstOrNull?.a,
          ),
          "Moved Charts",
        );
      } else {
        setBoard(
          BoardTransformations.withCoordMoved(board, selectedCoords[0], where),
          "Moved Vertex",
        );
      }
    }
    resetSelection();
  }

  void addChartDialog() {
    showDialog(
      context: context,
      builder: (context) => AddChartDialog(onSubmit: addChart),
    );
  }

  void addChart(int n, int m) {
    setBoard(
      BoardTransformations.withChartAdded(board, n, m),
      "Added Chart",
    );
  }

  void scale(double scale) {
    setBoard(
      BoardTransformations.scaled(scale, board, selectedCoords.firstOrNull?.a),
      "Scaled Board",
    );
  }

  void rotate(double amt) {
    setBoard(
      BoardTransformations.rotated(amt, board, selectedCoords.firstOrNull?.a),
      "Rotated Board",
    );
  }

  void translate(DoublePoint offset) {
    setBoard(
      BoardTransformations.translated(
        offset,
        board,
        selectedCoords.firstOrNull?.a,
      ),
      "Shifted Board",
    );
  }

  void align() {
    setBoard(
      BoardTransformations.aligned(
        selectedCoords[0],
        selectedCoords[1],
        board,
      ),
      "Aligned Board",
    );
    resetSelection();
  }

  void linkCoords() {
    setBoard(
      BoardTransformations.coincidentsAdded(selectedCoords, board),
      "Coincident Constraint",
    );
    resetSelection();
  }

  // equidist every other pair (0, 1) = (2, 3) = ... = (n-1, n)
  List<Side> get alternatingPairs => [
        for (int i = 0; i + 1 < selectedCoords.length; i += 2)
          Side(selectedCoords[i], selectedCoords[i + 1])
      ];

  // equidist a path (0, 1) = (1, 2) = ... = (n-1, n)
  List<Side> get pathPairs => [
        for (int i = 0; i + 1 < selectedCoords.length; i++)
          Side(selectedCoords[i], selectedCoords[i + 1])
      ];

  void addEquidistants(List<Side> pairs) {
    setBoard(
      BoardTransformations.equidistantsAdded(pairs, board),
      "Equidistant Constraint",
    );
    resetSelection();
  }

  void solve() {
    setBoard(BoardTransformations.finalize(board), "Solved Constraints");
    resetSelection();
  }
}
