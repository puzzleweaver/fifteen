import 'package:dart_mappable/dart_mappable.dart';
import 'package:fifteen/board/domain/chart.dart';
import 'package:fifteen/board/domain/coord.dart';
import 'package:fifteen/board/domain/oriented_coord.dart';
import 'package:fifteen/board/domain/constraint.dart';
import 'package:fifteen/board/domain/connection.dart';
import 'package:fifteen/board/domain/double_point.dart';
import 'package:fifteen/board/domain/int_point.dart';
import 'package:fifteen/board/domain/quad.dart';
import 'package:uuid/uuid.dart';

part 'board.mapper.dart';

@MappableClass()
class Board with BoardMappable {
  final String id;
  final String name;
  final List<Chart> charts;
  final List<Connection> connections;
  final ConstraintSet constraints;

  Board({
    required this.id,
    required this.name,
    required this.charts,
    required this.connections,
    required this.constraints,
  });

  static Board createNew() {
    return Board(
      id: const Uuid().v1(),
      name: "NO NAME ENTERED",
      charts: [],
      connections: [],
      constraints: ConstraintSet.createNew(),
    );
  }

  List<Coord> get coords => [
        for (int a = 0; a < charts.length; a++)
          ...charts[a].coords.map(
                (hk) => Coord(a, hk),
              ),
      ];

  Quad getQuad(Coord c) => charts[c.a].getSubquad(c.hk);

  List<Quad> get subquads => [
        for (int a = 0; a < charts.length; a++) ...charts[a].subquads,
      ];

  Iterable<Coord> get edgeCoords => [
        for (int a = 0; a < charts.length; a++)
          ...charts[a].edgeCoords.map((hk) => Coord(a, hk)),
      ];

  DoublePoint getVertex(Coord c) => charts[c.a].getVertex(c.hk);

  Coord? getCoord(int i) {
    int index = 0;
    for (int a = 0; a < charts.length; a++) {
      for (IntPoint hk in charts[a].coords) {
        if (index == i) {
          return Coord(a, hk);
        }
        index++;
      }
    }
    return null;
  }

  int getIndex(Coord c) {
    int ret = 0;
    for (int a = 0; a < c.a; a++) {
      int n = charts[a].n, m = charts[a].m;
      ret += n * m;
    }
    ret += (c.hk.y / 2 + c.hk.x / 2 * charts[c.a].m).toInt();
    assert(c == getCoord(ret)!);
    return ret;
  }

  bool isValid(Coord? c) {
    if (c == null) return false;
    return charts[c.a].isValid(c.hk);
  }

  OrientedCoord? step(Coord c, IntPoint o) {
    Coord? nc = Coord(c.a, c.hk + o), tmp;
    if (isValid(nc)) return OrientedCoord(nc, IntPoint.up);
    for (Connection conv in [
      ...connections,
      ...connections.map((conv) => conv.inv())
    ]) {
      tmp = conv.get(nc);
      if (isValid(tmp)) return OrientedCoord(tmp!, conv.getDir(IntPoint.up));
    }
    return null;
  }

  static const fromJson = BoardMapper.fromJson;
}
