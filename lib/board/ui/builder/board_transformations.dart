import 'dart:math';

import 'package:fifteen/board/domain/board.dart';
import 'package:fifteen/board/domain/chart.dart';
import 'package:fifteen/board/domain/coord.dart';
import 'package:fifteen/board/domain/double_point.dart';
import 'package:fifteen/board/domain/quad.dart';
import 'package:fifteen/board/domain/side.dart';
import 'package:fifteen/board/domain/connection.dart';
import 'package:fifteen/board/domain/constraint.dart';

class BoardTransformations {
  static Board withChartAdded(Board board, int n, int m) {
    double scale = 0.2;
    return board.copyWith(
      charts: [
        ...board.charts,
        Chart(
          n: n,
          m: m,
          quad: Quad.unit()
              .mult(scale)
              .scale(n.toDouble(), m.toDouble())
              .add(DoublePoint(
                Random().nextDouble() * (1.0 - scale * n),
                Random().nextDouble() * (1.0 - scale * m),
              )),
        ),
      ],
    );
  }

  static Set<int> connectedAs(int? a, Board board) {
    if (a == null) {
      return {
        for (int i = 0; i < board.charts.length; i++) i,
      };
    }
    Set<int> ret = {};
    List<int> fringe = [a];
    while (fringe.isNotEmpty) {
      int currentA = fringe.removeAt(0);
      ret.add(currentA);
      for (Connection connection in board.connections) {
        int fromA = connection.fromA, toA = connection.toA;
        if (fromA == currentA && !ret.contains(toA)) {
          ret.add(toA);
          fringe.add(toA);
        }
        if (toA == currentA && !ret.contains(fromA)) {
          ret.add(fromA);
          fringe.add(fromA);
        }
      }
    }
    return ret;
  }

  static Board chartsMapped(
    Board board,
    Chart Function(Chart chart, int a) map, {
    bool Function(int a)? where,
  }) {
    curriedMap(Chart chart, int a) =>
        (where?.call(a) ?? true) ? map(chart, a) : chart;
    List<Chart> newCharts = [
      for (int a = 0; a < board.charts.length; a++)
        curriedMap(board.charts[a], a),
    ];
    return board.copyWith(
      charts: newCharts,
    );
  }

  static Board mapped(
    Board board,
    DoublePoint Function(DoublePoint) map,
    int? selectedA,
  ) {
    Set<int> connectedA = connectedAs(selectedA, board);
    return chartsMapped(
      board,
      (chart, a) => board.charts[a].copyWith(
        quad: Quad(
          map(board.charts[a].quad.p1),
          map(board.charts[a].quad.p2),
          map(board.charts[a].quad.p3),
          map(board.charts[a].quad.p4),
        ),
      ),
      where: (a) => connectedA.contains(a),
    );
  }

  static DoublePoint getSelectionCenter(Board board, int? selectedA) {
    if (selectedA == null) return DoublePoint(0.5, 0.5);
    return board.charts[selectedA].quad.center;
  }

  static Board scaled(double scale, Board board, int? selectedA) {
    DoublePoint center = getSelectionCenter(board, selectedA);
    return BoardTransformations.mapped(
      board,
      (o) => (o - center) * scale + center,
      selectedA,
    );
  }

  static Board rotated(double amt, Board board, int? selectedA) {
    DoublePoint center = getSelectionCenter(board, selectedA);
    return mapped(
      board,
      (o) {
        DoublePoint op = o - center;
        return op * cos(amt) + op.normal() * sin(amt) + center;
      },
      selectedA,
    );
  }

  static Board translated(DoublePoint offset, Board board, int? selectedA) {
    return BoardTransformations.mapped(
      board,
      (o) => o + offset,
      selectedA,
    );
  }

  static Board recentered(Board board) {
    Iterable<DoublePoint> edgePoints = board.edgeCoords.map(
      (c) => board.getVertex(c),
    );
    if (edgePoints.isEmpty) return board;
    DoublePoint lo = edgePoints.reduce(
          (DoublePoint val, o) => DoublePoint(min(val.x, o.x), min(val.y, o.y)),
        ),
        hi = edgePoints.reduce(
          (DoublePoint val, o) => DoublePoint(max(val.x, o.x), max(val.y, o.y)),
        );
    DoublePoint diff = (lo + hi) / 2.0, half = DoublePoint(0.5, 0.5);
    double scale = 1.0 / max(hi.x - lo.x, hi.y - lo.y);
    return mapped(board, (o) => (o - diff) * scale + half, null);
  }

  static Board withCoordMoved(Board board, Coord c, DoublePoint to) {
    Quad quad = board.charts[c.a].quad;
    var n = board.charts[c.a].n, m = board.charts[c.a].m;
    double x = 0.5 * (c.hk.x + 1) / n, y = 0.5 * (c.hk.y + 1) / m;
    DoublePoint dif = to - board.getVertex(c);
    Quad newQuad = Quad(
      quad.p1 + dif * (1 - x) * (1 - y),
      quad.p2 + dif * (1 - x) * y,
      quad.p3 + dif * x * y,
      quad.p4 + dif * x * (1 - y),
    );
    return chartsMapped(
      board,
      (chart, a) => chart.copyWith(quad: newQuad),
      where: (a) => a == c.a,
    );
  }

  static Board aligned(Coord c1, Coord c2, Board board) {
    DoublePoint axis = board.getVertex(c2) - board.getVertex(c1);
    return rotated(pi - atan2(axis.y, axis.x), board, null);
  }

  static Board coincidentsAdded(List<Coord> coords, Board board) {
    ConstraintSet newConstraints = board.constraints;
    for (int i = 1; i < coords.length; i++) {
      newConstraints = newConstraints.addCoincident(
        CoincidentBoardConstraint.createNew(
          coords[i],
          coords[0],
        ),
      );
    }
    return board.copyWith(constraints: newConstraints);
  }

  static Board equidistantsAdded(List<Side> pairs, Board board) {
    ConstraintSet newConstraints = board.constraints;
    for (int i = 1; i < pairs.length; i++) {
      newConstraints = newConstraints.addEquidistant(
        EquidistantBoardConstraint.createNew(pairs[i], pairs[0]),
      );
    }
    return board.copyWith(constraints: newConstraints);
  }

  static Board finalize(Board board) {
    Board ret = board.copyWith(
      connections: board.constraints.generateConnections(board),
    );
    ret = board.constraints.solve(ret);
    ret = BoardTransformations.recentered(ret);
    ret = BoardTransformations.scaled(1.0 / 1.1, ret, null);
    return ret;
  }
}
