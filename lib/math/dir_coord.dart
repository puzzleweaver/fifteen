import 'package:fifteen/math/coord.dart';
import 'package:fifteen/math/offsett.dart';

class DirCoord {
  final Coord coord;
  final Offsett dir;

  DirCoord(this.coord, this.dir);

  Offsett rel(Offsett offset) {
    return offset * dir;
  }

  DirCoord rell(DirCoord prev) {
    return DirCoord(coord, dir * prev.dir);
  }

  @override
  String toString() {
    return "DirCoord($coord, $dir),";
  }
}
