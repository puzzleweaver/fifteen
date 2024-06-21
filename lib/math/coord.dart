import 'package:fifteen/math/offsett.dart';

class Coord {
  final int a;
  final Offsett hk;

  Coord(this.a, this.hk);

  bool equals(Coord? other) {
    return a == other?.a && hk.equals(other?.hk);
  }

  @override
  String toString() {
    return "($a, $hk)";
  }
}
