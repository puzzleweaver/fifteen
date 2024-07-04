import 'package:fifteen/math/constraint.dart';
import 'package:fifteen/math/conv.dart';
import 'package:fifteen/math/coord.dart';
import 'package:fifteen/math/dir_coord.dart';
import 'package:fifteen/math/double_point.dart';
import 'package:fifteen/math/int_point.dart';
import 'package:fifteen/math/quad.dart';
import 'package:uuid/uuid.dart';

class Board {
  final String uuid;
  final List<(int, int)> charts;
  final List<Conv> convs;
  final List<Quad> quads;
  final ConstraintSet constraints;

  Board({
    required this.uuid,
    required this.charts,
    required this.convs,
    required this.quads,
    required this.constraints,
  });

  Board copyWith({
    String? uuid,
    List<(int, int)>? charts,
    List<Conv>? convs,
    List<Quad>? quads,
    ConstraintSet? constraints,
  }) {
    return Board(
      uuid: uuid ?? this.uuid,
      charts: charts ?? this.charts,
      convs: convs ?? this.convs,
      quads: quads ?? this.quads,
      constraints: constraints ?? this.constraints,
    );
  }

  static Board createNew() {
    return Board(
      uuid: Uuid().v1(),
      charts: [],
      convs: [],
      quads: [],
      constraints: ConstraintSet.createNew(),
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
        ret.add(Coord(a, IntPoint(i * 2 - 1, -1)));
        ret.add(Coord(a, IntPoint(i * 2 + 1, 2 * m - 1)));
      }
      for (int j = 0; j < m; j++) {
        ret.add(Coord(a, IntPoint(-1, j * 2 + 1)));
        ret.add(Coord(a, IntPoint(2 * n - 1, j * 2 - 1)));
      }
      total += 2 * (n + m);
    }
    assert(ret.length == total);
    return ret;
  }

  DoublePoint getVertex(Coord c) {
    Quad quad = quads[c.a];
    var (n, m) = charts[c.a];
    double s = (c.hk.x + 1) / (n) / 2, t = (c.hk.y + 1) / (m) / 2;
    return DoublePoint.lerp(
      DoublePoint.lerp(quad.p1, quad.p2, t),
      DoublePoint.lerp(quad.p4, quad.p3, t),
      s,
    );
  }

  Coord? getCoord(int i) {
    int index = 0;
    for (int a = 0; a < charts.length; a++) {
      int n = charts[a].$1, m = charts[a].$2;
      for (int h = 0; h < n; h++) {
        for (int k = 0; k < m; k++) {
          if (index == i) return Coord(a, IntPoint(2 * h, 2 * k));
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

  bool _isValid(Coord? c) {
    if (c == null) return false;
    int w = charts[c.a].$1, h = charts[c.a].$2;
    return c.hk.x >= 0 && c.hk.y >= 0 && c.hk.x < 2 * w && c.hk.y < 2 * h;
  }

  DirCoord? step(Coord c, IntPoint o) {
    Coord? nc = Coord(c.a, c.hk + o), tmp;
    if (_isValid(nc)) return DirCoord(nc, IntPoint.up);
    for (Conv conv in [...convs, ...convs.map((conv) => conv.inv())]) {
      tmp = conv.get(nc);
      if (_isValid(tmp)) return DirCoord(tmp!, conv.getDir(IntPoint.up));
    }
    return null;
  }

  @override
  String toString() {
    return "Board(uuid: '$uuid', charts: $charts, convs: $convs, quads: $quads, constraints: $constraints,)";
  }
}
