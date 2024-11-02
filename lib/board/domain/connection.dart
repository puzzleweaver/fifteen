import 'package:dart_mappable/dart_mappable.dart';
import 'package:fifteen/board/domain/coord.dart';
import 'package:fifteen/board/domain/int_point.dart';
import 'package:fifteen/board/domain/side.dart';

part 'connection.mapper.dart';

@MappableClass()
class Connection with ConnectionMappable {
  final int fromA, toA;
  final IntPoint _rot;
  final IntPoint _trans;

  Connection({
    required this.fromA,
    required this.toA,
    required IntPoint rot,
    required IntPoint trans,
  })  : _rot = rot,
        _trans = trans;

  Coord? get(Coord? c) {
    if (c == null || c.a != fromA) return null;
    return Coord(toA, c.hk * _rot + _trans);
  }

  Connection inv() {
    IntPoint newRot = _rot.inv();
    return Connection(
      fromA: toA,
      toA: fromA,
      rot: newRot,
      trans: -_trans * newRot,
    );
  }

  IntPoint getDir(IntPoint o) {
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
}
