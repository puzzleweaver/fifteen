import 'package:fifteen/math/offsett.dart';

class Coord {
  final int a;
  final Offsett hk;
  final bool isVertex;

  Coord(this.a, this.hk) : isVertex = hk.x % 2 != 0 && hk.y % 2 != 0;

  @override
  int get hashCode => a * 100 + hk.hashCode;

  @override
  bool operator ==(Object other) {
    if (other is! Coord) return false;
    return a == other.a && hk == other.hk;
  }

  @override
  String toString() {
    return "Coord($a, $hk)";
  }
}
