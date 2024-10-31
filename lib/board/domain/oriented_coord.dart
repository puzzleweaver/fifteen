import 'package:fifteen/board/domain/int_point.dart';
import 'package:fifteen/board/domain/coord.dart';

class OrientedCoord {
  final Coord coord;
  final IntPoint dir;

  OrientedCoord(this.coord, this.dir);

  @override
  String toString() {
    return "OrientedCoord($coord, $dir)";
  }

  @override
  bool operator ==(Object other) {
    if (other is! OrientedCoord) return false;
    return other.coord == coord && other.dir == dir;
  }

  OrientedCoord operator *(IntPoint other) {
    return OrientedCoord(coord, dir * other);
  }

  @override
  int get hashCode => Object.hash(coord, dir);
}
