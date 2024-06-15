import 'package:fifteen/math/coord.dart';
import 'package:fifteen/math/offsett.dart';
import 'package:fifteen/math/side.dart';

class Conv {
  final int fromA, toA;
  final Offsett _rot;
  final Offsett _trans;

  Conv(this.fromA, this.toA, this._rot, this._trans);

  static bool _innerValid(Side s1, Side s2) {
    return s1.colinear() &&
        s2.colinear() &&
        !s1.sameChart(s2) &&
        s1.len() == s2.len();
  }

  bool valid(Side s1, Side s2) {
    return _innerValid(s1, s2) ||
        _innerValid(Side(s2.c1, s1.c2), Side(s1.c1, s2.c2));
  }

  Coord? get(Coord c) {
    if (c.a != fromA) {
      return null;
    } else {
      return Coord(toA, c.hk.rel(_rot).add(_trans));
    }
  }

  Conv inv() {
    return Conv(toA, fromA, _rot.inv(), _trans.neg().invrel(_rot));
  }

  Offsett gett(Offsett o) {
    return o.rel(_rot);
  }

  Side? gettt(Side side) {
    Coord? nc1 = get(side.c1), nc2 = get(side.c2);
    if (nc1 != null || nc2 != null) {
      return Side(nc1!, nc2!);
    } else {
      return null;
    }
  }
}
