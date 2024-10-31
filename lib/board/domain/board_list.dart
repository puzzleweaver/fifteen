import 'package:fifteen/board/domain/board.dart';
import 'package:fifteen/board/domain/chart.dart';
import 'package:fifteen/board/domain/double_point.dart';
import 'package:fifteen/board/domain/quad.dart';
import 'package:fifteen/math/constraint.dart';
import 'package:uuid/uuid.dart';

class BoardList {
  static Board _createRect(int n, int m, {String? uuid}) {
    return Board(
      id: uuid ?? const Uuid().v1(),
      charts: [
        Chart(
          n: n,
          m: m,
          quad: Quad(
            DoublePoint(0.04545, 0.04545),
            DoublePoint(0.04545, 0.95454),
            DoublePoint(0.95454, 0.95454),
            DoublePoint(0.95454, 0.04545),
          ),
        )
      ],
      connections: [],
      constraints: ConstraintSet.createNew(),
    );
  }

  static final List<Board> all = [
    _createRect(4, 4),
  ];

  // ignore: unused_field
  static final Board _codeCollapseExample = () {
    return Board.createNew();
  }();
}
