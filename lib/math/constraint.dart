import 'package:fifteen/math/board.dart';
import 'package:fifteen/math/conv.dart';
import 'package:fifteen/math/coord.dart';
import 'package:fifteen/math/side.dart';
import 'package:flutter/material.dart';

class ConstraintSet {
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

  List<Conv> generateConvs(Board board) {
    List<Conv> ret = [];
    for (int a = 0; a < board.charts.length; a++) {
      for (int b = a + 1; b < board.charts.length; b++) {
        // check for a pair of coincidents linking a and b
        Side? s1, s2;
        for (var coin in coincidents) {
          if (coin.hasA(a) && coin.hasA(b)) {
            print("Got Here 1.");
            if (s1 == null) {
              s1 = Side(coin.coordWithA(a), coin.coordWithA(b));
            } else if (s2 == null) {
              s2 = Side(coin.coordWithA(a), coin.coordWithA(b));
              break;
            }
          }
        }
        print("Got Here 2. $s1, $s2");
        if (s1 != null && s2 != null) {
          // transpose s1 and s2 because FUCK YOU that's why :(
          (s1, s2) = (Side(s1.c1, s2.c1), Side(s1.c2, s2.c2));
          print("Got Here 3. $s1, $s2");
          if (_sidePairValid(s1, s2)) {
            print("Got Here 4. $s1, $s2");
            Conv result = convFromSidePair(s1, s2);
            print("Conv Added! $result");
            ret.add(result);
          }
        }
        print("Got Here 5");
      }
    }
    return ret;
  }

  static Conv convFromSidePair(Side s1, Side s2) {
    print("FromSidePair entered.");
    if (!_sidePairInnerValid(s1, s2)) {
      Side ns1 = Side(s2.c1, s1.c2), ns2 = Side(s1.c1, s2.c2);
      s1 = ns1;
      s2 = ns2;
    }
    var rot =
        (s2.c2.hk - s2.c1.hk).asDir() * (s1.c2.hk - s1.c1.hk).asDir().inv();
    print("Rot is $rot");
    return Conv(
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
    print("Coincidents: $coincidents");
    print("Equidistants: $equidistants");
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

  ConstraintSet withoutChart(int a) {
    ConstraintSet ret = createNew();
    for (var coin in coincidents) {
      var ncoin = coin.without(a);
      if (ncoin != null && ncoin.coords.isNotEmpty) ret.addCoincident(ncoin);
    }
    for (var eq in equidistants) {
      var neq = eq.without(a);
      if (neq != null && neq.sides.isNotEmpty) ret.addEquidistant(neq);
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

  @override
  String toString() {
    return "ConstraintSet(coincidents: $coincidents, equidistants: $equidistants,)";
  }
}

class CoincidentBoardConstraint {
  final Set<Coord> coords;

  CoincidentBoardConstraint({Set<Coord>? coords})
      : coords = coords ?? <Coord>{} {
    assert(this.coords.isNotEmpty);
  }

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
    Offset avg = Offset(0, 0);
    for (var c in coords) {
      avg = avg + ret.getVertex(c);
    }
    avg = avg / coords.length.toDouble();

    for (Coord c in coords) {
      ret = ret.setCoordLocation(c, avg);
    }
    return ret;
  }

  void set(Board board, Offset o) {
    for (Coord c in coords) {
      board.setCoordLocation(c, o);
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

  CoincidentBoardConstraint? without(int a) {
    var ncoords = coords.where((c) => c.a != a).toSet();
    if (ncoords.isEmpty) return null;
    return CoincidentBoardConstraint(coords: ncoords);
  }

  @override
  String toString() {
    return "Coincident(coords: $coords)";
  }

  Coord coordWithA(int a) {
    return coords.firstWhere((c) => c.a == a);
  }
}

class EquidistantBoardConstraint {
  final Set<Side> sides;

  EquidistantBoardConstraint({required this.sides}) {
    assert(sides.isNotEmpty);
  }

  static EquidistantBoardConstraint createNew(Side a, Side b) {
    return EquidistantBoardConstraint(sides: {a, b});
  }

  EquidistantBoardConstraint? without(int a) {
    var nsides = sides;
    if (nsides.isEmpty) return null;
    return EquidistantBoardConstraint(
      sides: nsides,
    );
  }

  Board solve(Board board) {
    Board ret = board;
    double avg = 0.0;
    Offset p1, p2, mid, v;
    for (Side s in sides) {
      p1 = ret.getVertex(s.c1);
      p2 = ret.getVertex(s.c2);
      avg += (p1 - p2).distance;
    }
    avg /= sides.length;

    for (Side s in sides) {
      p1 = ret.getVertex(s.c1);
      p2 = ret.getVertex(s.c2);
      mid = (p1 + p2) / 2;
      v = p1 - mid;
      v = v * 0.5 * avg / v.distance;
      ret = ret.setCoordLocation(s.c1, mid + v);
      ret = ret.setCoordLocation(s.c2, mid - v);
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

  @override
  String toString() {
    return "Equidistant(sides: $sides)";
  }
}
