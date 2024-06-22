import 'dart:math';

import 'package:fifteen/math/coord.dart';

class Side {
  final Coord c1, c2;

  Side(this.c1, this.c2);

  bool colinear() {
    return c1.a == c2.a &&
        (c1.hk.x == c2.hk.x || c1.hk.y == c2.hk.y) &&
        c1.hk != c2.hk;
  }

  bool sameChart(Side s2) {
    return c1.a == s2.c1.a;
  }

  int len() {
    return (c1.hk - c2.hk).taxi();
  }

  Side flip() {
    return Side(c2, c1);
  }

  @override
  int get hashCode => min(
        c1.hashCode * 100 + c2.hashCode,
        c2.hashCode * 100 + c1.hashCode,
      );

  @override
  bool operator ==(Object other) {
    if (other is! Side) return false;
    return c1 == other.c1 && c2 == other.c2 || c2 == other.c1 && c1 == other.c2;
  }

  @override
  String toString() {
    return "Side($c1, $c2,)";
  }
}
