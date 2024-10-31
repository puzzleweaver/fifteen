import 'package:dart_mappable/dart_mappable.dart';
import 'package:fifteen/board/domain/double_point.dart';
import 'package:fifteen/board/domain/int_point.dart';
import 'package:fifteen/board/domain/quad.dart';

part 'chart.mapper.dart';

@MappableClass()
class Chart with ChartMappable {
  final int n, m; // grid dimensions
  final Quad quad;

  Chart({
    required this.n,
    required this.m,
    required this.quad,
  });

  Iterable<IntPoint> get coords => [
        for (int i = 0; i < n; i++)
          for (int j = 0; j < m; j++) IntPoint.createSpace(i, j),
      ];

  Iterable<IntPoint> get edgeCoords => [
        for (int i = 0; i < n; i++) ...[
          IntPoint(i * 2 - 1, -1),
          IntPoint(i * 2 + 1, 2 * m - 1),
        ],
        for (int j = 0; j < m; j++) ...[
          IntPoint(-1, j * 2 + 1),
          IntPoint(2 * n - 1, j * 2 - 1),
        ],
      ];

  Quad getSubquad(IntPoint hk) => _subquad(hk.x ~/ 2, hk.y ~/ 2);

  Quad _subquad(int i, int j) => quad.subquad(
        1.0 * i / n,
        1.0 * j / m,
        1.0 * (i + 1) / n,
        1.0 * (j + 1) / m,
      );

  Iterable<Quad> get subquads => coords.map(
        (coord) => getSubquad(coord),
      );

  DoublePoint getVertex(IntPoint hk) => quad.interiorLerp(
        (hk.x / 2 + 0.5) / n,
        (hk.y / 2 + 0.5) / m,
      );

  bool isValid(IntPoint hk) =>
      hk.x >= 0 && hk.x / 2 < n && hk.y >= 0 && hk.y / 2 < m;
}
