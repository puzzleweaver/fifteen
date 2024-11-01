import 'package:dart_mappable/dart_mappable.dart';
import 'package:fifteen/board/domain/board.dart';
import 'package:fifteen/math/connection.dart';
import 'package:fifteen/board/domain/coord.dart';
import 'package:fifteen/board/domain/double_point.dart';
import 'package:fifteen/board/domain/quad.dart';
import 'package:fifteen/board/domain/side.dart';

part 'constraint.mapper.dart';

@MappableClass()
class ConstraintSet with ConstraintSetMappable {
  final List<CoincidentBoardConstraint> coincidents;
  final List<EquidistantBoardConstraint> equidistants;

  ConstraintSet({
    required this.coincidents,
    required this.equidistants,
  });

  static ConstraintSet createNew() {
    return ConstraintSet(
      coincidents: [],
      equidistants: [],
    );
  }

  static Board boardMoveCoord(
    Board board,
    Coord c,
    DoublePoint to,
  ) {
    Quad quad = board.charts[c.a].quad;
    int n = board.charts[c.a].n, m = board.charts[c.a].m;
    double x = 0.5 * (c.hk.x + 1) / n, y = 0.5 * (c.hk.y + 1) / m;
    DoublePoint dif = to - board.getVertex(c);
    Quad newQuad = Quad(
      quad.p1 + dif * (1 - x) * (1 - y),
      quad.p2 + dif * (1 - x) * y,
      quad.p3 + dif * x * y,
      quad.p4 + dif * x * (1 - y),
    );
    return board.copyWith(
      charts: [
        for (int a = 0; a < board.charts.length; a++)
          a == c.a ? board.charts[a].copyWith(quad: newQuad) : board.charts[a]
      ],
    );
  }

  List<Connection> generateConnections(Board board) {
    List<Connection> ret = [];
    for (int a = 0; a < board.charts.length; a++) {
      for (int b = a + 1; b < board.charts.length; b++) {
        // check for a pair of coincidents linking a and b
        List<Side> links = [];
        for (var coin in coincidents) {
          if (coin.hasA(a) && coin.hasA(b)) {
            links.add(
              Side(coin.coordWithA(a), coin.coordWithA(b)),
            );
          }
        }
        for (int i = 0; i < links.length; i++) {
          for (int j = i + 1; j < links.length; j++) {
            Side s1 = links[i], s2 = links[j];
            // transpose s1 and s2 because FUCK YOU that's why :(
            (s1, s2) = (Side(s1.c1, s2.c1), Side(s1.c2, s2.c2));
            if (_sidePairValid(s1, s2)) {
              Connection result = connectionFromSidePair(s1, s2);
              ret.add(result);
            }
          }
        }
      }
    }
    return ret;
  }

  static Connection connectionFromSidePair(Side s1, Side s2) {
    if (!_sidePairInnerValid(s1, s2)) {
      Side ns1 = Side(s2.c1, s1.c2), ns2 = Side(s1.c1, s2.c2);
      s1 = ns1;
      s2 = ns2;
    }
    var rot =
        (s2.c2.hk - s2.c1.hk).asDir() * (s1.c2.hk - s1.c1.hk).asDir().inv();
    return Connection(
      fromA: s1.c1.a,
      toA: s2.c1.a,
      rot: rot,
      trans: s2.c1.hk - rot * s1.c1.hk,
    );
  }

  static bool _sidePairInnerValid(Side s1, Side s2) {
    return s1.colinear() &&
        s2.colinear() &&
        !s1.sameChart(s2) &&
        s1.len() == s2.len();
  }

  static bool _sidePairValid(Side s1, Side s2) {
    return _sidePairInnerValid(s1, s2) ||
        _sidePairInnerValid(
          Side(s2.c1, s1.c2),
          Side(s1.c1, s2.c2),
        );
  }

  Board solve(Board board) {
    Board ret = board;
    for (int i = 0; i < 10; i++) {
      for (var coin in coincidents) {
        ret = coin.solve(ret);
      }
      for (var eq in equidistants) {
        ret = eq.solve(ret);
      }
    }
    return ret;
  }

  ConstraintSet addCoincident(CoincidentBoardConstraint? coin) {
    if (coin == null) return this;
    List<CoincidentBoardConstraint> newCoincidents = [];
    newCoincidents.add(coin);
    for (var coin in coincidents) {
      bool used = false;
      for (var i = 0; i < newCoincidents.length; i++) {
        var newCoin = newCoincidents[i];
        if (coin.canMergeWith(newCoin)) {
          newCoincidents[i] = newCoin.mergedWith(coin);
          used = true;
          break;
        }
      }
      if (!used) newCoincidents.add(coin);
    }
    return ConstraintSet(
      coincidents: newCoincidents,
      equidistants: equidistants,
    );
  }

  ConstraintSet addEquidistant(EquidistantBoardConstraint? eq) {
    if (eq == null) return this;
    List<EquidistantBoardConstraint> newEquidistants = [];
    newEquidistants.add(eq);
    for (var eq in equidistants) {
      bool used = false;
      for (var i = 0; i < newEquidistants.length; i++) {
        var newEq = newEquidistants[i];
        if (eq.canMergeWith(newEq, this)) {
          newEquidistants[i] = newEq.mergedWith(eq, this);
          used = true;
          break;
        }
      }
      if (!used) newEquidistants.add(eq);
    }
    return ConstraintSet(
      coincidents: coincidents,
      equidistants: newEquidistants,
    );
  }

  CoincidentBoardConstraint getCoincidentWith(Coord c) {
    for (CoincidentBoardConstraint coin in coincidents) {
      if (coin.coords.contains(c)) return coin;
    }
    return CoincidentBoardConstraint(coords: {c});
  }

  bool areCoordsEquivalent(Coord c, Coord d) {
    return getCoincidentWith(c).coords.contains(d);
  }

  bool anyEquivalent(Set<Side> sides, Side s) {
    return sides.any((t) => areSidesEquivalent(s, t));
  }

  bool areSidesEquivalent(Side s, Side t) {
    return areCoordsEquivalent(s.c1, t.c1) && areCoordsEquivalent(s.c2, t.c2) ||
        areCoordsEquivalent(s.c1, t.c2) && areCoordsEquivalent(s.c2, t.c1);
  }
}

@MappableClass()
class CoincidentBoardConstraint with CoincidentBoardConstraintMappable {
  final Set<Coord> coords;

  CoincidentBoardConstraint({Set<Coord>? coords})
      : coords = coords ?? <Coord>{} {
    assert(this.coords.isNotEmpty);
  }

  @MappableConstructor()
  factory CoincidentBoardConstraint.fromList(
          {required List<Coord> coordList}) =>
      CoincidentBoardConstraint(coords: Set.of(coordList));

  List<Coord> get coordList => coords.toList();

  static CoincidentBoardConstraint? createNew(Coord? a, Coord? b) {
    if (a == null || b == null) return null;
    return CoincidentBoardConstraint(coords: {a, b});
  }

  bool canMergeWith(CoincidentBoardConstraint coin) {
    return coords.any((c) => coin.coords.contains(c));
  }

  CoincidentBoardConstraint mergedWith(CoincidentBoardConstraint coin) {
    return CoincidentBoardConstraint(coords: {...coords, ...coin.coords});
  }

  Board solve(Board board) {
    Board ret = board;
    // get the average point
    DoublePoint avg = DoublePoint(0, 0);
    for (var c in coords) {
      avg = avg + ret.getVertex(c);
    }
    avg = avg / coords.length.toDouble();

    for (Coord c in coords) {
      ret = ConstraintSet.boardMoveCoord(ret, c, avg);
    }
    return ret;
  }

  void set(Board board, DoublePoint o) {
    for (Coord c in coords) {
      ConstraintSet.boardMoveCoord(board, c, o);
    }
  }

  CoincidentBoardConstraint add(Coord c) {
    return CoincidentBoardConstraint(coords: {...coords, c});
  }

  bool hasCoord(Coord c) {
    return coords.contains(c);
  }

  bool hasA(int a) {
    return coords.any((c) => c.a == a);
  }

  Coord coordWithA(int a) {
    return coords.firstWhere((c) => c.a == a);
  }
}

@MappableClass()
class EquidistantBoardConstraint with EquidistantBoardConstraintMappable {
  final Set<Side> sides;

  EquidistantBoardConstraint({required this.sides}) {
    assert(sides.isNotEmpty);
  }

  @MappableConstructor()
  factory EquidistantBoardConstraint.fromList({required List<Side> sideList}) =>
      EquidistantBoardConstraint(sides: Set.of(sideList));

  List<Side> get sideList => sides.toList();

  static EquidistantBoardConstraint createNew(Side a, Side b) {
    return EquidistantBoardConstraint(sides: {a, b});
  }

  Board solve(Board board) {
    Board ret = board;
    double avg = 0.0;
    DoublePoint p1, p2, mid, v;
    for (Side s in sides) {
      p1 = ret.getVertex(s.c1);
      p2 = ret.getVertex(s.c2);
      avg += (p1 - p2).distance;
    }
    avg /= sides.length;

    for (Side s in sides) {
      p1 = ret.getVertex(s.c1);
      p2 = ret.getVertex(s.c2);
      mid = (p1 + p2) / 2.0;
      v = p1 - mid;
      v = v * 0.5 * avg / v.distance;
      ret = ConstraintSet.boardMoveCoord(ret, s.c1, mid + v);
      ret = ConstraintSet.boardMoveCoord(ret, s.c2, mid - v);
    }
    return ret;
  }

  bool canMergeWith(EquidistantBoardConstraint eq, ConstraintSet constraints) {
    for (Side s in eq.sides) {
      if (constraints.anyEquivalent(sides, s)) return true;
    }
    return false;
  }

  EquidistantBoardConstraint mergedWith(
    EquidistantBoardConstraint eq,
    ConstraintSet constraints,
  ) {
    Set<Side> nsides = <Side>{};
    for (Side s in sides) {
      if (!constraints.anyEquivalent(nsides, s)) nsides.add(s);
    }
    for (Side s in eq.sides) {
      if (!constraints.anyEquivalent(nsides, s)) nsides.add(s);
    }
    return EquidistantBoardConstraint(sides: nsides);
  }
}
