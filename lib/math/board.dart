import 'dart:math';

import 'package:fifteen/math/constraint.dart';
import 'package:fifteen/math/conv.dart';
import 'package:fifteen/math/coord.dart';
import 'package:fifteen/math/dir_coord.dart';
import 'package:fifteen/math/offsett.dart';
import 'package:fifteen/math/quad.dart';
import 'package:flutter/material.dart';

class Board {
  final List<(int, int)> charts;
  final List<Conv> convs;
  final List<Quad> quads;
  final ConstraintSet constraints;

  Board({
    required this.charts,
    required this.convs,
    required this.quads,
    required this.constraints,
  });

  static Board createNew() {
    return Board(
      charts: [],
      convs: [],
      quads: [],
      constraints: ConstraintSet.createNew(),
    );
  }

  Board add() {
    Random r = Random();
    return Board(
      charts: [...charts, (1, 1)],
      convs: convs,
      quads: [
        ...quads,
        Quad.unit().mult(0.1).add(
              Offset(
                r.nextDouble() * 0.9,
                r.nextDouble() * 0.9,
              ),
            ),
      ],
      constraints: constraints,
    );
  }

  List<Quad> getSubquads() {
    List<Quad> ret = [];
    for (int a = 0; a < charts.length; a++) {
      var (n, m) = charts[a];
      for (int i = 0; i < n; i++) {
        for (int j = 0; j < m; j++) {
          ret.add(quads[a].subquad(i, j, n, m));
        }
      }
    }
    assert(ret.length == countSubquads());
    return ret;
  }

  List<Coord> getEdgeCoords() {
    List<Coord> ret = [];
    var total = 0;
    for (int a = 0; a < charts.length; a++) {
      var (n, m) = charts[a];
      for (int i = 0; i < n; i++) {
        ret.add(Coord(a, Offsett(i * 2 - 1, -1)));
        ret.add(Coord(a, Offsett(i * 2 + 1, 2 * n - 1)));
      }
      for (int j = 0; j < m; j++) {
        ret.add(Coord(a, Offsett(-1, j * 2 + 1)));
        ret.add(Coord(a, Offsett(2 * m - 1, j * 2 - 1)));
      }
      total += 2 * (n + m);
    }
    assert(ret.length == total);
    return ret;
  }

  Offset getVertex(Coord c) {
    Quad quad = quads[c.a];
    var (n, m) = charts[c.a];
    double s = (c.hk.x + 1) / (n) / 2, t = (c.hk.y + 1) / (m) / 2;
    return Offset.lerp(
      Offset.lerp(quad.p1, quad.p2, t)!,
      Offset.lerp(quad.p4, quad.p3, t)!,
      s,
    )!;
  }

  Coord? getCoord(int i) {
    int index = 0;
    for (int a = 0; a < charts.length; a++) {
      int n = charts[a].$1, m = charts[a].$2;
      for (int h = 0; h < n; h++) {
        for (int k = 0; k < m; k++) {
          if (index == i) return Coord(a, Offsett(2 * h, 2 * k));
          index++;
        }
      }
    }
    return null;
  }

  int getIndex(Coord c) {
    int ret = 0;
    for (int a = 0; a < c.a; a++) {
      int n = charts[a].$1, m = charts[a].$2;
      ret += n * m;
    }
    ret += (c.hk.y / 2 + c.hk.x / 2 * charts[c.a].$2).toInt();
    assert(c == getCoord(ret)!);
    return ret;
  }

  int countSubquads() {
    int ret = 0;
    for (int a = 0; a < charts.length; a++) {
      ret += charts[a].$1 * charts[a].$2;
    }
    return ret;
  }

  bool isValid(Coord? c) {
    if (c == null) return false;
    int w = charts[c.a].$1, h = charts[c.a].$2;
    return c.hk.x >= 0 && c.hk.y >= 0 && c.hk.x < 2 * w && c.hk.y < 2 * h;
  }

  DirCoord? step(Coord c, Offsett o) {
    Coord? nc = Coord(c.a, c.hk + o), tmp;
    if (isValid(nc)) return DirCoord(nc, Offsett.up);
    for (Conv conv in [...convs, ...convs.map((conv) => conv.inv())]) {
      tmp = conv.get(nc);
      if (isValid(tmp)) return DirCoord(tmp!, conv.getDir(Offsett.up));
    }
    return null;
  }

  @override
  String toString() {
    return "Board(charts: $charts, convs: $convs, quads: $quads, constraints: $constraints,)";
  }

  Board withoutChart(int a) {
    assert(a >= 0 && a < charts.length);
    return Board(
      charts: charts..removeAt(a),
      quads: quads..removeAt(a),
      convs: convs..removeWhere((conv) => conv.fromA == a || conv.toA == a),
      constraints: constraints.withoutChart(a),
    );
  }

  Board setCoordLocation(Coord c, Offset o) {
    Quad quad = quads[c.a];
    var (n, m) = charts[c.a];
    double x = 0.5 * (c.hk.x + 1) / n, y = 0.5 * (c.hk.y + 1) / m;
    Offset dif = o - getVertex(c);
    Quad newQuad = Quad(
      quad.p1 + dif * (1 - x) * (1 - y),
      quad.p2 + dif * (1 - x) * y,
      quad.p3 + dif * x * y,
      quad.p4 + dif * x * (1 - y),
    );
    return Board(
      charts: charts,
      quads: [
        for (int a = 0; a < quads.length; a++) a == c.a ? newQuad : quads[a]
      ],
      convs: convs,
      constraints: constraints,
    );
  }
}
