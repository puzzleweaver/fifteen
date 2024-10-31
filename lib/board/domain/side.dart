import 'dart:math';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:fifteen/board/domain/coord.dart';

part 'side.mapper.dart';

@MappableClass()
class Side with SideMappable {
  final Coord c1, c2;

  Side(this.c1, this.c2);

  Side.fromPair((Coord, Coord) pair)
      : c1 = pair.$1,
        c2 = pair.$2;

  bool colinear() {
    return c1.a == c2.a &&
        (c1.hk.x == c2.hk.x || c1.hk.y == c2.hk.y) &&
        c1.hk != c2.hk;
  }

  bool sameChart(Side s2) {
    return c1.a == s2.c1.a;
  }

  int len() {
    return (c1.hk - c2.hk).taxi;
  }

  Side flip() {
    return Side(c2, c1);
  }

  @override
  int get hashCode => min(
        Object.hash(c1, c2),
        Object.hash(c2, c1),
      );

  @override
  bool operator ==(Object other) {
    if (other is! Side) return false;
    return c1 == other.c1 && c2 == other.c2 || c2 == other.c1 && c1 == other.c2;
  }
}
