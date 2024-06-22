import 'package:fifteen/math/coord.dart';
import 'package:fifteen/math/offsett.dart';
import 'package:fifteen/math/side.dart';

class Conv {
  final int fromA, toA;
  final Offsett _rot;
  final Offsett _trans;

  Conv({
    required this.fromA,
    required this.toA,
    required Offsett rot,
    required Offsett trans,
  })  : _rot = rot,
        _trans = trans;

  Coord? get(Coord? c) {
    if (c == null || c.a != fromA) return null;
    return Coord(toA, c.hk * _rot + _trans);
  }

  Conv inv() {
    Offsett newRot = _rot.inv();
    return Conv(
      fromA: toA,
      toA: fromA,
      rot: newRot,
      trans: -_trans * newRot,
    );
  }

  Offsett getDir(Offsett o) {
    return o * _rot;
  }

  Side? gettt(Side side) {
    Coord? nc1 = get(side.c1), nc2 = get(side.c2);
    if (nc1 != null || nc2 != null) {
      return Side(nc1!, nc2!);
    } else {
      return null;
    }
  }

  @override
  String toString() {
    return "Conv(fromA: $fromA, toA: $toA, rot: $_rot, trans: $_trans,)";
  }
}
