import 'package:fifteen/math/int_point.dart';

class Coord {
  final int a;
  final IntPoint hk;
  final bool isVertex;

  Coord(this.a, this.hk) : isVertex = hk.x % 2 != 0 && hk.y % 2 != 0;

  @override
  int get hashCode => Object.hash(a, hk);

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
