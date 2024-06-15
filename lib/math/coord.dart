import 'package:fifteen/math/offsett.dart';

class Coord {
  final int a;
  final Offsett hk;

  Coord(this.a, this.hk);

  @override
  String toString() {
    return "($a, $hk)";
  }

  bool isEdge() {
    return hk.isEdge();
  }

  Coord getCorner(Offsett dir) {
    return Coord(a, hk.add(Offsett.CORNER.rel(dir)));
  }

  Coord addHalf(Offsett o) {
    return Coord(a, hk.addHalf(o));
  }

  bool isRowLabel() {
    return hk.x % 2 != 0;
  }
}
