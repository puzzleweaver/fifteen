import 'package:fifteen/math/coord.dart';

class Side {
  final Coord c1, c2;

  Side(this.c1, this.c2);

  bool colinear() {
    return c1.a == c2.a &&
        (c1.hk.x == c2.hk.x || c1.hk.y == c2.hk.y) &&
        !c1.hk.equals(c2.hk);
  }

  bool sameChart(Side s2) {
    return c1.a == s2.c1.a;
  }

  @override
  String toString() {
    return "($c1)--($c2)";
  }

  int len() {
    return c1.hk.sub(c2.hk).taxi();
  }

  Side flip() {
    return Side(c2, c1);
  }
}
