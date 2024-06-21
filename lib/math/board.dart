import 'dart:math';

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

  Board({required this.charts, required this.convs, required this.quads});

  static Board createNew() {
    return Board(
      charts: [],
      convs: [],
      quads: [],
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

  List<Offset> getVertices() {
    List<Offset> ret = [];
    var total = 0;
    for (int a = 0; a < charts.length; a++) {
      var (n, m) = charts[a];
      for (int i = 0; i < n; i++) {
        double s = i / n;
        ret.add(Offset.lerp(quads[a].p1, quads[a].p2, s)!);
        ret.add(Offset.lerp(quads[a].p3, quads[a].p4, s)!);
      }
      for (int j = 0; j < m; j++) {
        double s = j / m;
        ret.add(Offset.lerp(quads[a].p2, quads[a].p3, s)!);
        ret.add(Offset.lerp(quads[a].p4, quads[a].p1, s)!);
      }
      total += 2 * (n + m);
    }
    assert(ret.length == total);
    return ret;
  }

  Coord? getCoord(int i) {
    int index = 0;
    for (int a = 0; a < charts.length; a++) {
      int n = charts[a].$1, m = charts[a].$2;
      for (int h = 0; h < n; h++) {
        for (int k = 0; k < m; k++) {
          if (index == i) return Coord(a, Offsett(h, k));
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
    ret += (c.hk.y + c.hk.x * charts[c.a].$2).toInt();
    assert(c.equals(getCoord(ret)!));
    return ret;
  }

  int countSubquads() {
    int ret = 0;
    for (int a = 0; a < charts.length; a++) {
      ret += charts[a].$1 * charts[a].$2;
    }
    return ret;
  }

  static Board test() {
    return Board(
      charts: [(2, 2), (2, 2), (2, 2)],
      convs: [
        Conv(fromA: 0, toA: 1, trans: Offsett(0, -2), rot: Offsett.up),
        Conv(fromA: 0, toA: 2, trans: Offsett(-2, 0), rot: Offsett.up),
        Conv(fromA: 1, toA: 2, trans: Offsett(0, 3), rot: Offsett.right),
      ],
      quads: [
        Quad(
          Offset(-0.8426729364919308, -0.5664551916030472),
          Offset(-0.05897370410395686, -1),
          Offset(-0.01268553244599202, 0.0005059164077277634),
          Offset(-0.8680440013839179, 0.3481024287495134),
        ).mult(0.5).add(Offset(0.5, 0.5)),
        Quad(
          Offset(-0.05897370410395686, -1),
          Offset(0.8680440013839185, -0.5155889979320708),
          Offset(0.8173018715999445, 0.5176564076527692),
          Offset(-0.01268553244599202, 0.0005059164077278466),
        ).mult(0.5).add(Offset(0.5, 0.5)),
        Quad(
          Offset(-0.8680440013839179, 0.34810242874951347),
          Offset(-0.01268553244599202, 0.0005059164077278466),
          Offset(0.8173018715999444, 0.5176564076527692),
          Offset(-0.012685532445992576, 0.9999999999999999),
        ).mult(0.5).add(Offset(0.5, 0.5)),
      ],
    );
  }

  static Board test2() {
    return Board.createNew();
  }

  static Board rect(int n, int m) {
    return Board(
      charts: [(n, m)],
      convs: [],
      quads: [
        Quad(
          Offset(0.0, 0.0),
          Offset(1.0, 0.0),
          Offset(1.0, 1.0),
          Offset(0.0, 1.0),
        ),
      ],
    );
  }

  bool isValid(Coord? c) {
    if (c == null) return false;
    int w = charts[c.a].$1, h = charts[c.a].$2;
    return c.hk.x >= 0 && c.hk.y >= 0 && c.hk.x < w && c.hk.y < h;
  }

  DirCoord? simpleTransform(Coord c, Offsett o) {
    Coord? nc = Coord(c.a, c.hk.add(o)), tmp;
    if (isValid(nc)) return DirCoord(nc, Offsett.up);
    for (Conv conv in [...convs, ...convs.map((conv) => conv.inv())]) {
      tmp = conv.get(nc);
      if (isValid(tmp)) return DirCoord(tmp!, conv.getDir(Offsett.up));
    }
    return null;
  }

  @override
  String toString() {
    return "Board(charts: $charts, convs: $convs, quads: $quads)";
  }
}
