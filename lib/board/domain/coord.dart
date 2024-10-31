import 'package:dart_mappable/dart_mappable.dart';
import 'package:fifteen/board/domain/int_point.dart';

part 'coord.mapper.dart';

@MappableClass()
class Coord with CoordMappable {
  final int a;
  final IntPoint hk;

  Coord(this.a, this.hk);

  bool get isVertex => hk.x % 2 != 0 && hk.y % 2 != 0;
  bool get isSpace => hk.x % 2 == 0 && hk.y % 2 == 0;

  static const fromJson = CoordMapper.fromJson;
}
