import 'package:fifteen/math/coord.dart';
import 'package:fifteen/math/int_point.dart';

class DirCoord {
  final Coord coord;
  final IntPoint dir;

  DirCoord(this.coord, this.dir);

  IntPoint rel(IntPoint offset) {
    return offset * dir;
  }

  DirCoord rell(DirCoord prev) {
    return DirCoord(coord, dir * prev.dir);
  }

  @override
  String toString() {
    return "DirCoord($coord, $dir)";
  }
}
