import 'package:fifteen/math/board.dart';
import 'package:fifteen/math/constraint.dart';
import 'package:fifteen/math/conv.dart';
import 'package:fifteen/math/coord.dart';
import 'package:fifteen/math/double_point.dart';
import 'package:fifteen/math/int_point.dart';
import 'package:fifteen/math/quad.dart';
import 'package:fifteen/math/side.dart';

class BoardList {
  static Board _createRect(int n, int m) {
    return Board(
      charts: [(n, m)],
      convs: [],
      quads: [
        Quad(
          DoublePoint(0.04545, 0.04545),
          DoublePoint(0.95454, 0.04545),
          DoublePoint(0.95454, 0.95454),
          DoublePoint(0.04545, 0.95454),
        ),
      ],
      constraints: ConstraintSet.createNew(),
    );
  }

  static final List<Board> all = [
    ...[classic3, classic4], // classics
    ...[eye1, eye2, eye4, eyes2], // eyes
    ...[star4, star5, star6, star66], // stars
    ...[starbox3, starbox4], // starboxes
    ...[cube3, cube2, cube15], // cubes
    ...[bowtie, paths4, split4, triangles3], // misc & testing
  ];

  // ignore: unused_field
  static final Board _codeCollapseExample = () {
    return Board.createNew();
  }();

  static final Board classic3 = _createRect(3, 3);
  static final Board classic4 = _createRect(4, 4);
  static final Board cube3 = () {
    return Board(
      charts: [
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1)
      ],
      convs: [
        Conv(
          fromA: 0,
          toA: 5,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, 2),
        ),
        Conv(
          fromA: 0,
          toA: 7,
          rot: IntPoint(0, 2),
          trans: IntPoint(-2, 0),
        ),
        Conv(
          fromA: 1,
          toA: 2,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, -2),
        ),
        Conv(
          fromA: 1,
          toA: 6,
          rot: IntPoint(-2, 0),
          trans: IntPoint(0, 2),
        ),
        Conv(
          fromA: 1,
          toA: 8,
          rot: IntPoint(0, 2),
          trans: IntPoint(-2, 0),
        ),
        Conv(
          fromA: 2,
          toA: 7,
          rot: IntPoint(0, 2),
          trans: IntPoint(2, 0),
        ),
        Conv(
          fromA: 2,
          toA: 8,
          rot: IntPoint(2, 0),
          trans: IntPoint(0, 2),
        ),
        Conv(
          fromA: 3,
          toA: 4,
          rot: IntPoint(-2, 0),
          trans: IntPoint(-2, 0),
        ),
        Conv(
          fromA: 3,
          toA: 5,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, -2),
        ),
        Conv(
          fromA: 3,
          toA: 6,
          rot: IntPoint(0, 2),
          trans: IntPoint(-2, 0),
        ),
        Conv(
          fromA: 4,
          toA: 6,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, -2),
        ),
        Conv(
          fromA: 5,
          toA: 7,
          rot: IntPoint(-2, 0),
          trans: IntPoint(0, -2),
        )
      ],
      quads: [
        Quad(
          DoublePoint(0.0501, 0.571),
          DoublePoint(0.0501, 0.831),
          DoublePoint(0.275, 0.961),
          DoublePoint(0.275, 0.701),
        ),
        Quad(
          DoublePoint(0.725, 0.442),
          DoublePoint(0.500, 0.571),
          DoublePoint(0.725, 0.701),
          DoublePoint(0.950, 0.571),
        ),
        Quad(
          DoublePoint(0.500, 0.571),
          DoublePoint(0.500, 0.831),
          DoublePoint(0.725, 0.961),
          DoublePoint(0.725, 0.701),
        ),
        Quad(
          DoublePoint(0.275, 0.182),
          DoublePoint(0.275, 0.442),
          DoublePoint(0.500, 0.571),
          DoublePoint(0.500, 0.312),
        ),
        Quad(
          DoublePoint(0.275, 0.182),
          DoublePoint(0.500, 0.312),
          DoublePoint(0.725, 0.182),
          DoublePoint(0.500, 0.0519),
        ),
        Quad(
          DoublePoint(0.275, 0.442),
          DoublePoint(0.0501, 0.571),
          DoublePoint(0.275, 0.701),
          DoublePoint(0.500, 0.571),
        ),
        Quad(
          DoublePoint(0.500, 0.312),
          DoublePoint(0.500, 0.571),
          DoublePoint(0.725, 0.442),
          DoublePoint(0.725, 0.182),
        ),
        Quad(
          DoublePoint(0.275, 0.701),
          DoublePoint(0.275, 0.961),
          DoublePoint(0.500, 0.831),
          DoublePoint(0.500, 0.571),
        ),
        Quad(
          DoublePoint(0.950, 0.571),
          DoublePoint(0.725, 0.701),
          DoublePoint(0.725, 0.961),
          DoublePoint(0.950, 0.831),
        )
      ],
      constraints: ConstraintSet(
        coincidents: [
          CoincidentBoardConstraint(
            coords: {Coord(1, IntPoint(-1, -1)), Coord(6, IntPoint(1, 1))},
          ),
          CoincidentBoardConstraint(
            coords: {Coord(7, IntPoint(1, 1)), Coord(2, IntPoint(-1, 1))},
          ),
          CoincidentBoardConstraint(
            coords: {Coord(3, IntPoint(-1, 1)), Coord(5, IntPoint(-1, -1))},
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(3, IntPoint(1, 1)),
              Coord(1, IntPoint(-1, 1)),
              Coord(5, IntPoint(1, -1)),
              Coord(7, IntPoint(1, -1)),
              Coord(2, IntPoint(-1, -1)),
              Coord(6, IntPoint(-1, 1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {Coord(4, IntPoint(-1, -1)), Coord(3, IntPoint(-1, -1))},
          ),
          CoincidentBoardConstraint(
            coords: {Coord(6, IntPoint(1, -1)), Coord(4, IntPoint(1, 1))},
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(3, IntPoint(1, -1)),
              Coord(6, IntPoint(-1, -1)),
              Coord(4, IntPoint(-1, 1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {Coord(7, IntPoint(-1, 1)), Coord(0, IntPoint(1, 1))},
          ),
          CoincidentBoardConstraint(
            coords: {Coord(5, IntPoint(-1, 1)), Coord(0, IntPoint(-1, -1))},
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(5, IntPoint(1, 1)),
              Coord(0, IntPoint(1, -1)),
              Coord(7, IntPoint(-1, -1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {Coord(2, IntPoint(1, 1)), Coord(8, IntPoint(1, 1))},
          ),
          CoincidentBoardConstraint(
            coords: {Coord(1, IntPoint(1, -1)), Coord(8, IntPoint(-1, -1))},
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(1, IntPoint(1, 1)),
              Coord(8, IntPoint(-1, 1)),
              Coord(2, IntPoint(1, -1))
            },
          )
        ],
        equidistants: [
          EquidistantBoardConstraint(
            sides: {
              Side(
                Coord(0, IntPoint(1, -1)),
                Coord(0, IntPoint(-1, 1)),
              ),
              Side(
                Coord(2, IntPoint(-1, 1)),
                Coord(1, IntPoint(-1, 1)),
              ),
              Side(
                Coord(2, IntPoint(1, 1)),
                Coord(2, IntPoint(-1, 1)),
              ),
              Side(
                Coord(8, IntPoint(1, -1)),
                Coord(1, IntPoint(1, 1)),
              ),
              Side(
                Coord(2, IntPoint(-1, 1)),
                Coord(1, IntPoint(1, 1)),
              ),
              Side(
                Coord(1, IntPoint(-1, -1)),
                Coord(1, IntPoint(1, 1)),
              ),
              Side(
                Coord(3, IntPoint(1, -1)),
                Coord(1, IntPoint(-1, -1)),
              ),
              Side(
                Coord(4, IntPoint(1, -1)),
                Coord(3, IntPoint(1, -1)),
              ),
              Side(
                Coord(3, IntPoint(-1, 1)),
                Coord(3, IntPoint(1, -1)),
              ),
              Side(
                Coord(0, IntPoint(1, -1)),
                Coord(3, IntPoint(-1, 1)),
              ),
              Side(
                Coord(2, IntPoint(-1, 1)),
                Coord(0, IntPoint(1, -1)),
              ),
              Side(
                Coord(1, IntPoint(1, 1)),
                Coord(1, IntPoint(1, -1)),
              ),
              Side(
                Coord(0, IntPoint(-1, -1)),
                Coord(3, IntPoint(-1, 1)),
              ),
              Side(
                Coord(0, IntPoint(1, -1)),
                Coord(0, IntPoint(-1, -1)),
              ),
              Side(
                Coord(0, IntPoint(1, 1)),
                Coord(0, IntPoint(1, -1)),
              ),
              Side(
                Coord(0, IntPoint(1, -1)),
                Coord(1, IntPoint(-1, 1)),
              ),
              Side(
                Coord(3, IntPoint(-1, 1)),
                Coord(1, IntPoint(-1, 1)),
              ),
              Side(
                Coord(1, IntPoint(-1, 1)),
                Coord(3, IntPoint(1, -1)),
              ),
              Side(
                Coord(3, IntPoint(1, -1)),
                Coord(4, IntPoint(1, 1)),
              ),
              Side(
                Coord(3, IntPoint(-1, -1)),
                Coord(3, IntPoint(1, -1)),
              ),
              Side(
                Coord(4, IntPoint(1, -1)),
                Coord(3, IntPoint(-1, -1)),
              ),
              Side(
                Coord(1, IntPoint(-1, -1)),
                Coord(1, IntPoint(-1, 1)),
              ),
              Side(
                Coord(1, IntPoint(1, 1)),
                Coord(1, IntPoint(-1, 1)),
              ),
              Side(
                Coord(2, IntPoint(1, 1)),
                Coord(1, IntPoint(1, 1)),
              ),
              Side(
                Coord(0, IntPoint(-1, 1)),
                Coord(0, IntPoint(-1, -1)),
              ),
              Side(
                Coord(0, IntPoint(1, 1)),
                Coord(0, IntPoint(-1, 1)),
              ),
              Side(
                Coord(2, IntPoint(-1, 1)),
                Coord(0, IntPoint(1, 1)),
              ),
              Side(
                Coord(8, IntPoint(1, -1)),
                Coord(2, IntPoint(1, 1)),
              ),
              Side(
                Coord(1, IntPoint(1, -1)),
                Coord(8, IntPoint(1, -1)),
              ),
              Side(
                Coord(1, IntPoint(-1, -1)),
                Coord(1, IntPoint(1, -1)),
              ),
              Side(
                Coord(4, IntPoint(1, 1)),
                Coord(1, IntPoint(-1, -1)),
              ),
              Side(
                Coord(4, IntPoint(1, -1)),
                Coord(4, IntPoint(1, 1)),
              ),
              Side(
                Coord(3, IntPoint(-1, 1)),
                Coord(3, IntPoint(-1, -1)),
              )
            },
          )
        ],
      ),
    );
  }();
  static final Board cube2 = () {
    return Board(
      charts: [(2, 2), (2, 2), (2, 2)],
      convs: [
        Conv(
          fromA: 0,
          toA: 1,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, 4),
        ),
        Conv(
          fromA: 0,
          toA: 2,
          rot: IntPoint(0, 2),
          trans: IntPoint(-4, 0),
        ),
        Conv(
          fromA: 1,
          toA: 2,
          rot: IntPoint(-2, 0),
          trans: IntPoint(2, -4),
        )
      ],
      quads: [
        Quad(
          DoublePoint(0.106, 0.273),
          DoublePoint(0.106, 0.727),
          DoublePoint(0.500, 0.955),
          DoublePoint(0.500, 0.500),
        ),
        Quad(
          DoublePoint(0.500, 0.0455),
          DoublePoint(0.106, 0.273),
          DoublePoint(0.500, 0.500),
          DoublePoint(0.894, 0.273),
        ),
        Quad(
          DoublePoint(0.500, 0.500),
          DoublePoint(0.500, 0.955),
          DoublePoint(0.894, 0.727),
          DoublePoint(0.894, 0.273),
        )
      ],
      constraints: ConstraintSet(
        coincidents: [
          CoincidentBoardConstraint(
            coords: {Coord(2, IntPoint(3, -1)), Coord(1, IntPoint(3, -1))},
          ),
          CoincidentBoardConstraint(
            coords: {Coord(0, IntPoint(-1, -1)), Coord(1, IntPoint(-1, 3))},
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(1, IntPoint(3, 3)),
              Coord(0, IntPoint(3, -1)),
              Coord(2, IntPoint(-1, -1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {Coord(2, IntPoint(-1, 3)), Coord(0, IntPoint(3, 3))},
          )
        ],
        equidistants: [
          EquidistantBoardConstraint(
            sides: {
              Side(
                Coord(0, IntPoint(3, -1)),
                Coord(2, IntPoint(3, 3)),
              ),
              Side(
                Coord(0, IntPoint(3, 3)),
                Coord(0, IntPoint(-1, 3)),
              ),
              Side(
                Coord(2, IntPoint(3, 3)),
                Coord(0, IntPoint(3, 3)),
              ),
              Side(
                Coord(1, IntPoint(3, -1)),
                Coord(2, IntPoint(3, 3)),
              ),
              Side(
                Coord(0, IntPoint(3, -1)),
                Coord(1, IntPoint(3, -1)),
              ),
              Side(
                Coord(0, IntPoint(3, 3)),
                Coord(0, IntPoint(3, -1)),
              ),
              Side(
                Coord(0, IntPoint(-1, -1)),
                Coord(0, IntPoint(-1, 3)),
              ),
              Side(
                Coord(0, IntPoint(3, -1)),
                Coord(0, IntPoint(-1, -1)),
              ),
              Side(
                Coord(1, IntPoint(-1, -1)),
                Coord(0, IntPoint(-1, -1)),
              ),
              Side(
                Coord(1, IntPoint(3, -1)),
                Coord(1, IntPoint(-1, -1)),
              ),
              Side(
                Coord(1, IntPoint(-1, -1)),
                Coord(0, IntPoint(3, -1)),
              ),
              Side(
                Coord(0, IntPoint(-1, 3)),
                Coord(0, IntPoint(3, -1)),
              )
            },
          )
        ],
      ),
    );
  }();
  static final Board cube15 = () {
    return Board(
      charts: [
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1)
      ],
      convs: [
        Conv(
          fromA: 0,
          toA: 1,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, 2),
        ),
        Conv(
          fromA: 0,
          toA: 6,
          rot: IntPoint(0, 2),
          trans: IntPoint(2, 0),
        ),
        Conv(
          fromA: 0,
          toA: 7,
          rot: IntPoint(-2, 0),
          trans: IntPoint(2, 0),
        ),
        Conv(
          fromA: 0,
          toA: 11,
          rot: IntPoint(2, 0),
          trans: IntPoint(0, 2),
        ),
        Conv(
          fromA: 1,
          toA: 11,
          rot: IntPoint(0, 2),
          trans: IntPoint(-2, 0),
        ),
        Conv(
          fromA: 2,
          toA: 8,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, -2),
        ),
        Conv(
          fromA: 2,
          toA: 11,
          rot: IntPoint(0, 2),
          trans: IntPoint(2, 0),
        ),
        Conv(
          fromA: 2,
          toA: 12,
          rot: IntPoint(0, 2),
          trans: IntPoint(-2, 0),
        ),
        Conv(
          fromA: 3,
          toA: 9,
          rot: IntPoint(-2, 0),
          trans: IntPoint(-2, 0),
        ),
        Conv(
          fromA: 3,
          toA: 10,
          rot: IntPoint(0, 2),
          trans: IntPoint(2, 0),
        ),
        Conv(
          fromA: 3,
          toA: 14,
          rot: IntPoint(0, 2),
          trans: IntPoint(-2, 0),
        ),
        Conv(
          fromA: 4,
          toA: 9,
          rot: IntPoint(-2, 0),
          trans: IntPoint(2, 0),
        ),
        Conv(
          fromA: 4,
          toA: 13,
          rot: IntPoint(0, 2),
          trans: IntPoint(2, 0),
        ),
        Conv(
          fromA: 5,
          toA: 7,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, 2),
        ),
        Conv(
          fromA: 5,
          toA: 8,
          rot: IntPoint(0, 2),
          trans: IntPoint(-2, 0),
        ),
        Conv(
          fromA: 5,
          toA: 10,
          rot: IntPoint(2, 0),
          trans: IntPoint(-2, 0),
        ),
        Conv(
          fromA: 6,
          toA: 7,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, -2),
        ),
        Conv(
          fromA: 8,
          toA: 10,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, -2),
        ),
        Conv(
          fromA: 8,
          toA: 12,
          rot: IntPoint(2, 0),
          trans: IntPoint(0, 2),
        ),
        Conv(
          fromA: 9,
          toA: 13,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, 2),
        ),
        Conv(
          fromA: 9,
          toA: 14,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, -2),
        ),
        Conv(
          fromA: 12,
          toA: 13,
          rot: IntPoint(0, 2),
          trans: IntPoint(-2, 0),
        )
      ],
      quads: [
        Quad(
          DoublePoint(0.0455, 0.500),
          DoublePoint(0.197, 0.587),
          DoublePoint(0.348, 0.500),
          DoublePoint(0.197, 0.413),
        ),
        Quad(
          DoublePoint(0.0455, 0.325),
          DoublePoint(0.0455, 0.500),
          DoublePoint(0.197, 0.413),
          DoublePoint(0.197, 0.238),
        ),
        Quad(
          DoublePoint(0.348, 0.325),
          DoublePoint(0.348, 0.500),
          DoublePoint(0.500, 0.413),
          DoublePoint(0.500, 0.238),
        ),
        Quad(
          DoublePoint(0.652, 0.500),
          DoublePoint(0.652, 0.675),
          DoublePoint(0.803, 0.762),
          DoublePoint(0.803, 0.587),
        ),
        Quad(
          DoublePoint(0.803, 0.238),
          DoublePoint(0.803, 0.413),
          DoublePoint(0.955, 0.500),
          DoublePoint(0.955, 0.325),
        ),
        Quad(
          DoublePoint(0.348, 0.675),
          DoublePoint(0.500, 0.762),
          DoublePoint(0.500, 0.587),
          DoublePoint(0.348, 0.500),
        ),
        Quad(
          DoublePoint(0.0455, 0.675),
          DoublePoint(0.197, 0.762),
          DoublePoint(0.197, 0.587),
          DoublePoint(0.0455, 0.500),
        ),
        Quad(
          DoublePoint(0.197, 0.762),
          DoublePoint(0.348, 0.675),
          DoublePoint(0.348, 0.500),
          DoublePoint(0.197, 0.587),
        ),
        Quad(
          DoublePoint(0.348, 0.500),
          DoublePoint(0.500, 0.587),
          DoublePoint(0.652, 0.500),
          DoublePoint(0.500, 0.413),
        ),
        Quad(
          DoublePoint(0.652, 0.500),
          DoublePoint(0.803, 0.587),
          DoublePoint(0.955, 0.500),
          DoublePoint(0.803, 0.413),
        ),
        Quad(
          DoublePoint(0.500, 0.587),
          DoublePoint(0.500, 0.762),
          DoublePoint(0.652, 0.675),
          DoublePoint(0.652, 0.500),
        ),
        Quad(
          DoublePoint(0.197, 0.238),
          DoublePoint(0.197, 0.413),
          DoublePoint(0.348, 0.500),
          DoublePoint(0.348, 0.325),
        ),
        Quad(
          DoublePoint(0.500, 0.238),
          DoublePoint(0.500, 0.413),
          DoublePoint(0.652, 0.500),
          DoublePoint(0.652, 0.325),
        ),
        Quad(
          DoublePoint(0.652, 0.325),
          DoublePoint(0.652, 0.500),
          DoublePoint(0.803, 0.413),
          DoublePoint(0.803, 0.238),
        ),
        Quad(
          DoublePoint(0.803, 0.587),
          DoublePoint(0.803, 0.762),
          DoublePoint(0.955, 0.675),
          DoublePoint(0.955, 0.500),
        )
      ],
      constraints: ConstraintSet(
        coincidents: [
          CoincidentBoardConstraint(
            coords: {Coord(14, IntPoint(-1, 1)), Coord(3, IntPoint(1, 1))},
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(14, IntPoint(1, -1)),
              Coord(4, IntPoint(1, 1)),
              Coord(9, IntPoint(1, 1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(3, IntPoint(1, -1)),
              Coord(14, IntPoint(-1, -1)),
              Coord(9, IntPoint(-1, 1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {Coord(3, IntPoint(-1, 1)), Coord(10, IntPoint(1, 1))},
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(3, IntPoint(-1, -1)),
              Coord(8, IntPoint(1, 1)),
              Coord(13, IntPoint(-1, 1)),
              Coord(12, IntPoint(1, 1)),
              Coord(9, IntPoint(-1, -1)),
              Coord(10, IntPoint(1, -1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {Coord(4, IntPoint(-1, -1)), Coord(13, IntPoint(1, -1))},
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(9, IntPoint(1, -1)),
              Coord(4, IntPoint(-1, 1)),
              Coord(13, IntPoint(1, 1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {Coord(12, IntPoint(1, -1)), Coord(13, IntPoint(-1, -1))},
          ),
          CoincidentBoardConstraint(
            coords: {Coord(12, IntPoint(-1, -1)), Coord(2, IntPoint(1, -1))},
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(12, IntPoint(-1, 1)),
              Coord(2, IntPoint(1, 1)),
              Coord(8, IntPoint(1, -1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {Coord(10, IntPoint(-1, 1)), Coord(5, IntPoint(-1, 1))},
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(10, IntPoint(-1, -1)),
              Coord(8, IntPoint(-1, 1)),
              Coord(5, IntPoint(1, 1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {Coord(7, IntPoint(-1, 1)), Coord(5, IntPoint(-1, -1))},
          ),
          CoincidentBoardConstraint(
            coords: {Coord(11, IntPoint(1, -1)), Coord(2, IntPoint(-1, -1))},
          ),
          CoincidentBoardConstraint(
            coords: {Coord(6, IntPoint(-1, 1)), Coord(7, IntPoint(-1, -1))},
          ),
          CoincidentBoardConstraint(
            coords: {Coord(1, IntPoint(1, -1)), Coord(11, IntPoint(-1, -1))},
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(1, IntPoint(-1, 1)),
              Coord(6, IntPoint(1, -1)),
              Coord(0, IntPoint(-1, -1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(0, IntPoint(1, -1)),
              Coord(11, IntPoint(-1, 1)),
              Coord(1, IntPoint(1, 1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(6, IntPoint(1, 1)),
              Coord(0, IntPoint(-1, 1)),
              Coord(7, IntPoint(1, -1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(7, IntPoint(1, 1)),
              Coord(2, IntPoint(-1, 1)),
              Coord(5, IntPoint(1, -1)),
              Coord(0, IntPoint(1, 1)),
              Coord(8, IntPoint(-1, -1)),
              Coord(11, IntPoint(1, 1))
            },
          )
        ],
        equidistants: [
          EquidistantBoardConstraint(
            sides: {
              Side(
                Coord(0, IntPoint(-1, -1)),
                Coord(0, IntPoint(-1, 1)),
              ),
              Side(
                Coord(0, IntPoint(1, -1)),
                Coord(1, IntPoint(-1, -1)),
              ),
              Side(
                Coord(2, IntPoint(-1, -1)),
                Coord(0, IntPoint(1, -1)),
              ),
              Side(
                Coord(2, IntPoint(1, 1)),
                Coord(2, IntPoint(-1, -1)),
              ),
              Side(
                Coord(12, IntPoint(1, -1)),
                Coord(2, IntPoint(1, 1)),
              ),
              Side(
                Coord(4, IntPoint(-1, 1)),
                Coord(12, IntPoint(1, -1)),
              ),
              Side(
                Coord(4, IntPoint(1, -1)),
                Coord(4, IntPoint(-1, 1)),
              ),
              Side(
                Coord(3, IntPoint(1, -1)),
                Coord(14, IntPoint(1, 1)),
              ),
              Side(
                Coord(3, IntPoint(-1, 1)),
                Coord(3, IntPoint(1, -1)),
              ),
              Side(
                Coord(5, IntPoint(1, 1)),
                Coord(3, IntPoint(-1, 1)),
              ),
              Side(
                Coord(5, IntPoint(-1, -1)),
                Coord(5, IntPoint(1, 1)),
              ),
              Side(
                Coord(0, IntPoint(-1, 1)),
                Coord(5, IntPoint(-1, -1)),
              ),
              Side(
                Coord(6, IntPoint(-1, -1)),
                Coord(0, IntPoint(-1, 1)),
              ),
              Side(
                Coord(0, IntPoint(1, -1)),
                Coord(1, IntPoint(1, -1)),
              ),
              Side(
                Coord(5, IntPoint(-1, 1)),
                Coord(5, IntPoint(1, 1)),
              ),
              Side(
                Coord(3, IntPoint(-1, -1)),
                Coord(3, IntPoint(-1, 1)),
              ),
              Side(
                Coord(3, IntPoint(1, 1)),
                Coord(3, IntPoint(1, -1)),
              ),
              Side(
                Coord(4, IntPoint(1, 1)),
                Coord(14, IntPoint(1, 1)),
              ),
              Side(
                Coord(4, IntPoint(-1, -1)),
                Coord(4, IntPoint(-1, 1)),
              ),
              Side(
                Coord(3, IntPoint(-1, -1)),
                Coord(12, IntPoint(1, -1)),
              ),
              Side(
                Coord(2, IntPoint(1, -1)),
                Coord(2, IntPoint(1, 1)),
              ),
              Side(
                Coord(0, IntPoint(1, 1)),
                Coord(2, IntPoint(-1, -1)),
              ),
              Side(
                Coord(1, IntPoint(-1, -1)),
                Coord(0, IntPoint(-1, -1)),
              ),
              Side(
                Coord(0, IntPoint(-1, -1)),
                Coord(6, IntPoint(-1, -1)),
              ),
              Side(
                Coord(0, IntPoint(1, -1)),
                Coord(0, IntPoint(-1, -1)),
              ),
              Side(
                Coord(0, IntPoint(-1, 1)),
                Coord(6, IntPoint(-1, 1)),
              ),
              Side(
                Coord(0, IntPoint(1, 1)),
                Coord(5, IntPoint(-1, -1)),
              ),
              Side(
                Coord(6, IntPoint(-1, 1)),
                Coord(6, IntPoint(-1, -1)),
              ),
              Side(
                Coord(5, IntPoint(-1, -1)),
                Coord(6, IntPoint(-1, 1)),
              ),
              Side(
                Coord(5, IntPoint(-1, 1)),
                Coord(5, IntPoint(-1, -1)),
              ),
              Side(
                Coord(3, IntPoint(-1, 1)),
                Coord(5, IntPoint(-1, 1)),
              ),
              Side(
                Coord(3, IntPoint(1, 1)),
                Coord(3, IntPoint(-1, 1)),
              ),
              Side(
                Coord(14, IntPoint(1, 1)),
                Coord(3, IntPoint(1, 1)),
              ),
              Side(
                Coord(4, IntPoint(1, -1)),
                Coord(4, IntPoint(1, 1)),
              ),
              Side(
                Coord(4, IntPoint(-1, -1)),
                Coord(4, IntPoint(1, -1)),
              ),
              Side(
                Coord(12, IntPoint(1, -1)),
                Coord(4, IntPoint(-1, -1)),
              ),
              Side(
                Coord(2, IntPoint(1, -1)),
                Coord(12, IntPoint(1, -1)),
              ),
              Side(
                Coord(2, IntPoint(-1, -1)),
                Coord(2, IntPoint(1, -1)),
              ),
              Side(
                Coord(1, IntPoint(1, -1)),
                Coord(2, IntPoint(-1, -1)),
              ),
              Side(
                Coord(1, IntPoint(-1, -1)),
                Coord(1, IntPoint(1, -1)),
              ),
              Side(
                Coord(0, IntPoint(1, -1)),
                Coord(0, IntPoint(1, 1)),
              ),
              Side(
                Coord(3, IntPoint(-1, -1)),
                Coord(3, IntPoint(1, -1)),
              ),
              Side(
                Coord(0, IntPoint(1, 1)),
                Coord(0, IntPoint(-1, 1)),
              ),
              Side(
                Coord(2, IntPoint(1, 1)),
                Coord(0, IntPoint(1, 1)),
              ),
              Side(
                Coord(3, IntPoint(-1, -1)),
                Coord(2, IntPoint(1, 1)),
              ),
              Side(
                Coord(5, IntPoint(1, 1)),
                Coord(3, IntPoint(-1, -1)),
              ),
              Side(
                Coord(0, IntPoint(1, 1)),
                Coord(5, IntPoint(1, 1)),
              ),
              Side(
                Coord(4, IntPoint(-1, 1)),
                Coord(3, IntPoint(-1, -1)),
              ),
              Side(
                Coord(4, IntPoint(1, 1)),
                Coord(4, IntPoint(-1, 1)),
              ),
              Side(
                Coord(3, IntPoint(1, -1)),
                Coord(4, IntPoint(1, 1)),
              )
            },
          )
        ],
      ),
    );
  }();
  static final Board eye1 = () {
    return Board(
      charts: [
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1)
      ],
      convs: [
        Conv(
          fromA: 0,
          toA: 2,
          rot: IntPoint(0, 2),
          trans: IntPoint(2, 0),
        ),
        Conv(
          fromA: 0,
          toA: 5,
          rot: IntPoint(0, 2),
          trans: IntPoint(-2, 0),
        ),
        Conv(
          fromA: 0,
          toA: 6,
          rot: IntPoint(-2, 0),
          trans: IntPoint(-2, 0),
        ),
        Conv(
          fromA: 1,
          toA: 3,
          rot: IntPoint(0, 2),
          trans: IntPoint(2, 0),
        ),
        Conv(
          fromA: 1,
          toA: 4,
          rot: IntPoint(0, 2),
          trans: IntPoint(-2, 0),
        ),
        Conv(
          fromA: 1,
          toA: 6,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, -2),
        ),
        Conv(
          fromA: 2,
          toA: 3,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, 2),
        ),
        Conv(
          fromA: 4,
          toA: 6,
          rot: IntPoint(-2, 0),
          trans: IntPoint(2, 0),
        ),
        Conv(
          fromA: 4,
          toA: 8,
          rot: IntPoint(0, 2),
          trans: IntPoint(-2, 0),
        ),
        Conv(
          fromA: 5,
          toA: 6,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, 2),
        ),
        Conv(
          fromA: 5,
          toA: 7,
          rot: IntPoint(0, 2),
          trans: IntPoint(-2, 0),
        ),
        Conv(
          fromA: 7,
          toA: 8,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, 2),
        )
      ],
      quads: [
        Quad(
          DoublePoint(0.500, 0.273),
          DoublePoint(0.273, 0.273),
          DoublePoint(0.273, 0.500),
          DoublePoint(0.369, 0.500),
        ),
        Quad(
          DoublePoint(0.727, 0.273),
          DoublePoint(0.500, 0.273),
          DoublePoint(0.631, 0.500),
          DoublePoint(0.727, 0.500),
        ),
        Quad(
          DoublePoint(0.500, 0.0455),
          DoublePoint(0.273, 0.0455),
          DoublePoint(0.273, 0.273),
          DoublePoint(0.500, 0.273),
        ),
        Quad(
          DoublePoint(0.727, 0.0455),
          DoublePoint(0.500, 0.0455),
          DoublePoint(0.500, 0.273),
          DoublePoint(0.727, 0.273),
        ),
        Quad(
          DoublePoint(0.727, 0.500),
          DoublePoint(0.631, 0.500),
          DoublePoint(0.500, 0.727),
          DoublePoint(0.727, 0.727),
        ),
        Quad(
          DoublePoint(0.369, 0.500),
          DoublePoint(0.273, 0.500),
          DoublePoint(0.273, 0.727),
          DoublePoint(0.500, 0.727),
        ),
        Quad(
          DoublePoint(0.500, 0.273),
          DoublePoint(0.369, 0.500),
          DoublePoint(0.500, 0.727),
          DoublePoint(0.631, 0.500),
        ),
        Quad(
          DoublePoint(0.500, 0.727),
          DoublePoint(0.273, 0.727),
          DoublePoint(0.273, 0.955),
          DoublePoint(0.500, 0.955),
        ),
        Quad(
          DoublePoint(0.727, 0.727),
          DoublePoint(0.500, 0.727),
          DoublePoint(0.500, 0.955),
          DoublePoint(0.727, 0.955),
        )
      ],
      constraints: ConstraintSet(
        coincidents: [
          CoincidentBoardConstraint(
            coords: {Coord(8, IntPoint(1, 1)), Coord(7, IntPoint(1, -1))},
          ),
          CoincidentBoardConstraint(
            coords: {Coord(4, IntPoint(1, -1)), Coord(8, IntPoint(-1, -1))},
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(4, IntPoint(-1, 1)),
              Coord(6, IntPoint(1, -1)),
              Coord(1, IntPoint(1, 1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {Coord(1, IntPoint(1, -1)), Coord(4, IntPoint(-1, -1))},
          ),
          CoincidentBoardConstraint(
            coords: {Coord(5, IntPoint(-1, 1)), Coord(0, IntPoint(1, 1))},
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(5, IntPoint(-1, -1)),
              Coord(6, IntPoint(-1, 1)),
              Coord(0, IntPoint(1, -1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(6, IntPoint(-1, -1)),
              Coord(1, IntPoint(-1, 1)),
              Coord(0, IntPoint(-1, -1)),
              Coord(2, IntPoint(1, -1)),
              Coord(3, IntPoint(1, 1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(5, IntPoint(1, -1)),
              Coord(6, IntPoint(1, 1)),
              Coord(4, IntPoint(1, 1)),
              Coord(7, IntPoint(-1, -1)),
              Coord(8, IntPoint(-1, 1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {Coord(7, IntPoint(-1, 1)), Coord(5, IntPoint(1, 1))},
          ),
          CoincidentBoardConstraint(
            coords: {Coord(0, IntPoint(-1, 1)), Coord(2, IntPoint(1, 1))},
          ),
          CoincidentBoardConstraint(
            coords: {Coord(1, IntPoint(-1, -1)), Coord(3, IntPoint(1, -1))},
          ),
          CoincidentBoardConstraint(
            coords: {Coord(3, IntPoint(-1, 1)), Coord(2, IntPoint(-1, -1))},
          )
        ],
        equidistants: [
          EquidistantBoardConstraint(
            sides: {
              Side(
                Coord(7, IntPoint(1, 1)),
                Coord(8, IntPoint(1, -1)),
              ),
              Side(
                Coord(0, IntPoint(1, 1)),
                Coord(1, IntPoint(1, -1)),
              ),
              Side(
                Coord(3, IntPoint(-1, -1)),
                Coord(2, IntPoint(-1, 1)),
              )
            },
          ),
          EquidistantBoardConstraint(
            sides: {
              Side(
                Coord(0, IntPoint(-1, 1)),
                Coord(2, IntPoint(-1, -1)),
              ),
              Side(
                Coord(2, IntPoint(-1, 1)),
                Coord(0, IntPoint(-1, -1)),
              ),
              Side(
                Coord(5, IntPoint(1, 1)),
                Coord(7, IntPoint(1, -1)),
              ),
              Side(
                Coord(1, IntPoint(-1, -1)),
                Coord(2, IntPoint(-1, -1)),
              ),
              Side(
                Coord(3, IntPoint(-1, -1)),
                Coord(0, IntPoint(-1, -1)),
              ),
              Side(
                Coord(4, IntPoint(1, 1)),
                Coord(0, IntPoint(1, 1)),
              ),
              Side(
                Coord(0, IntPoint(1, 1)),
                Coord(0, IntPoint(-1, -1)),
              ),
              Side(
                Coord(1, IntPoint(1, -1)),
                Coord(4, IntPoint(1, 1)),
              ),
              Side(
                Coord(7, IntPoint(1, 1)),
                Coord(4, IntPoint(1, 1)),
              ),
              Side(
                Coord(4, IntPoint(1, 1)),
                Coord(8, IntPoint(1, -1)),
              ),
              Side(
                Coord(7, IntPoint(1, -1)),
                Coord(4, IntPoint(1, -1)),
              ),
              Side(
                Coord(1, IntPoint(1, -1)),
                Coord(0, IntPoint(-1, -1)),
              )
            },
          ),
          EquidistantBoardConstraint(
            sides: {
              Side(
                Coord(0, IntPoint(-1, -1)),
                Coord(1, IntPoint(1, 1)),
              ),
              Side(
                Coord(1, IntPoint(1, 1)),
                Coord(4, IntPoint(1, 1)),
              ),
              Side(
                Coord(0, IntPoint(-1, -1)),
                Coord(0, IntPoint(1, -1)),
              ),
              Side(
                Coord(0, IntPoint(1, -1)),
                Coord(4, IntPoint(1, 1)),
              )
            },
          ),
          EquidistantBoardConstraint(
            sides: {
              Side(
                Coord(0, IntPoint(1, -1)),
                Coord(0, IntPoint(1, 1)),
              ),
              Side(
                Coord(1, IntPoint(1, -1)),
                Coord(1, IntPoint(1, 1)),
              )
            },
          ),
          EquidistantBoardConstraint(
            sides: {
              Side(
                Coord(4, IntPoint(1, 1)),
                Coord(5, IntPoint(1, 1)),
              ),
              Side(
                Coord(2, IntPoint(-1, -1)),
                Coord(0, IntPoint(-1, -1)),
              ),
              Side(
                Coord(7, IntPoint(1, -1)),
                Coord(4, IntPoint(1, 1)),
              ),
              Side(
                Coord(4, IntPoint(1, 1)),
                Coord(4, IntPoint(1, -1)),
              ),
              Side(
                Coord(0, IntPoint(-1, 1)),
                Coord(0, IntPoint(-1, -1)),
              ),
              Side(
                Coord(0, IntPoint(-1, -1)),
                Coord(1, IntPoint(-1, -1)),
              )
            },
          ),
          EquidistantBoardConstraint(
            sides: {
              Side(
                Coord(2, IntPoint(-1, -1)),
                Coord(3, IntPoint(-1, -1)),
              ),
              Side(
                Coord(3, IntPoint(-1, -1)),
                Coord(1, IntPoint(-1, -1)),
              ),
              Side(
                Coord(2, IntPoint(-1, -1)),
                Coord(2, IntPoint(-1, 1)),
              ),
              Side(
                Coord(4, IntPoint(1, -1)),
                Coord(1, IntPoint(1, -1)),
              ),
              Side(
                Coord(1, IntPoint(-1, -1)),
                Coord(1, IntPoint(1, -1)),
              ),
              Side(
                Coord(8, IntPoint(1, -1)),
                Coord(7, IntPoint(1, -1)),
              ),
              Side(
                Coord(8, IntPoint(1, -1)),
                Coord(4, IntPoint(1, -1)),
              ),
              Side(
                Coord(7, IntPoint(1, 1)),
                Coord(7, IntPoint(1, -1)),
              ),
              Side(
                Coord(5, IntPoint(1, 1)),
                Coord(7, IntPoint(1, 1)),
              ),
              Side(
                Coord(0, IntPoint(1, 1)),
                Coord(5, IntPoint(1, 1)),
              ),
              Side(
                Coord(0, IntPoint(-1, 1)),
                Coord(2, IntPoint(-1, 1)),
              ),
              Side(
                Coord(0, IntPoint(1, 1)),
                Coord(0, IntPoint(-1, 1)),
              )
            },
          )
        ],
      ),
    );
  }();
  static final Board eye2 = () {
    return Board(
      charts: [
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1)
      ],
      convs: [
        Conv(
          fromA: 0,
          toA: 3,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, -2),
        ),
        Conv(
          fromA: 0,
          toA: 7,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, 2),
        ),
        Conv(
          fromA: 0,
          toA: 10,
          rot: IntPoint(0, 2),
          trans: IntPoint(2, 0),
        ),
        Conv(
          fromA: 1,
          toA: 2,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, -2),
        ),
        Conv(
          fromA: 1,
          toA: 8,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, 2),
        ),
        Conv(
          fromA: 1,
          toA: 9,
          rot: IntPoint(-2, 0),
          trans: IntPoint(0, 2),
        ),
        Conv(
          fromA: 1,
          toA: 10,
          rot: IntPoint(-2, 0),
          trans: IntPoint(0, -2),
        ),
        Conv(
          fromA: 2,
          toA: 6,
          rot: IntPoint(0, 2),
          trans: IntPoint(2, 0),
        ),
        Conv(
          fromA: 2,
          toA: 10,
          rot: IntPoint(0, 2),
          trans: IntPoint(-2, 0),
        ),
        Conv(
          fromA: 3,
          toA: 10,
          rot: IntPoint(-2, 0),
          trans: IntPoint(0, 2),
        ),
        Conv(
          fromA: 4,
          toA: 5,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, -2),
        ),
        Conv(
          fromA: 4,
          toA: 9,
          rot: IntPoint(-2, 0),
          trans: IntPoint(0, -2),
        ),
        Conv(
          fromA: 5,
          toA: 6,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, -2),
        ),
        Conv(
          fromA: 5,
          toA: 9,
          rot: IntPoint(0, 2),
          trans: IntPoint(-2, 0),
        ),
        Conv(
          fromA: 7,
          toA: 8,
          rot: IntPoint(0, 2),
          trans: IntPoint(2, 0),
        ),
        Conv(
          fromA: 8,
          toA: 9,
          rot: IntPoint(0, 2),
          trans: IntPoint(2, 0),
        )
      ],
      quads: [
        Quad(
          DoublePoint(0.652, 0.348),
          DoublePoint(0.753, 0.652),
          DoublePoint(0.955, 0.652),
          DoublePoint(0.955, 0.348),
        ),
        Quad(
          DoublePoint(0.449, 0.348),
          DoublePoint(0.348, 0.652),
          DoublePoint(0.551, 0.652),
          DoublePoint(0.652, 0.348),
        ),
        Quad(
          DoublePoint(0.348, 0.652),
          DoublePoint(0.348, 0.955),
          DoublePoint(0.652, 0.955),
          DoublePoint(0.551, 0.652),
        ),
        Quad(
          DoublePoint(0.753, 0.652),
          DoublePoint(0.652, 0.955),
          DoublePoint(0.955, 0.955),
          DoublePoint(0.955, 0.652),
        ),
        Quad(
          DoublePoint(0.0455, 0.0455),
          DoublePoint(0.0455, 0.348),
          DoublePoint(0.247, 0.348),
          DoublePoint(0.348, 0.0455),
        ),
        Quad(
          DoublePoint(0.0455, 0.348),
          DoublePoint(0.0455, 0.652),
          DoublePoint(0.348, 0.652),
          DoublePoint(0.247, 0.348),
        ),
        Quad(
          DoublePoint(0.0455, 0.652),
          DoublePoint(0.0455, 0.955),
          DoublePoint(0.348, 0.955),
          DoublePoint(0.348, 0.652),
        ),
        Quad(
          DoublePoint(0.652, 0.0455),
          DoublePoint(0.652, 0.348),
          DoublePoint(0.955, 0.348),
          DoublePoint(0.955, 0.0455),
        ),
        Quad(
          DoublePoint(0.348, 0.0455),
          DoublePoint(0.449, 0.348),
          DoublePoint(0.652, 0.348),
          DoublePoint(0.652, 0.0455),
        ),
        Quad(
          DoublePoint(0.247, 0.348),
          DoublePoint(0.348, 0.652),
          DoublePoint(0.449, 0.348),
          DoublePoint(0.348, 0.0455),
        ),
        Quad(
          DoublePoint(0.551, 0.652),
          DoublePoint(0.652, 0.955),
          DoublePoint(0.753, 0.652),
          DoublePoint(0.652, 0.348),
        )
      ],
      constraints: ConstraintSet(
        coincidents: [
          CoincidentBoardConstraint(
            coords: {Coord(0, IntPoint(1, -1)), Coord(7, IntPoint(1, 1))},
          ),
          CoincidentBoardConstraint(
            coords: {Coord(0, IntPoint(1, 1)), Coord(3, IntPoint(1, -1))},
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(0, IntPoint(-1, 1)),
              Coord(10, IntPoint(1, 1)),
              Coord(3, IntPoint(-1, -1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(10, IntPoint(-1, 1)),
              Coord(3, IntPoint(-1, 1)),
              Coord(2, IntPoint(1, 1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(10, IntPoint(-1, -1)),
              Coord(2, IntPoint(1, -1)),
              Coord(1, IntPoint(1, 1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(10, IntPoint(1, -1)),
              Coord(1, IntPoint(1, -1)),
              Coord(0, IntPoint(-1, -1)),
              Coord(7, IntPoint(-1, 1)),
              Coord(8, IntPoint(1, 1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {Coord(7, IntPoint(-1, -1)), Coord(8, IntPoint(1, -1))},
          ),
          CoincidentBoardConstraint(
            coords: {Coord(6, IntPoint(1, 1)), Coord(2, IntPoint(-1, 1))},
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(2, IntPoint(-1, -1)),
              Coord(1, IntPoint(-1, 1)),
              Coord(5, IntPoint(1, 1)),
              Coord(9, IntPoint(-1, 1)),
              Coord(6, IntPoint(1, -1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {Coord(5, IntPoint(-1, 1)), Coord(6, IntPoint(-1, -1))},
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(9, IntPoint(1, 1)),
              Coord(1, IntPoint(-1, -1)),
              Coord(8, IntPoint(-1, 1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(9, IntPoint(1, -1)),
              Coord(8, IntPoint(-1, -1)),
              Coord(4, IntPoint(1, -1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(9, IntPoint(-1, -1)),
              Coord(4, IntPoint(1, 1)),
              Coord(5, IntPoint(1, -1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {Coord(5, IntPoint(-1, -1)), Coord(4, IntPoint(-1, 1))},
          )
        ],
        equidistants: [
          EquidistantBoardConstraint(
            sides: {
              Side(
                Coord(2, IntPoint(1, 1)),
                Coord(1, IntPoint(-1, 1)),
              ),
              Side(
                Coord(0, IntPoint(-1, -1)),
                Coord(1, IntPoint(-1, 1)),
              ),
              Side(
                Coord(0, IntPoint(1, 1)),
                Coord(2, IntPoint(1, 1)),
              ),
              Side(
                Coord(0, IntPoint(-1, -1)),
                Coord(4, IntPoint(1, -1)),
              ),
              Side(
                Coord(0, IntPoint(-1, -1)),
                Coord(0, IntPoint(1, 1)),
              ),
              Side(
                Coord(0, IntPoint(1, -1)),
                Coord(7, IntPoint(-1, -1)),
              ),
              Side(
                Coord(1, IntPoint(-1, 1)),
                Coord(4, IntPoint(-1, 1)),
              ),
              Side(
                Coord(4, IntPoint(1, -1)),
                Coord(4, IntPoint(-1, 1)),
              ),
              Side(
                Coord(2, IntPoint(-1, 1)),
                Coord(5, IntPoint(-1, 1)),
              ),
              Side(
                Coord(1, IntPoint(-1, 1)),
                Coord(6, IntPoint(-1, 1)),
              ),
              Side(
                Coord(7, IntPoint(1, -1)),
                Coord(0, IntPoint(-1, -1)),
              )
            },
          ),
          EquidistantBoardConstraint(
            sides: {
              Side(
                Coord(6, IntPoint(-1, 1)),
                Coord(4, IntPoint(-1, -1)),
              ),
              Side(
                Coord(2, IntPoint(-1, 1)),
                Coord(4, IntPoint(1, -1)),
              ),
              Side(
                Coord(3, IntPoint(1, 1)),
                Coord(7, IntPoint(1, -1)),
              ),
              Side(
                Coord(2, IntPoint(1, 1)),
                Coord(7, IntPoint(-1, -1)),
              )
            },
          ),
          EquidistantBoardConstraint(
            sides: {
              Side(
                Coord(0, IntPoint(-1, 1)),
                Coord(1, IntPoint(1, 1)),
              ),
              Side(
                Coord(4, IntPoint(1, 1)),
                Coord(1, IntPoint(-1, -1)),
              ),
              Side(
                Coord(4, IntPoint(-1, 1)),
                Coord(4, IntPoint(1, 1)),
              ),
              Side(
                Coord(0, IntPoint(-1, 1)),
                Coord(0, IntPoint(1, 1)),
              )
            },
          ),
          EquidistantBoardConstraint(
            sides: {
              Side(
                Coord(0, IntPoint(-1, -1)),
                Coord(1, IntPoint(-1, -1)),
              ),
              Side(
                Coord(1, IntPoint(1, 1)),
                Coord(1, IntPoint(-1, 1)),
              )
            },
          ),
          EquidistantBoardConstraint(
            sides: {
              Side(
                Coord(0, IntPoint(-1, 1)),
                Coord(0, IntPoint(-1, -1)),
              ),
              Side(
                Coord(4, IntPoint(1, 1)),
                Coord(4, IntPoint(1, -1)),
              ),
              Side(
                Coord(0, IntPoint(-1, 1)),
                Coord(2, IntPoint(1, 1)),
              ),
              Side(
                Coord(2, IntPoint(1, 1)),
                Coord(1, IntPoint(1, 1)),
              ),
              Side(
                Coord(0, IntPoint(-1, -1)),
                Coord(1, IntPoint(1, 1)),
              ),
              Side(
                Coord(1, IntPoint(-1, -1)),
                Coord(4, IntPoint(1, -1)),
              ),
              Side(
                Coord(1, IntPoint(-1, -1)),
                Coord(1, IntPoint(-1, 1)),
              ),
              Side(
                Coord(1, IntPoint(-1, 1)),
                Coord(4, IntPoint(1, 1)),
              )
            },
          ),
          EquidistantBoardConstraint(
            sides: {
              Side(
                Coord(0, IntPoint(-1, -1)),
                Coord(0, IntPoint(1, -1)),
              ),
              Side(
                Coord(0, IntPoint(-1, -1)),
                Coord(7, IntPoint(-1, -1)),
              ),
              Side(
                Coord(0, IntPoint(1, -1)),
                Coord(7, IntPoint(1, -1)),
              ),
              Side(
                Coord(1, IntPoint(-1, 1)),
                Coord(5, IntPoint(-1, 1)),
              ),
              Side(
                Coord(2, IntPoint(-1, 1)),
                Coord(6, IntPoint(-1, 1)),
              ),
              Side(
                Coord(2, IntPoint(-1, 1)),
                Coord(1, IntPoint(-1, 1)),
              ),
              Side(
                Coord(5, IntPoint(-1, 1)),
                Coord(6, IntPoint(-1, 1)),
              ),
              Side(
                Coord(4, IntPoint(-1, 1)),
                Coord(5, IntPoint(-1, 1)),
              ),
              Side(
                Coord(4, IntPoint(-1, -1)),
                Coord(4, IntPoint(-1, 1)),
              ),
              Side(
                Coord(4, IntPoint(-1, -1)),
                Coord(4, IntPoint(1, -1)),
              ),
              Side(
                Coord(7, IntPoint(-1, -1)),
                Coord(4, IntPoint(1, -1)),
              ),
              Side(
                Coord(7, IntPoint(-1, -1)),
                Coord(7, IntPoint(1, -1)),
              ),
              Side(
                Coord(0, IntPoint(1, 1)),
                Coord(0, IntPoint(1, -1)),
              ),
              Side(
                Coord(3, IntPoint(1, 1)),
                Coord(0, IntPoint(1, 1)),
              ),
              Side(
                Coord(2, IntPoint(-1, 1)),
                Coord(2, IntPoint(1, 1)),
              ),
              Side(
                Coord(2, IntPoint(1, 1)),
                Coord(3, IntPoint(1, 1)),
              )
            },
          )
        ],
      ),
    );
  }();
  static final Board eye4 = () {
    return Board(
      charts: [
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1)
      ],
      convs: [
        Conv(
          fromA: 0,
          toA: 1,
          rot: IntPoint(2, 0),
          trans: IntPoint(0, -2),
        ),
        Conv(
          fromA: 0,
          toA: 2,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, -2),
        ),
        Conv(
          fromA: 0,
          toA: 3,
          rot: IntPoint(2, 0),
          trans: IntPoint(0, 2),
        ),
        Conv(
          fromA: 0,
          toA: 4,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, 2),
        ),
        Conv(
          fromA: 1,
          toA: 2,
          rot: IntPoint(0, 2),
          trans: IntPoint(-2, 0),
        ),
        Conv(
          fromA: 1,
          toA: 10,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, -2),
        ),
        Conv(
          fromA: 2,
          toA: 5,
          rot: IntPoint(0, 2),
          trans: IntPoint(-2, 0),
        ),
        Conv(
          fromA: 2,
          toA: 11,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, -2),
        ),
        Conv(
          fromA: 3,
          toA: 4,
          rot: IntPoint(0, 2),
          trans: IntPoint(2, 0),
        ),
        Conv(
          fromA: 3,
          toA: 6,
          rot: IntPoint(0, 2),
          trans: IntPoint(-2, 0),
        ),
        Conv(
          fromA: 5,
          toA: 6,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, 2),
        ),
        Conv(
          fromA: 5,
          toA: 7,
          rot: IntPoint(2, 0),
          trans: IntPoint(0, 2),
        ),
        Conv(
          fromA: 5,
          toA: 15,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, -2),
        ),
        Conv(
          fromA: 6,
          toA: 7,
          rot: IntPoint(0, 2),
          trans: IntPoint(-2, 0),
        ),
        Conv(
          fromA: 7,
          toA: 8,
          rot: IntPoint(0, 2),
          trans: IntPoint(-2, 0),
        ),
        Conv(
          fromA: 7,
          toA: 9,
          rot: IntPoint(-2, 0),
          trans: IntPoint(-2, 0),
        ),
        Conv(
          fromA: 8,
          toA: 9,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, 2),
        ),
        Conv(
          fromA: 8,
          toA: 16,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, -2),
        ),
        Conv(
          fromA: 10,
          toA: 12,
          rot: IntPoint(0, 2),
          trans: IntPoint(-2, 0),
        ),
        Conv(
          fromA: 10,
          toA: 13,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, -2),
        ),
        Conv(
          fromA: 11,
          toA: 12,
          rot: IntPoint(2, 0),
          trans: IntPoint(0, -2),
        ),
        Conv(
          fromA: 11,
          toA: 14,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, -2),
        ),
        Conv(
          fromA: 11,
          toA: 15,
          rot: IntPoint(0, 2),
          trans: IntPoint(-2, 0),
        ),
        Conv(
          fromA: 12,
          toA: 13,
          rot: IntPoint(-2, 0),
          trans: IntPoint(2, 0),
        ),
        Conv(
          fromA: 12,
          toA: 14,
          rot: IntPoint(0, 2),
          trans: IntPoint(-2, 0),
        ),
        Conv(
          fromA: 14,
          toA: 17,
          rot: IntPoint(0, 2),
          trans: IntPoint(-2, 0),
        ),
        Conv(
          fromA: 15,
          toA: 16,
          rot: IntPoint(0, 2),
          trans: IntPoint(-2, 0),
        ),
        Conv(
          fromA: 15,
          toA: 18,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, -2),
        ),
        Conv(
          fromA: 16,
          toA: 18,
          rot: IntPoint(-2, 0),
          trans: IntPoint(2, 0),
        ),
        Conv(
          fromA: 17,
          toA: 18,
          rot: IntPoint(-2, 0),
          trans: IntPoint(-2, 0),
        ),
        Conv(
          fromA: 17,
          toA: 19,
          rot: IntPoint(0, 2),
          trans: IntPoint(-2, 0),
        ),
        Conv(
          fromA: 18,
          toA: 19,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, -2),
        )
      ],
      quads: [
        Quad(
          DoublePoint(0.0457, 0.273),
          DoublePoint(0.273, 0.348),
          DoublePoint(0.500, 0.273),
          DoublePoint(0.273, 0.197),
        ),
        Quad(
          DoublePoint(0.0457, 0.273),
          DoublePoint(0.0456, 0.500),
          DoublePoint(0.273, 0.500),
          DoublePoint(0.273, 0.348),
        ),
        Quad(
          DoublePoint(0.273, 0.348),
          DoublePoint(0.273, 0.500),
          DoublePoint(0.500, 0.500),
          DoublePoint(0.500, 0.273),
        ),
        Quad(
          DoublePoint(0.273, 0.0455),
          DoublePoint(0.273, 0.197),
          DoublePoint(0.500, 0.273),
          DoublePoint(0.500, 0.0456),
        ),
        Quad(
          DoublePoint(0.0458, 0.0455),
          DoublePoint(0.0457, 0.273),
          DoublePoint(0.273, 0.197),
          DoublePoint(0.273, 0.0455),
        ),
        Quad(
          DoublePoint(0.500, 0.273),
          DoublePoint(0.500, 0.500),
          DoublePoint(0.727, 0.500),
          DoublePoint(0.652, 0.273),
        ),
        Quad(
          DoublePoint(0.500, 0.0456),
          DoublePoint(0.500, 0.273),
          DoublePoint(0.652, 0.273),
          DoublePoint(0.727, 0.0457),
        ),
        Quad(
          DoublePoint(0.727, 0.0457),
          DoublePoint(0.652, 0.273),
          DoublePoint(0.727, 0.500),
          DoublePoint(0.803, 0.273),
        ),
        Quad(
          DoublePoint(0.803, 0.273),
          DoublePoint(0.727, 0.500),
          DoublePoint(0.954, 0.500),
          DoublePoint(0.954, 0.273),
        ),
        Quad(
          DoublePoint(0.727, 0.0457),
          DoublePoint(0.803, 0.273),
          DoublePoint(0.954, 0.273),
          DoublePoint(0.955, 0.0458),
        ),
        Quad(
          DoublePoint(0.0456, 0.500),
          DoublePoint(0.0455, 0.727),
          DoublePoint(0.197, 0.727),
          DoublePoint(0.273, 0.500),
        ),
        Quad(
          DoublePoint(0.273, 0.500),
          DoublePoint(0.348, 0.727),
          DoublePoint(0.500, 0.727),
          DoublePoint(0.500, 0.500),
        ),
        Quad(
          DoublePoint(0.273, 0.500),
          DoublePoint(0.197, 0.727),
          DoublePoint(0.273, 0.954),
          DoublePoint(0.348, 0.727),
        ),
        Quad(
          DoublePoint(0.0455, 0.727),
          DoublePoint(0.0455, 0.954),
          DoublePoint(0.273, 0.954),
          DoublePoint(0.197, 0.727),
        ),
        Quad(
          DoublePoint(0.348, 0.727),
          DoublePoint(0.273, 0.954),
          DoublePoint(0.500, 0.954),
          DoublePoint(0.500, 0.727),
        ),
        Quad(
          DoublePoint(0.500, 0.500),
          DoublePoint(0.500, 0.727),
          DoublePoint(0.727, 0.652),
          DoublePoint(0.727, 0.500),
        ),
        Quad(
          DoublePoint(0.727, 0.500),
          DoublePoint(0.727, 0.652),
          DoublePoint(0.954, 0.727),
          DoublePoint(0.954, 0.500),
        ),
        Quad(
          DoublePoint(0.500, 0.727),
          DoublePoint(0.500, 0.954),
          DoublePoint(0.727, 0.954),
          DoublePoint(0.727, 0.803),
        ),
        Quad(
          DoublePoint(0.500, 0.727),
          DoublePoint(0.727, 0.803),
          DoublePoint(0.954, 0.727),
          DoublePoint(0.727, 0.652),
        ),
        Quad(
          DoublePoint(0.727, 0.803),
          DoublePoint(0.727, 0.954),
          DoublePoint(0.954, 0.955),
          DoublePoint(0.954, 0.727),
        )
      ],
      constraints: ConstraintSet(
        coincidents: [
          CoincidentBoardConstraint(
            coords: {
              Coord(19, IntPoint(1, -1)),
              Coord(16, IntPoint(1, 1)),
              Coord(18, IntPoint(1, 1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {Coord(19, IntPoint(-1, 1)), Coord(17, IntPoint(1, 1))},
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(19, IntPoint(-1, -1)),
              Coord(17, IntPoint(1, -1)),
              Coord(18, IntPoint(-1, 1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {Coord(8, IntPoint(1, 1)), Coord(16, IntPoint(1, -1))},
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(16, IntPoint(-1, 1)),
              Coord(15, IntPoint(1, 1)),
              Coord(18, IntPoint(1, -1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(16, IntPoint(-1, -1)),
              Coord(5, IntPoint(1, 1)),
              Coord(15, IntPoint(1, -1)),
              Coord(8, IntPoint(-1, 1)),
              Coord(7, IntPoint(1, 1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(18, IntPoint(-1, -1)),
              Coord(11, IntPoint(1, 1)),
              Coord(17, IntPoint(-1, -1)),
              Coord(15, IntPoint(-1, 1)),
              Coord(14, IntPoint(1, -1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {Coord(17, IntPoint(-1, 1)), Coord(14, IntPoint(1, 1))},
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(15, IntPoint(-1, -1)),
              Coord(2, IntPoint(1, 1)),
              Coord(11, IntPoint(1, -1)),
              Coord(5, IntPoint(-1, 1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(14, IntPoint(-1, 1)),
              Coord(12, IntPoint(1, 1)),
              Coord(13, IntPoint(1, 1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(14, IntPoint(-1, -1)),
              Coord(11, IntPoint(-1, 1)),
              Coord(12, IntPoint(1, -1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {Coord(13, IntPoint(-1, -1)), Coord(10, IntPoint(-1, 1))},
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(13, IntPoint(1, -1)),
              Coord(10, IntPoint(1, 1)),
              Coord(12, IntPoint(-1, 1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(12, IntPoint(-1, -1)),
              Coord(1, IntPoint(1, 1)),
              Coord(11, IntPoint(-1, -1)),
              Coord(10, IntPoint(1, -1)),
              Coord(2, IntPoint(-1, 1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {Coord(10, IntPoint(-1, -1)), Coord(1, IntPoint(-1, 1))},
          ),
          CoincidentBoardConstraint(
            coords: {Coord(9, IntPoint(1, 1)), Coord(8, IntPoint(1, -1))},
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(9, IntPoint(-1, 1)),
              Coord(7, IntPoint(1, -1)),
              Coord(8, IntPoint(-1, -1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(9, IntPoint(-1, -1)),
              Coord(6, IntPoint(1, -1)),
              Coord(7, IntPoint(-1, -1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(5, IntPoint(1, -1)),
              Coord(6, IntPoint(1, 1)),
              Coord(7, IntPoint(-1, 1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {Coord(6, IntPoint(-1, -1)), Coord(3, IntPoint(1, -1))},
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(0, IntPoint(1, 1)),
              Coord(6, IntPoint(-1, 1)),
              Coord(5, IntPoint(-1, -1)),
              Coord(3, IntPoint(1, 1)),
              Coord(2, IntPoint(1, -1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(3, IntPoint(-1, 1)),
              Coord(0, IntPoint(1, -1)),
              Coord(4, IntPoint(1, 1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {Coord(4, IntPoint(1, -1)), Coord(3, IntPoint(-1, -1))},
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(4, IntPoint(-1, 1)),
              Coord(0, IntPoint(-1, -1)),
              Coord(1, IntPoint(-1, -1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(0, IntPoint(-1, 1)),
              Coord(1, IntPoint(1, -1)),
              Coord(2, IntPoint(-1, -1))
            },
          )
        ],
        equidistants: [
          EquidistantBoardConstraint(
            sides: {
              Side(
                Coord(6, IntPoint(1, -1)),
                Coord(5, IntPoint(1, 1)),
              ),
              Side(
                Coord(8, IntPoint(1, -1)),
                Coord(0, IntPoint(1, 1)),
              ),
              Side(
                Coord(0, IntPoint(-1, -1)),
                Coord(0, IntPoint(1, 1)),
              ),
              Side(
                Coord(1, IntPoint(1, 1)),
                Coord(12, IntPoint(1, 1)),
              ),
              Side(
                Coord(11, IntPoint(1, 1)),
                Coord(10, IntPoint(-1, 1)),
              ),
              Side(
                Coord(3, IntPoint(-1, -1)),
                Coord(1, IntPoint(1, 1)),
              ),
              Side(
                Coord(17, IntPoint(1, 1)),
                Coord(5, IntPoint(1, 1)),
              ),
              Side(
                Coord(16, IntPoint(1, 1)),
                Coord(11, IntPoint(1, 1)),
              )
            },
          ),
          EquidistantBoardConstraint(
            sides: {
              Side(
                Coord(5, IntPoint(1, 1)),
                Coord(0, IntPoint(1, 1)),
              ),
              Side(
                Coord(6, IntPoint(1, -1)),
                Coord(0, IntPoint(1, 1)),
              ),
              Side(
                Coord(8, IntPoint(1, -1)),
                Coord(5, IntPoint(1, 1)),
              ),
              Side(
                Coord(8, IntPoint(1, -1)),
                Coord(6, IntPoint(1, -1)),
              ),
              Side(
                Coord(17, IntPoint(1, 1)),
                Coord(16, IntPoint(1, 1)),
              ),
              Side(
                Coord(16, IntPoint(1, 1)),
                Coord(5, IntPoint(1, 1)),
              ),
              Side(
                Coord(11, IntPoint(1, 1)),
                Coord(17, IntPoint(1, 1)),
              ),
              Side(
                Coord(12, IntPoint(1, 1)),
                Coord(11, IntPoint(1, 1)),
              ),
              Side(
                Coord(1, IntPoint(1, 1)),
                Coord(11, IntPoint(1, 1)),
              ),
              Side(
                Coord(11, IntPoint(1, 1)),
                Coord(5, IntPoint(1, 1)),
              ),
              Side(
                Coord(10, IntPoint(-1, 1)),
                Coord(1, IntPoint(1, 1)),
              ),
              Side(
                Coord(1, IntPoint(1, 1)),
                Coord(0, IntPoint(-1, -1)),
              ),
              Side(
                Coord(0, IntPoint(1, 1)),
                Coord(3, IntPoint(-1, -1)),
              ),
              Side(
                Coord(3, IntPoint(-1, -1)),
                Coord(0, IntPoint(-1, -1)),
              ),
              Side(
                Coord(0, IntPoint(1, 1)),
                Coord(1, IntPoint(1, 1)),
              ),
              Side(
                Coord(12, IntPoint(1, 1)),
                Coord(10, IntPoint(-1, 1)),
              )
            },
          ),
          EquidistantBoardConstraint(
            sides: {
              Side(
                Coord(3, IntPoint(-1, -1)),
                Coord(0, IntPoint(1, -1)),
              ),
              Side(
                Coord(0, IntPoint(-1, 1)),
                Coord(0, IntPoint(1, -1)),
              ),
              Side(
                Coord(0, IntPoint(1, 1)),
                Coord(5, IntPoint(1, -1)),
              ),
              Side(
                Coord(8, IntPoint(1, -1)),
                Coord(7, IntPoint(1, -1)),
              ),
              Side(
                Coord(5, IntPoint(1, 1)),
                Coord(15, IntPoint(1, 1)),
              ),
              Side(
                Coord(17, IntPoint(1, 1)),
                Coord(17, IntPoint(1, -1)),
              ),
              Side(
                Coord(11, IntPoint(1, 1)),
                Coord(11, IntPoint(-1, 1)),
              ),
              Side(
                Coord(0, IntPoint(-1, 1)),
                Coord(1, IntPoint(1, 1)),
              ),
              Side(
                Coord(10, IntPoint(1, 1)),
                Coord(10, IntPoint(-1, 1)),
              ),
              Side(
                Coord(7, IntPoint(1, -1)),
                Coord(5, IntPoint(1, -1)),
              ),
              Side(
                Coord(17, IntPoint(1, -1)),
                Coord(15, IntPoint(1, 1)),
              ),
              Side(
                Coord(10, IntPoint(1, 1)),
                Coord(11, IntPoint(-1, 1)),
              )
            },
          ),
          EquidistantBoardConstraint(
            sides: {
              Side(
                Coord(16, IntPoint(1, 1)),
                Coord(8, IntPoint(1, 1)),
              ),
              Side(
                Coord(8, IntPoint(1, 1)),
                Coord(5, IntPoint(1, 1)),
              ),
              Side(
                Coord(12, IntPoint(1, 1)),
                Coord(14, IntPoint(1, 1)),
              ),
              Side(
                Coord(14, IntPoint(1, 1)),
                Coord(11, IntPoint(1, 1)),
              ),
              Side(
                Coord(5, IntPoint(1, 1)),
                Coord(2, IntPoint(1, 1)),
              ),
              Side(
                Coord(11, IntPoint(1, 1)),
                Coord(2, IntPoint(1, 1)),
              ),
              Side(
                Coord(0, IntPoint(1, 1)),
                Coord(2, IntPoint(1, 1)),
              ),
              Side(
                Coord(1, IntPoint(1, 1)),
                Coord(2, IntPoint(1, 1)),
              ),
              Side(
                Coord(0, IntPoint(1, 1)),
                Coord(3, IntPoint(1, -1)),
              ),
              Side(
                Coord(1, IntPoint(-1, 1)),
                Coord(1, IntPoint(1, 1)),
              ),
              Side(
                Coord(6, IntPoint(1, -1)),
                Coord(3, IntPoint(1, -1)),
              ),
              Side(
                Coord(0, IntPoint(-1, -1)),
                Coord(4, IntPoint(-1, -1)),
              ),
              Side(
                Coord(3, IntPoint(-1, -1)),
                Coord(4, IntPoint(-1, -1)),
              ),
              Side(
                Coord(6, IntPoint(1, -1)),
                Coord(9, IntPoint(1, -1)),
              ),
              Side(
                Coord(3, IntPoint(1, -1)),
                Coord(3, IntPoint(-1, -1)),
              ),
              Side(
                Coord(9, IntPoint(1, -1)),
                Coord(8, IntPoint(1, -1)),
              ),
              Side(
                Coord(8, IntPoint(1, -1)),
                Coord(8, IntPoint(1, 1)),
              ),
              Side(
                Coord(19, IntPoint(1, 1)),
                Coord(17, IntPoint(1, 1)),
              ),
              Side(
                Coord(17, IntPoint(1, 1)),
                Coord(14, IntPoint(1, 1)),
              ),
              Side(
                Coord(19, IntPoint(1, 1)),
                Coord(16, IntPoint(1, 1)),
              ),
              Side(
                Coord(13, IntPoint(-1, 1)),
                Coord(12, IntPoint(1, 1)),
              ),
              Side(
                Coord(10, IntPoint(-1, 1)),
                Coord(13, IntPoint(-1, 1)),
              ),
              Side(
                Coord(1, IntPoint(-1, 1)),
                Coord(10, IntPoint(-1, 1)),
              ),
              Side(
                Coord(0, IntPoint(-1, -1)),
                Coord(1, IntPoint(-1, 1)),
              )
            },
          ),
          EquidistantBoardConstraint(
            sides: {
              Side(
                Coord(12, IntPoint(1, 1)),
                Coord(10, IntPoint(1, 1)),
              ),
              Side(
                Coord(10, IntPoint(1, 1)),
                Coord(1, IntPoint(1, 1)),
              ),
              Side(
                Coord(0, IntPoint(-1, 1)),
                Coord(0, IntPoint(1, 1)),
              ),
              Side(
                Coord(1, IntPoint(1, 1)),
                Coord(11, IntPoint(-1, 1)),
              ),
              Side(
                Coord(11, IntPoint(1, 1)),
                Coord(15, IntPoint(1, 1)),
              ),
              Side(
                Coord(11, IntPoint(1, 1)),
                Coord(17, IntPoint(1, -1)),
              ),
              Side(
                Coord(12, IntPoint(1, 1)),
                Coord(11, IntPoint(-1, 1)),
              ),
              Side(
                Coord(15, IntPoint(1, 1)),
                Coord(16, IntPoint(1, 1)),
              ),
              Side(
                Coord(16, IntPoint(1, 1)),
                Coord(17, IntPoint(1, -1)),
              ),
              Side(
                Coord(5, IntPoint(1, -1)),
                Coord(5, IntPoint(1, 1)),
              ),
              Side(
                Coord(5, IntPoint(1, 1)),
                Coord(7, IntPoint(1, -1)),
              ),
              Side(
                Coord(5, IntPoint(1, -1)),
                Coord(6, IntPoint(1, -1)),
              ),
              Side(
                Coord(0, IntPoint(1, 1)),
                Coord(0, IntPoint(1, -1)),
              ),
              Side(
                Coord(6, IntPoint(1, -1)),
                Coord(7, IntPoint(1, -1)),
              ),
              Side(
                Coord(0, IntPoint(-1, -1)),
                Coord(0, IntPoint(1, -1)),
              ),
              Side(
                Coord(0, IntPoint(-1, 1)),
                Coord(0, IntPoint(-1, -1)),
              )
            },
          )
        ],
      ),
    );
  }();
  static final Board eyes2 = () {
    return Board(
      charts: [
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1)
      ],
      convs: [
        Conv(
          fromA: 0,
          toA: 5,
          rot: IntPoint(0, 2),
          trans: IntPoint(-2, 0),
        ),
        Conv(
          fromA: 0,
          toA: 7,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, 2),
        ),
        Conv(
          fromA: 0,
          toA: 10,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, -2),
        ),
        Conv(
          fromA: 1,
          toA: 5,
          rot: IntPoint(2, 0),
          trans: IntPoint(0, -2),
        ),
        Conv(
          fromA: 1,
          toA: 6,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, 2),
        ),
        Conv(
          fromA: 1,
          toA: 9,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, -2),
        ),
        Conv(
          fromA: 2,
          toA: 8,
          rot: IntPoint(0, 2),
          trans: IntPoint(2, 0),
        ),
        Conv(
          fromA: 2,
          toA: 9,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, 2),
        ),
        Conv(
          fromA: 2,
          toA: 11,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, -2),
        ),
        Conv(
          fromA: 3,
          toA: 4,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, -2),
        ),
        Conv(
          fromA: 3,
          toA: 8,
          rot: IntPoint(2, 0),
          trans: IntPoint(0, 2),
        ),
        Conv(
          fromA: 3,
          toA: 10,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, 2),
        ),
        Conv(
          fromA: 4,
          toA: 11,
          rot: IntPoint(0, 2),
          trans: IntPoint(-2, 0),
        ),
        Conv(
          fromA: 5,
          toA: 8,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, -2),
        ),
        Conv(
          fromA: 5,
          toA: 9,
          rot: IntPoint(0, 2),
          trans: IntPoint(-2, 0),
        ),
        Conv(
          fromA: 6,
          toA: 7,
          rot: IntPoint(0, 2),
          trans: IntPoint(2, 0),
        ),
        Conv(
          fromA: 8,
          toA: 10,
          rot: IntPoint(0, 2),
          trans: IntPoint(2, 0),
        )
      ],
      quads: [
        Quad(
          DoublePoint(0.321, 0.241),
          DoublePoint(0.245, 0.422),
          DoublePoint(0.441, 0.422),
          DoublePoint(0.517, 0.241),
        ),
        Quad(
          DoublePoint(0.517, 0.241),
          DoublePoint(0.635, 0.398),
          DoublePoint(0.831, 0.398),
          DoublePoint(0.713, 0.241),
        ),
        Quad(
          DoublePoint(0.559, 0.578),
          DoublePoint(0.483, 0.759),
          DoublePoint(0.679, 0.759),
          DoublePoint(0.755, 0.578),
        ),
        Quad(
          DoublePoint(0.169, 0.602),
          DoublePoint(0.287, 0.759),
          DoublePoint(0.483, 0.759),
          DoublePoint(0.365, 0.602),
        ),
        Quad(
          DoublePoint(0.287, 0.759),
          DoublePoint(0.287, 0.955),
          DoublePoint(0.483, 0.955),
          DoublePoint(0.483, 0.759),
        ),
        Quad(
          DoublePoint(0.517, 0.241),
          DoublePoint(0.441, 0.422),
          DoublePoint(0.559, 0.578),
          DoublePoint(0.635, 0.398),
        ),
        Quad(
          DoublePoint(0.517, 0.0455),
          DoublePoint(0.517, 0.241),
          DoublePoint(0.713, 0.241),
          DoublePoint(0.713, 0.0455),
        ),
        Quad(
          DoublePoint(0.321, 0.0455),
          DoublePoint(0.321, 0.241),
          DoublePoint(0.517, 0.241),
          DoublePoint(0.517, 0.0455),
        ),
        Quad(
          DoublePoint(0.441, 0.422),
          DoublePoint(0.365, 0.602),
          DoublePoint(0.483, 0.759),
          DoublePoint(0.559, 0.578),
        ),
        Quad(
          DoublePoint(0.635, 0.398),
          DoublePoint(0.559, 0.578),
          DoublePoint(0.755, 0.578),
          DoublePoint(0.831, 0.398),
        ),
        Quad(
          DoublePoint(0.245, 0.422),
          DoublePoint(0.169, 0.602),
          DoublePoint(0.365, 0.602),
          DoublePoint(0.441, 0.422),
        ),
        Quad(
          DoublePoint(0.483, 0.759),
          DoublePoint(0.483, 0.955),
          DoublePoint(0.679, 0.955),
          DoublePoint(0.679, 0.759),
        )
      ],
      constraints: ConstraintSet(
        coincidents: [
          CoincidentBoardConstraint(
            coords: {Coord(6, IntPoint(-1, -1)), Coord(7, IntPoint(1, -1))},
          ),
          CoincidentBoardConstraint(
            coords: {Coord(1, IntPoint(1, -1)), Coord(6, IntPoint(1, 1))},
          ),
          CoincidentBoardConstraint(
            coords: {Coord(1, IntPoint(1, 1)), Coord(9, IntPoint(1, -1))},
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(1, IntPoint(-1, -1)),
              Coord(6, IntPoint(-1, 1)),
              Coord(0, IntPoint(1, -1)),
              Coord(7, IntPoint(1, 1)),
              Coord(5, IntPoint(-1, -1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {Coord(7, IntPoint(-1, 1)), Coord(0, IntPoint(-1, -1))},
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(5, IntPoint(1, -1)),
              Coord(1, IntPoint(-1, 1)),
              Coord(9, IntPoint(-1, -1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {Coord(0, IntPoint(-1, 1)), Coord(10, IntPoint(-1, -1))},
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(10, IntPoint(1, -1)),
              Coord(0, IntPoint(1, 1)),
              Coord(5, IntPoint(-1, 1)),
              Coord(8, IntPoint(-1, -1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {Coord(9, IntPoint(1, 1)), Coord(2, IntPoint(1, -1))},
          ),
          CoincidentBoardConstraint(
            coords: {Coord(11, IntPoint(1, -1)), Coord(2, IntPoint(1, 1))},
          ),
          CoincidentBoardConstraint(
            coords: {Coord(4, IntPoint(1, 1)), Coord(11, IntPoint(-1, 1))},
          ),
          CoincidentBoardConstraint(
            coords: {Coord(3, IntPoint(-1, 1)), Coord(4, IntPoint(-1, -1))},
          ),
          CoincidentBoardConstraint(
            coords: {Coord(10, IntPoint(-1, 1)), Coord(3, IntPoint(-1, -1))},
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(9, IntPoint(-1, 1)),
              Coord(5, IntPoint(1, 1)),
              Coord(2, IntPoint(-1, -1)),
              Coord(8, IntPoint(1, -1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(8, IntPoint(-1, 1)),
              Coord(10, IntPoint(1, 1)),
              Coord(3, IntPoint(1, -1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(3, IntPoint(1, 1)),
              Coord(4, IntPoint(1, -1)),
              Coord(8, IntPoint(1, 1)),
              Coord(2, IntPoint(-1, 1)),
              Coord(11, IntPoint(-1, -1))
            },
          )
        ],
        equidistants: [
          EquidistantBoardConstraint(
            sides: {
              Side(
                Coord(0, IntPoint(1, -1)),
                Coord(0, IntPoint(1, 1)),
              ),
              Side(
                Coord(2, IntPoint(-1, -1)),
                Coord(3, IntPoint(1, -1)),
              ),
              Side(
                Coord(0, IntPoint(1, 1)),
                Coord(1, IntPoint(-1, 1)),
              ),
              Side(
                Coord(2, IntPoint(-1, 1)),
                Coord(3, IntPoint(1, -1)),
              ),
              Side(
                Coord(2, IntPoint(-1, -1)),
                Coord(0, IntPoint(1, 1)),
              ),
              Side(
                Coord(3, IntPoint(1, -1)),
                Coord(0, IntPoint(1, 1)),
              ),
              Side(
                Coord(2, IntPoint(-1, -1)),
                Coord(2, IntPoint(-1, 1)),
              ),
              Side(
                Coord(1, IntPoint(-1, 1)),
                Coord(2, IntPoint(-1, -1)),
              ),
              Side(
                Coord(0, IntPoint(1, -1)),
                Coord(1, IntPoint(-1, 1)),
              )
            },
          ),
          EquidistantBoardConstraint(
            sides: {
              Side(
                Coord(2, IntPoint(-1, 1)),
                Coord(11, IntPoint(1, 1)),
              ),
              Side(
                Coord(0, IntPoint(1, -1)),
                Coord(7, IntPoint(-1, -1)),
              ),
              Side(
                Coord(0, IntPoint(-1, -1)),
                Coord(6, IntPoint(-1, -1)),
              ),
              Side(
                Coord(1, IntPoint(1, -1)),
                Coord(6, IntPoint(-1, -1)),
              ),
              Side(
                Coord(0, IntPoint(1, -1)),
                Coord(6, IntPoint(1, -1)),
              ),
              Side(
                Coord(2, IntPoint(-1, 1)),
                Coord(4, IntPoint(-1, 1)),
              ),
              Side(
                Coord(3, IntPoint(-1, 1)),
                Coord(4, IntPoint(1, 1)),
              ),
              Side(
                Coord(4, IntPoint(1, 1)),
                Coord(2, IntPoint(1, 1)),
              )
            },
          ),
          EquidistantBoardConstraint(
            sides: {
              Side(
                Coord(6, IntPoint(1, -1)),
                Coord(11, IntPoint(1, 1)),
              ),
              Side(
                Coord(4, IntPoint(-1, 1)),
                Coord(7, IntPoint(-1, -1)),
              ),
              Side(
                Coord(6, IntPoint(-1, -1)),
                Coord(4, IntPoint(1, 1)),
              )
            },
          ),
          EquidistantBoardConstraint(
            sides: {
              Side(
                Coord(2, IntPoint(-1, 1)),
                Coord(3, IntPoint(-1, 1)),
              ),
              Side(
                Coord(2, IntPoint(-1, 1)),
                Coord(4, IntPoint(1, 1)),
              ),
              Side(
                Coord(2, IntPoint(1, 1)),
                Coord(2, IntPoint(-1, 1)),
              ),
              Side(
                Coord(2, IntPoint(-1, -1)),
                Coord(2, IntPoint(1, -1)),
              ),
              Side(
                Coord(1, IntPoint(1, 1)),
                Coord(1, IntPoint(-1, 1)),
              ),
              Side(
                Coord(1, IntPoint(1, 1)),
                Coord(2, IntPoint(1, -1)),
              ),
              Side(
                Coord(1, IntPoint(1, -1)),
                Coord(0, IntPoint(1, -1)),
              ),
              Side(
                Coord(6, IntPoint(-1, -1)),
                Coord(0, IntPoint(1, -1)),
              ),
              Side(
                Coord(0, IntPoint(-1, -1)),
                Coord(0, IntPoint(1, -1)),
              ),
              Side(
                Coord(0, IntPoint(-1, 1)),
                Coord(0, IntPoint(1, 1)),
              ),
              Side(
                Coord(3, IntPoint(-1, -1)),
                Coord(3, IntPoint(1, -1)),
              ),
              Side(
                Coord(4, IntPoint(-1, 1)),
                Coord(4, IntPoint(1, 1)),
              ),
              Side(
                Coord(11, IntPoint(1, 1)),
                Coord(4, IntPoint(1, 1)),
              ),
              Side(
                Coord(2, IntPoint(1, 1)),
                Coord(11, IntPoint(1, 1)),
              ),
              Side(
                Coord(2, IntPoint(1, -1)),
                Coord(2, IntPoint(1, 1)),
              ),
              Side(
                Coord(1, IntPoint(1, -1)),
                Coord(1, IntPoint(1, 1)),
              ),
              Side(
                Coord(6, IntPoint(1, -1)),
                Coord(1, IntPoint(1, -1)),
              ),
              Side(
                Coord(6, IntPoint(-1, -1)),
                Coord(6, IntPoint(1, -1)),
              ),
              Side(
                Coord(7, IntPoint(-1, -1)),
                Coord(6, IntPoint(-1, -1)),
              ),
              Side(
                Coord(0, IntPoint(-1, -1)),
                Coord(7, IntPoint(-1, -1)),
              ),
              Side(
                Coord(0, IntPoint(-1, 1)),
                Coord(0, IntPoint(-1, -1)),
              ),
              Side(
                Coord(3, IntPoint(-1, -1)),
                Coord(0, IntPoint(-1, 1)),
              ),
              Side(
                Coord(3, IntPoint(-1, 1)),
                Coord(3, IntPoint(-1, -1)),
              ),
              Side(
                Coord(4, IntPoint(-1, 1)),
                Coord(3, IntPoint(-1, 1)),
              )
            },
          )
        ],
      ),
    );
  }();
  static final Board star4 = () {
    return Board(
      charts: [(1, 1), (1, 1), (1, 1), (1, 1), (1, 1), (1, 1), (1, 1), (1, 1)],
      convs: [
        Conv(
          fromA: 0,
          toA: 3,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, -2),
        ),
        Conv(
          fromA: 0,
          toA: 5,
          rot: IntPoint(2, 0),
          trans: IntPoint(2, 0),
        ),
        Conv(
          fromA: 0,
          toA: 6,
          rot: IntPoint(0, 2),
          trans: IntPoint(2, 0),
        ),
        Conv(
          fromA: 0,
          toA: 7,
          rot: IntPoint(0, 2),
          trans: IntPoint(-2, 0),
        ),
        Conv(
          fromA: 1,
          toA: 2,
          rot: IntPoint(0, 2),
          trans: IntPoint(2, 0),
        ),
        Conv(
          fromA: 1,
          toA: 3,
          rot: IntPoint(0, 2),
          trans: IntPoint(-2, 0),
        ),
        Conv(
          fromA: 1,
          toA: 4,
          rot: IntPoint(2, 0),
          trans: IntPoint(-2, 0),
        ),
        Conv(
          fromA: 1,
          toA: 6,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, 2),
        ),
        Conv(
          fromA: 2,
          toA: 6,
          rot: IntPoint(-2, 0),
          trans: IntPoint(-2, 0),
        ),
        Conv(
          fromA: 3,
          toA: 4,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, -2),
        ),
        Conv(
          fromA: 3,
          toA: 7,
          rot: IntPoint(2, 0),
          trans: IntPoint(0, 2),
        ),
        Conv(
          fromA: 5,
          toA: 6,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, -2),
        )
      ],
      quads: [
        Quad(
          DoublePoint(0.666, 0.334),
          DoublePoint(0.500, 0.500),
          DoublePoint(0.666, 0.666),
          DoublePoint(0.955, 0.500),
        ),
        Quad(
          DoublePoint(0.334, 0.334),
          DoublePoint(0.0455, 0.500),
          DoublePoint(0.334, 0.666),
          DoublePoint(0.500, 0.500),
        ),
        Quad(
          DoublePoint(0.500, 0.0455),
          DoublePoint(0.0455, 0.0455),
          DoublePoint(0.0455, 0.500),
          DoublePoint(0.334, 0.334),
        ),
        Quad(
          DoublePoint(0.500, 0.500),
          DoublePoint(0.334, 0.666),
          DoublePoint(0.500, 0.955),
          DoublePoint(0.666, 0.666),
        ),
        Quad(
          DoublePoint(0.334, 0.666),
          DoublePoint(0.0455, 0.500),
          DoublePoint(0.0455, 0.955),
          DoublePoint(0.500, 0.955),
        ),
        Quad(
          DoublePoint(0.955, 0.0455),
          DoublePoint(0.500, 0.0455),
          DoublePoint(0.666, 0.334),
          DoublePoint(0.955, 0.500),
        ),
        Quad(
          DoublePoint(0.500, 0.0455),
          DoublePoint(0.334, 0.334),
          DoublePoint(0.500, 0.500),
          DoublePoint(0.666, 0.334),
        ),
        Quad(
          DoublePoint(0.955, 0.500),
          DoublePoint(0.666, 0.666),
          DoublePoint(0.500, 0.955),
          DoublePoint(0.955, 0.955),
        )
      ],
      constraints: ConstraintSet(
        coincidents: [
          CoincidentBoardConstraint(
            coords: {
              Coord(6, IntPoint(-1, -1)),
              Coord(5, IntPoint(-1, 1)),
              Coord(2, IntPoint(-1, -1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(1, IntPoint(-1, 1)),
              Coord(2, IntPoint(1, 1)),
              Coord(4, IntPoint(-1, 1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(3, IntPoint(1, 1)),
              Coord(4, IntPoint(1, -1)),
              Coord(7, IntPoint(1, 1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(0, IntPoint(1, -1)),
              Coord(7, IntPoint(-1, -1)),
              Coord(5, IntPoint(1, -1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(0, IntPoint(1, 1)),
              Coord(7, IntPoint(-1, 1)),
              Coord(3, IntPoint(1, -1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(1, IntPoint(1, 1)),
              Coord(4, IntPoint(-1, -1)),
              Coord(3, IntPoint(-1, 1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(1, IntPoint(-1, -1)),
              Coord(2, IntPoint(1, -1)),
              Coord(6, IntPoint(-1, 1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(0, IntPoint(-1, -1)),
              Coord(5, IntPoint(1, 1)),
              Coord(6, IntPoint(1, -1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(3, IntPoint(-1, -1)),
              Coord(0, IntPoint(-1, 1)),
              Coord(1, IntPoint(1, -1)),
              Coord(6, IntPoint(1, 1))
            },
          )
        ],
        equidistants: [
          EquidistantBoardConstraint(
            sides: {
              Side(
                Coord(3, IntPoint(1, 1)),
                Coord(0, IntPoint(1, -1)),
              ),
              Side(
                Coord(0, IntPoint(-1, 1)),
                Coord(5, IntPoint(-1, -1)),
              ),
              Side(
                Coord(0, IntPoint(1, -1)),
                Coord(2, IntPoint(-1, -1)),
              ),
              Side(
                Coord(1, IntPoint(-1, 1)),
                Coord(2, IntPoint(-1, -1)),
              ),
              Side(
                Coord(3, IntPoint(1, 1)),
                Coord(1, IntPoint(-1, 1)),
              ),
              Side(
                Coord(7, IntPoint(1, -1)),
                Coord(0, IntPoint(-1, 1)),
              ),
              Side(
                Coord(0, IntPoint(-1, 1)),
                Coord(4, IntPoint(1, 1)),
              ),
              Side(
                Coord(2, IntPoint(-1, 1)),
                Coord(0, IntPoint(-1, 1)),
              )
            },
          ),
          EquidistantBoardConstraint(
            sides: {
              Side(
                Coord(1, IntPoint(1, 1)),
                Coord(1, IntPoint(-1, -1)),
              ),
              Side(
                Coord(0, IntPoint(-1, -1)),
                Coord(0, IntPoint(1, -1)),
              ),
              Side(
                Coord(0, IntPoint(-1, -1)),
                Coord(1, IntPoint(-1, -1)),
              ),
              Side(
                Coord(0, IntPoint(1, 1)),
                Coord(1, IntPoint(1, 1)),
              ),
              Side(
                Coord(0, IntPoint(1, 1)),
                Coord(0, IntPoint(-1, -1)),
              ),
              Side(
                Coord(1, IntPoint(-1, -1)),
                Coord(2, IntPoint(-1, -1)),
              ),
              Side(
                Coord(1, IntPoint(-1, 1)),
                Coord(1, IntPoint(-1, -1)),
              ),
              Side(
                Coord(1, IntPoint(1, 1)),
                Coord(1, IntPoint(-1, 1)),
              ),
              Side(
                Coord(3, IntPoint(1, 1)),
                Coord(1, IntPoint(1, 1)),
              ),
              Side(
                Coord(0, IntPoint(1, 1)),
                Coord(3, IntPoint(1, 1)),
              ),
              Side(
                Coord(0, IntPoint(1, 1)),
                Coord(0, IntPoint(1, -1)),
              ),
              Side(
                Coord(2, IntPoint(-1, -1)),
                Coord(0, IntPoint(-1, -1)),
              )
            },
          ),
          EquidistantBoardConstraint(
            sides: {
              Side(
                Coord(0, IntPoint(-1, 1)),
                Coord(0, IntPoint(-1, -1)),
              ),
              Side(
                Coord(0, IntPoint(-1, 1)),
                Coord(0, IntPoint(1, 1)),
              ),
              Side(
                Coord(1, IntPoint(1, 1)),
                Coord(0, IntPoint(-1, 1)),
              ),
              Side(
                Coord(1, IntPoint(-1, -1)),
                Coord(0, IntPoint(-1, 1)),
              )
            },
          ),
          EquidistantBoardConstraint(
            sides: {
              Side(
                Coord(0, IntPoint(1, -1)),
                Coord(5, IntPoint(-1, -1)),
              ),
              Side(
                Coord(7, IntPoint(1, -1)),
                Coord(0, IntPoint(1, -1)),
              ),
              Side(
                Coord(2, IntPoint(-1, -1)),
                Coord(5, IntPoint(-1, -1)),
              ),
              Side(
                Coord(2, IntPoint(-1, 1)),
                Coord(2, IntPoint(-1, -1)),
              ),
              Side(
                Coord(2, IntPoint(-1, 1)),
                Coord(1, IntPoint(-1, 1)),
              ),
              Side(
                Coord(1, IntPoint(-1, 1)),
                Coord(4, IntPoint(1, 1)),
              ),
              Side(
                Coord(4, IntPoint(1, 1)),
                Coord(3, IntPoint(1, 1)),
              ),
              Side(
                Coord(3, IntPoint(1, 1)),
                Coord(7, IntPoint(1, -1)),
              )
            },
          )
        ],
      ),
    );
  }();
  static final Board star5 = () {
    return Board(
      charts: [
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1)
      ],
      convs: [
        Conv(
          fromA: 0,
          toA: 2,
          rot: IntPoint(-2, 0),
          trans: IntPoint(-2, 0),
        ),
        Conv(
          fromA: 0,
          toA: 3,
          rot: IntPoint(0, 2),
          trans: IntPoint(2, 0),
        ),
        Conv(
          fromA: 0,
          toA: 6,
          rot: IntPoint(-2, 0),
          trans: IntPoint(2, 0),
        ),
        Conv(
          fromA: 0,
          toA: 7,
          rot: IntPoint(0, 2),
          trans: IntPoint(-2, 0),
        ),
        Conv(
          fromA: 1,
          toA: 2,
          rot: IntPoint(-2, 0),
          trans: IntPoint(0, -2),
        ),
        Conv(
          fromA: 1,
          toA: 4,
          rot: IntPoint(-2, 0),
          trans: IntPoint(2, 0),
        ),
        Conv(
          fromA: 1,
          toA: 5,
          rot: IntPoint(0, 2),
          trans: IntPoint(2, 0),
        ),
        Conv(
          fromA: 1,
          toA: 9,
          rot: IntPoint(-2, 0),
          trans: IntPoint(-2, 0),
        ),
        Conv(
          fromA: 2,
          toA: 7,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, -2),
        ),
        Conv(
          fromA: 2,
          toA: 9,
          rot: IntPoint(2, 0),
          trans: IntPoint(0, 2),
        ),
        Conv(
          fromA: 3,
          toA: 4,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, 2),
        ),
        Conv(
          fromA: 3,
          toA: 6,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, -2),
        ),
        Conv(
          fromA: 3,
          toA: 8,
          rot: IntPoint(0, 2),
          trans: IntPoint(2, 0),
        ),
        Conv(
          fromA: 4,
          toA: 5,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, 2),
        ),
        Conv(
          fromA: 4,
          toA: 8,
          rot: IntPoint(2, 0),
          trans: IntPoint(0, -2),
        )
      ],
      quads: [
        Quad(
          DoublePoint(0.500, 0.550),
          DoublePoint(0.273, 0.476),
          DoublePoint(0.132, 0.670),
          DoublePoint(0.360, 0.744),
        ),
        Quad(
          DoublePoint(0.868, 0.670),
          DoublePoint(0.727, 0.476),
          DoublePoint(0.500, 0.550),
          DoublePoint(0.640, 0.744),
        ),
        Quad(
          DoublePoint(0.500, 0.550),
          DoublePoint(0.360, 0.744),
          DoublePoint(0.500, 0.937),
          DoublePoint(0.640, 0.744),
        ),
        Quad(
          DoublePoint(0.500, 0.311),
          DoublePoint(0.273, 0.237),
          DoublePoint(0.273, 0.476),
          DoublePoint(0.500, 0.550),
        ),
        Quad(
          DoublePoint(0.727, 0.237),
          DoublePoint(0.500, 0.311),
          DoublePoint(0.500, 0.550),
          DoublePoint(0.727, 0.476),
        ),
        Quad(
          DoublePoint(0.955, 0.403),
          DoublePoint(0.727, 0.237),
          DoublePoint(0.727, 0.476),
          DoublePoint(0.868, 0.670),
        ),
        Quad(
          DoublePoint(0.273, 0.237),
          DoublePoint(0.0455, 0.403),
          DoublePoint(0.132, 0.670),
          DoublePoint(0.273, 0.476),
        ),
        Quad(
          DoublePoint(0.360, 0.744),
          DoublePoint(0.132, 0.670),
          DoublePoint(0.219, 0.937),
          DoublePoint(0.500, 0.937),
        ),
        Quad(
          DoublePoint(0.727, 0.237),
          DoublePoint(0.500, 0.0723),
          DoublePoint(0.273, 0.237),
          DoublePoint(0.500, 0.311),
        ),
        Quad(
          DoublePoint(0.868, 0.670),
          DoublePoint(0.640, 0.744),
          DoublePoint(0.500, 0.937),
          DoublePoint(0.781, 0.937),
        )
      ],
      constraints: ConstraintSet(
        coincidents: [
          CoincidentBoardConstraint(
            coords: {
              Coord(7, IntPoint(-1, 1)),
              Coord(0, IntPoint(1, 1)),
              Coord(6, IntPoint(1, 1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(7, IntPoint(1, -1)),
              Coord(2, IntPoint(1, 1)),
              Coord(9, IntPoint(1, 1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(7, IntPoint(-1, -1)),
              Coord(0, IntPoint(1, -1)),
              Coord(2, IntPoint(-1, 1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(1, IntPoint(-1, -1)),
              Coord(9, IntPoint(-1, -1)),
              Coord(5, IntPoint(1, -1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(9, IntPoint(-1, 1)),
              Coord(1, IntPoint(1, -1)),
              Coord(2, IntPoint(1, -1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(6, IntPoint(1, -1)),
              Coord(0, IntPoint(-1, 1)),
              Coord(3, IntPoint(1, 1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(6, IntPoint(-1, -1)),
              Coord(3, IntPoint(-1, 1)),
              Coord(8, IntPoint(1, 1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(8, IntPoint(-1, -1)),
              Coord(4, IntPoint(-1, -1)),
              Coord(5, IntPoint(-1, 1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(8, IntPoint(1, -1)),
              Coord(3, IntPoint(-1, -1)),
              Coord(4, IntPoint(-1, 1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(5, IntPoint(1, 1)),
              Coord(1, IntPoint(-1, 1)),
              Coord(4, IntPoint(1, -1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(2, IntPoint(-1, -1)),
              Coord(1, IntPoint(1, 1)),
              Coord(0, IntPoint(-1, -1)),
              Coord(3, IntPoint(1, -1)),
              Coord(4, IntPoint(1, 1))
            },
          )
        ],
        equidistants: [
          EquidistantBoardConstraint(
            sides: {
              Side(
                Coord(0, IntPoint(-1, 1)),
                Coord(6, IntPoint(-1, 1)),
              ),
              Side(
                Coord(9, IntPoint(1, -1)),
                Coord(1, IntPoint(1, -1)),
              ),
              Side(
                Coord(3, IntPoint(-1, -1)),
                Coord(8, IntPoint(-1, 1)),
              ),
              Side(
                Coord(5, IntPoint(-1, -1)),
                Coord(1, IntPoint(-1, 1)),
              ),
              Side(
                Coord(0, IntPoint(1, -1)),
                Coord(7, IntPoint(1, 1)),
              ),
              Side(
                Coord(2, IntPoint(1, 1)),
                Coord(0, IntPoint(1, -1)),
              ),
              Side(
                Coord(0, IntPoint(-1, -1)),
                Coord(0, IntPoint(-1, 1)),
              ),
              Side(
                Coord(0, IntPoint(-1, 1)),
                Coord(3, IntPoint(-1, 1)),
              ),
              Side(
                Coord(0, IntPoint(1, -1)),
                Coord(0, IntPoint(-1, -1)),
              ),
              Side(
                Coord(0, IntPoint(-1, -1)),
                Coord(1, IntPoint(-1, 1)),
              ),
              Side(
                Coord(0, IntPoint(-1, -1)),
                Coord(1, IntPoint(1, -1)),
              ),
              Side(
                Coord(0, IntPoint(-1, -1)),
                Coord(3, IntPoint(-1, -1)),
              ),
              Side(
                Coord(1, IntPoint(-1, 1)),
                Coord(4, IntPoint(-1, -1)),
              ),
              Side(
                Coord(3, IntPoint(-1, -1)),
                Coord(4, IntPoint(-1, -1)),
              ),
              Side(
                Coord(1, IntPoint(-1, -1)),
                Coord(1, IntPoint(-1, 1)),
              ),
              Side(
                Coord(1, IntPoint(1, -1)),
                Coord(1, IntPoint(-1, -1)),
              ),
              Side(
                Coord(2, IntPoint(1, 1)),
                Coord(1, IntPoint(1, -1)),
              ),
              Side(
                Coord(0, IntPoint(1, 1)),
                Coord(0, IntPoint(1, -1)),
              ),
              Side(
                Coord(0, IntPoint(-1, 1)),
                Coord(0, IntPoint(1, 1)),
              ),
              Side(
                Coord(3, IntPoint(-1, 1)),
                Coord(3, IntPoint(-1, -1)),
              )
            },
          ),
          EquidistantBoardConstraint(
            sides: {
              Side(
                Coord(1, IntPoint(-1, 1)),
                Coord(3, IntPoint(-1, -1)),
              ),
              Side(
                Coord(0, IntPoint(-1, 1)),
                Coord(0, IntPoint(1, -1)),
              ),
              Side(
                Coord(3, IntPoint(-1, -1)),
                Coord(0, IntPoint(-1, 1)),
              ),
              Side(
                Coord(0, IntPoint(1, -1)),
                Coord(1, IntPoint(1, -1)),
              ),
              Side(
                Coord(1, IntPoint(1, -1)),
                Coord(1, IntPoint(-1, 1)),
              )
            },
          ),
          EquidistantBoardConstraint(
            sides: {
              Side(
                Coord(1, IntPoint(-1, -1)),
                Coord(5, IntPoint(-1, -1)),
              ),
              Side(
                Coord(3, IntPoint(-1, 1)),
                Coord(6, IntPoint(-1, 1)),
              ),
              Side(
                Coord(9, IntPoint(1, -1)),
                Coord(1, IntPoint(-1, -1)),
              ),
              Side(
                Coord(2, IntPoint(1, 1)),
                Coord(9, IntPoint(1, -1)),
              ),
              Side(
                Coord(7, IntPoint(1, 1)),
                Coord(2, IntPoint(1, 1)),
              ),
              Side(
                Coord(5, IntPoint(-1, -1)),
                Coord(4, IntPoint(-1, -1)),
              ),
              Side(
                Coord(6, IntPoint(-1, 1)),
                Coord(0, IntPoint(1, 1)),
              ),
              Side(
                Coord(0, IntPoint(1, 1)),
                Coord(7, IntPoint(1, 1)),
              ),
              Side(
                Coord(8, IntPoint(-1, 1)),
                Coord(4, IntPoint(-1, -1)),
              ),
              Side(
                Coord(8, IntPoint(-1, 1)),
                Coord(3, IntPoint(-1, 1)),
              )
            },
          )
        ],
      ),
    );
  }();
  static final Board star6 = () {
    return Board(
      charts: [
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1)
      ],
      convs: [
        Conv(
          fromA: 0,
          toA: 1,
          rot: IntPoint(-2, 0),
          trans: IntPoint(0, 2),
        ),
        Conv(
          fromA: 0,
          toA: 6,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, 2),
        ),
        Conv(
          fromA: 0,
          toA: 7,
          rot: IntPoint(-2, 0),
          trans: IntPoint(0, -2),
        ),
        Conv(
          fromA: 0,
          toA: 8,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, -2),
        ),
        Conv(
          fromA: 1,
          toA: 6,
          rot: IntPoint(0, 2),
          trans: IntPoint(-2, 0),
        ),
        Conv(
          fromA: 2,
          toA: 5,
          rot: IntPoint(2, 0),
          trans: IntPoint(0, 2),
        ),
        Conv(
          fromA: 2,
          toA: 7,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, 2),
        ),
        Conv(
          fromA: 3,
          toA: 4,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, 2),
        ),
        Conv(
          fromA: 3,
          toA: 6,
          rot: IntPoint(0, 2),
          trans: IntPoint(2, 0),
        ),
        Conv(
          fromA: 3,
          toA: 9,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, -2),
        ),
        Conv(
          fromA: 3,
          toA: 10,
          rot: IntPoint(0, 2),
          trans: IntPoint(-2, 0),
        ),
        Conv(
          fromA: 4,
          toA: 6,
          rot: IntPoint(2, 0),
          trans: IntPoint(0, -2),
        ),
        Conv(
          fromA: 5,
          toA: 7,
          rot: IntPoint(0, 2),
          trans: IntPoint(2, 0),
        ),
        Conv(
          fromA: 5,
          toA: 9,
          rot: IntPoint(-2, 0),
          trans: IntPoint(-2, 0),
        ),
        Conv(
          fromA: 5,
          toA: 11,
          rot: IntPoint(0, 2),
          trans: IntPoint(-2, 0),
        ),
        Conv(
          fromA: 7,
          toA: 8,
          rot: IntPoint(0, 2),
          trans: IntPoint(2, 0),
        ),
        Conv(
          fromA: 9,
          toA: 10,
          rot: IntPoint(2, 0),
          trans: IntPoint(0, 2),
        ),
        Conv(
          fromA: 9,
          toA: 11,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, -2),
        )
      ],
      quads: [
        Quad(
          DoublePoint(0.386, 0.303),
          DoublePoint(0.159, 0.303),
          DoublePoint(0.273, 0.500),
          DoublePoint(0.500, 0.500),
        ),
        Quad(
          DoublePoint(0.273, 0.106),
          DoublePoint(0.159, 0.303),
          DoublePoint(0.386, 0.303),
          DoublePoint(0.500, 0.106),
        ),
        Quad(
          DoublePoint(0.159, 0.697),
          DoublePoint(0.273, 0.894),
          DoublePoint(0.500, 0.894),
          DoublePoint(0.386, 0.697),
        ),
        Quad(
          DoublePoint(0.614, 0.303),
          DoublePoint(0.500, 0.500),
          DoublePoint(0.727, 0.500),
          DoublePoint(0.841, 0.303),
        ),
        Quad(
          DoublePoint(0.500, 0.106),
          DoublePoint(0.614, 0.303),
          DoublePoint(0.841, 0.303),
          DoublePoint(0.727, 0.106),
        ),
        Quad(
          DoublePoint(0.500, 0.500),
          DoublePoint(0.386, 0.697),
          DoublePoint(0.500, 0.894),
          DoublePoint(0.614, 0.697),
        ),
        Quad(
          DoublePoint(0.500, 0.106),
          DoublePoint(0.386, 0.303),
          DoublePoint(0.500, 0.500),
          DoublePoint(0.614, 0.303),
        ),
        Quad(
          DoublePoint(0.273, 0.500),
          DoublePoint(0.159, 0.697),
          DoublePoint(0.386, 0.697),
          DoublePoint(0.500, 0.500),
        ),
        Quad(
          DoublePoint(0.159, 0.303),
          DoublePoint(0.0455, 0.500),
          DoublePoint(0.159, 0.697),
          DoublePoint(0.273, 0.500),
        ),
        Quad(
          DoublePoint(0.500, 0.500),
          DoublePoint(0.614, 0.697),
          DoublePoint(0.841, 0.697),
          DoublePoint(0.727, 0.500),
        ),
        Quad(
          DoublePoint(0.841, 0.303),
          DoublePoint(0.727, 0.500),
          DoublePoint(0.841, 0.697),
          DoublePoint(0.955, 0.500),
        ),
        Quad(
          DoublePoint(0.614, 0.697),
          DoublePoint(0.500, 0.894),
          DoublePoint(0.727, 0.894),
          DoublePoint(0.841, 0.697),
        )
      ],
      constraints: ConstraintSet(
        coincidents: [
          CoincidentBoardConstraint(
            coords: {
              Coord(1, IntPoint(1, -1)),
              Coord(4, IntPoint(-1, -1)),
              Coord(6, IntPoint(-1, -1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(8, IntPoint(-1, -1)),
              Coord(1, IntPoint(-1, 1)),
              Coord(0, IntPoint(-1, 1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(2, IntPoint(-1, -1)),
              Coord(8, IntPoint(1, 1)),
              Coord(7, IntPoint(-1, 1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(2, IntPoint(1, 1)),
              Coord(11, IntPoint(-1, 1)),
              Coord(5, IntPoint(1, 1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(10, IntPoint(1, 1)),
              Coord(11, IntPoint(1, -1)),
              Coord(9, IntPoint(1, 1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(3, IntPoint(1, -1)),
              Coord(4, IntPoint(1, 1)),
              Coord(10, IntPoint(-1, -1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(9, IntPoint(1, -1)),
              Coord(10, IntPoint(-1, 1)),
              Coord(3, IntPoint(1, 1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(1, IntPoint(1, 1)),
              Coord(6, IntPoint(-1, 1)),
              Coord(0, IntPoint(-1, -1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(7, IntPoint(-1, -1)),
              Coord(0, IntPoint(1, 1)),
              Coord(8, IntPoint(1, -1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(2, IntPoint(1, -1)),
              Coord(5, IntPoint(-1, 1)),
              Coord(7, IntPoint(1, 1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(4, IntPoint(-1, 1)),
              Coord(6, IntPoint(1, -1)),
              Coord(3, IntPoint(-1, -1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(11, IntPoint(-1, -1)),
              Coord(5, IntPoint(1, -1)),
              Coord(9, IntPoint(-1, 1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(7, IntPoint(1, -1)),
              Coord(0, IntPoint(1, -1)),
              Coord(5, IntPoint(-1, -1)),
              Coord(9, IntPoint(-1, -1)),
              Coord(6, IntPoint(1, 1)),
              Coord(3, IntPoint(-1, 1))
            },
          )
        ],
        equidistants: [
          EquidistantBoardConstraint(
            sides: {
              Side(
                Coord(2, IntPoint(1, -1)),
                Coord(2, IntPoint(-1, 1)),
              ),
              Side(
                Coord(10, IntPoint(1, -1)),
                Coord(3, IntPoint(1, 1)),
              ),
              Side(
                Coord(2, IntPoint(1, -1)),
                Coord(2, IntPoint(1, 1)),
              ),
              Side(
                Coord(0, IntPoint(1, 1)),
                Coord(8, IntPoint(-1, 1)),
              ),
              Side(
                Coord(2, IntPoint(1, -1)),
                Coord(0, IntPoint(1, 1)),
              ),
              Side(
                Coord(5, IntPoint(1, -1)),
                Coord(2, IntPoint(1, -1)),
              ),
              Side(
                Coord(11, IntPoint(1, 1)),
                Coord(5, IntPoint(1, -1)),
              ),
              Side(
                Coord(3, IntPoint(1, 1)),
                Coord(5, IntPoint(1, -1)),
              ),
              Side(
                Coord(3, IntPoint(-1, -1)),
                Coord(3, IntPoint(1, 1)),
              ),
              Side(
                Coord(4, IntPoint(1, -1)),
                Coord(3, IntPoint(-1, -1)),
              ),
              Side(
                Coord(0, IntPoint(-1, -1)),
                Coord(3, IntPoint(-1, -1)),
              ),
              Side(
                Coord(1, IntPoint(-1, -1)),
                Coord(0, IntPoint(-1, -1)),
              ),
              Side(
                Coord(0, IntPoint(1, 1)),
                Coord(0, IntPoint(-1, -1)),
              ),
              Side(
                Coord(2, IntPoint(1, -1)),
                Coord(0, IntPoint(1, -1)),
              ),
              Side(
                Coord(2, IntPoint(-1, 1)),
                Coord(2, IntPoint(-1, -1)),
              ),
              Side(
                Coord(2, IntPoint(1, -1)),
                Coord(2, IntPoint(-1, -1)),
              ),
              Side(
                Coord(5, IntPoint(1, -1)),
                Coord(2, IntPoint(1, 1)),
              ),
              Side(
                Coord(9, IntPoint(1, 1)),
                Coord(5, IntPoint(1, -1)),
              ),
              Side(
                Coord(3, IntPoint(1, 1)),
                Coord(9, IntPoint(1, 1)),
              ),
              Side(
                Coord(3, IntPoint(1, -1)),
                Coord(3, IntPoint(1, 1)),
              ),
              Side(
                Coord(3, IntPoint(-1, -1)),
                Coord(3, IntPoint(1, -1)),
              ),
              Side(
                Coord(1, IntPoint(1, -1)),
                Coord(3, IntPoint(-1, -1)),
              ),
              Side(
                Coord(0, IntPoint(-1, -1)),
                Coord(1, IntPoint(1, -1)),
              ),
              Side(
                Coord(0, IntPoint(-1, 1)),
                Coord(0, IntPoint(-1, -1)),
              ),
              Side(
                Coord(0, IntPoint(1, 1)),
                Coord(0, IntPoint(-1, 1)),
              ),
              Side(
                Coord(2, IntPoint(-1, -1)),
                Coord(0, IntPoint(1, 1)),
              ),
              Side(
                Coord(0, IntPoint(1, -1)),
                Coord(0, IntPoint(1, 1)),
              ),
              Side(
                Coord(0, IntPoint(1, -1)),
                Coord(0, IntPoint(-1, -1)),
              ),
              Side(
                Coord(3, IntPoint(-1, -1)),
                Coord(0, IntPoint(1, -1)),
              ),
              Side(
                Coord(3, IntPoint(1, 1)),
                Coord(0, IntPoint(1, -1)),
              ),
              Side(
                Coord(5, IntPoint(1, -1)),
                Coord(0, IntPoint(1, -1)),
              ),
              Side(
                Coord(2, IntPoint(1, 1)),
                Coord(2, IntPoint(-1, 1)),
              ),
              Side(
                Coord(11, IntPoint(1, 1)),
                Coord(2, IntPoint(1, 1)),
              ),
              Side(
                Coord(9, IntPoint(1, 1)),
                Coord(11, IntPoint(1, 1)),
              ),
              Side(
                Coord(10, IntPoint(1, -1)),
                Coord(9, IntPoint(1, 1)),
              ),
              Side(
                Coord(3, IntPoint(1, -1)),
                Coord(10, IntPoint(1, -1)),
              ),
              Side(
                Coord(4, IntPoint(1, -1)),
                Coord(3, IntPoint(1, -1)),
              ),
              Side(
                Coord(1, IntPoint(1, -1)),
                Coord(4, IntPoint(1, -1)),
              ),
              Side(
                Coord(1, IntPoint(-1, -1)),
                Coord(1, IntPoint(1, -1)),
              ),
              Side(
                Coord(0, IntPoint(-1, 1)),
                Coord(1, IntPoint(-1, -1)),
              ),
              Side(
                Coord(8, IntPoint(-1, 1)),
                Coord(0, IntPoint(-1, 1)),
              ),
              Side(
                Coord(2, IntPoint(-1, -1)),
                Coord(8, IntPoint(-1, 1)),
              )
            },
          )
        ],
      ),
    );
  }();
  static final Board star66 = () {
    return Board(
      charts: [
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1)
      ],
      convs: [
        Conv(
          fromA: 0,
          toA: 3,
          rot: IntPoint(-2, 0),
          trans: IntPoint(-2, 0),
        ),
        Conv(
          fromA: 0,
          toA: 4,
          rot: IntPoint(0, 2),
          trans: IntPoint(2, 0),
        ),
        Conv(
          fromA: 0,
          toA: 5,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, -2),
        ),
        Conv(
          fromA: 0,
          toA: 11,
          rot: IntPoint(0, 2),
          trans: IntPoint(-2, 0),
        ),
        Conv(
          fromA: 1,
          toA: 4,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, -2),
        ),
        Conv(
          fromA: 1,
          toA: 8,
          rot: IntPoint(2, 0),
          trans: IntPoint(0, -2),
        ),
        Conv(
          fromA: 1,
          toA: 9,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, 2),
        ),
        Conv(
          fromA: 1,
          toA: 10,
          rot: IntPoint(2, 0),
          trans: IntPoint(0, 2),
        ),
        Conv(
          fromA: 2,
          toA: 3,
          rot: IntPoint(-2, 0),
          trans: IntPoint(2, 0),
        ),
        Conv(
          fromA: 2,
          toA: 7,
          rot: IntPoint(0, 2),
          trans: IntPoint(2, 0),
        ),
        Conv(
          fromA: 2,
          toA: 15,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, 2),
        ),
        Conv(
          fromA: 2,
          toA: 16,
          rot: IntPoint(-2, 0),
          trans: IntPoint(0, -2),
        ),
        Conv(
          fromA: 3,
          toA: 7,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, 2),
        ),
        Conv(
          fromA: 3,
          toA: 11,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, -2),
        ),
        Conv(
          fromA: 4,
          toA: 5,
          rot: IntPoint(2, 0),
          trans: IntPoint(-2, 0),
        ),
        Conv(
          fromA: 4,
          toA: 8,
          rot: IntPoint(0, 2),
          trans: IntPoint(2, 0),
        ),
        Conv(
          fromA: 5,
          toA: 14,
          rot: IntPoint(-2, 0),
          trans: IntPoint(2, 0),
        ),
        Conv(
          fromA: 5,
          toA: 17,
          rot: IntPoint(0, 2),
          trans: IntPoint(-2, 0),
        ),
        Conv(
          fromA: 6,
          toA: 7,
          rot: IntPoint(-2, 0),
          trans: IntPoint(0, -2),
        ),
        Conv(
          fromA: 6,
          toA: 10,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, -2),
        ),
        Conv(
          fromA: 6,
          toA: 13,
          rot: IntPoint(0, 2),
          trans: IntPoint(2, 0),
        ),
        Conv(
          fromA: 6,
          toA: 15,
          rot: IntPoint(-2, 0),
          trans: IntPoint(-2, 0),
        ),
        Conv(
          fromA: 7,
          toA: 10,
          rot: IntPoint(0, 2),
          trans: IntPoint(2, 0),
        ),
        Conv(
          fromA: 8,
          toA: 12,
          rot: IntPoint(-2, 0),
          trans: IntPoint(0, 2),
        ),
        Conv(
          fromA: 8,
          toA: 14,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, -2),
        ),
        Conv(
          fromA: 9,
          toA: 10,
          rot: IntPoint(0, 2),
          trans: IntPoint(-2, 0),
        ),
        Conv(
          fromA: 9,
          toA: 12,
          rot: IntPoint(0, 2),
          trans: IntPoint(2, 0),
        ),
        Conv(
          fromA: 9,
          toA: 13,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, 2),
        ),
        Conv(
          fromA: 11,
          toA: 16,
          rot: IntPoint(0, 2),
          trans: IntPoint(-2, 0),
        ),
        Conv(
          fromA: 11,
          toA: 17,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, -2),
        )
      ],
      quads: [
        Quad(
          DoublePoint(0.500, 0.500),
          DoublePoint(0.500, 0.697),
          DoublePoint(0.629, 0.723),
          DoublePoint(0.671, 0.598),
        ),
        Quad(
          DoublePoint(0.242, 0.500),
          DoublePoint(0.330, 0.598),
          DoublePoint(0.500, 0.500),
          DoublePoint(0.329, 0.402),
        ),
        Quad(
          DoublePoint(0.629, 0.277),
          DoublePoint(0.671, 0.402),
          DoublePoint(0.758, 0.500),
          DoublePoint(0.841, 0.303),
        ),
        Quad(
          DoublePoint(0.500, 0.500),
          DoublePoint(0.671, 0.598),
          DoublePoint(0.758, 0.500),
          DoublePoint(0.671, 0.402),
        ),
        Quad(
          DoublePoint(0.329, 0.598),
          DoublePoint(0.371, 0.723),
          DoublePoint(0.500, 0.697),
          DoublePoint(0.500, 0.500),
        ),
        Quad(
          DoublePoint(0.500, 0.697),
          DoublePoint(0.371, 0.723),
          DoublePoint(0.500, 0.894),
          DoublePoint(0.629, 0.723),
        ),
        Quad(
          DoublePoint(0.500, 0.106),
          DoublePoint(0.371, 0.277),
          DoublePoint(0.500, 0.303),
          DoublePoint(0.629, 0.277),
        ),
        Quad(
          DoublePoint(0.500, 0.303),
          DoublePoint(0.500, 0.500),
          DoublePoint(0.671, 0.402),
          DoublePoint(0.629, 0.277),
        ),
        Quad(
          DoublePoint(0.242, 0.500),
          DoublePoint(0.159, 0.697),
          DoublePoint(0.371, 0.723),
          DoublePoint(0.329, 0.598),
        ),
        Quad(
          DoublePoint(0.159, 0.303),
          DoublePoint(0.242, 0.500),
          DoublePoint(0.329, 0.402),
          DoublePoint(0.371, 0.277),
        ),
        Quad(
          DoublePoint(0.371, 0.277),
          DoublePoint(0.329, 0.402),
          DoublePoint(0.500, 0.500),
          DoublePoint(0.500, 0.303),
        ),
        Quad(
          DoublePoint(0.671, 0.598),
          DoublePoint(0.629, 0.723),
          DoublePoint(0.841, 0.697),
          DoublePoint(0.758, 0.500),
        ),
        Quad(
          DoublePoint(0.0455, 0.500),
          DoublePoint(0.159, 0.697),
          DoublePoint(0.242, 0.500),
          DoublePoint(0.159, 0.303),
        ),
        Quad(
          DoublePoint(0.273, 0.106),
          DoublePoint(0.159, 0.303),
          DoublePoint(0.371, 0.277),
          DoublePoint(0.500, 0.106),
        ),
        Quad(
          DoublePoint(0.159, 0.697),
          DoublePoint(0.273, 0.894),
          DoublePoint(0.500, 0.894),
          DoublePoint(0.371, 0.723),
        ),
        Quad(
          DoublePoint(0.500, 0.106),
          DoublePoint(0.629, 0.277),
          DoublePoint(0.841, 0.303),
          DoublePoint(0.727, 0.106),
        ),
        Quad(
          DoublePoint(0.758, 0.500),
          DoublePoint(0.841, 0.697),
          DoublePoint(0.955, 0.500),
          DoublePoint(0.841, 0.303),
        ),
        Quad(
          DoublePoint(0.629, 0.723),
          DoublePoint(0.500, 0.894),
          DoublePoint(0.727, 0.894),
          DoublePoint(0.841, 0.697),
        )
      ],
      constraints: ConstraintSet(
        coincidents: [
          CoincidentBoardConstraint(
            coords: {
              Coord(15, IntPoint(1, 1)),
              Coord(16, IntPoint(1, -1)),
              Coord(2, IntPoint(1, -1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(13, IntPoint(1, -1)),
              Coord(15, IntPoint(-1, -1)),
              Coord(6, IntPoint(-1, -1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(12, IntPoint(1, -1)),
              Coord(13, IntPoint(-1, 1)),
              Coord(9, IntPoint(-1, -1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(14, IntPoint(-1, -1)),
              Coord(12, IntPoint(-1, 1)),
              Coord(8, IntPoint(-1, 1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(5, IntPoint(1, 1)),
              Coord(17, IntPoint(-1, 1)),
              Coord(14, IntPoint(1, 1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(11, IntPoint(1, 1)),
              Coord(17, IntPoint(1, -1)),
              Coord(16, IntPoint(-1, 1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(5, IntPoint(-1, 1)),
              Coord(14, IntPoint(1, -1)),
              Coord(4, IntPoint(-1, 1)),
              Coord(8, IntPoint(1, 1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(11, IntPoint(-1, 1)),
              Coord(5, IntPoint(1, -1)),
              Coord(17, IntPoint(-1, -1)),
              Coord(0, IntPoint(1, 1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(16, IntPoint(-1, -1)),
              Coord(11, IntPoint(1, -1)),
              Coord(3, IntPoint(1, 1)),
              Coord(2, IntPoint(1, 1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(2, IntPoint(-1, -1)),
              Coord(7, IntPoint(1, -1)),
              Coord(6, IntPoint(1, -1)),
              Coord(15, IntPoint(-1, 1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(9, IntPoint(-1, 1)),
              Coord(8, IntPoint(-1, -1)),
              Coord(12, IntPoint(1, 1)),
              Coord(1, IntPoint(-1, -1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(13, IntPoint(1, 1)),
              Coord(6, IntPoint(-1, 1)),
              Coord(9, IntPoint(1, -1)),
              Coord(10, IntPoint(-1, -1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(9, IntPoint(1, 1)),
              Coord(1, IntPoint(1, -1)),
              Coord(10, IntPoint(-1, 1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(8, IntPoint(1, -1)),
              Coord(4, IntPoint(-1, -1)),
              Coord(1, IntPoint(-1, 1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(5, IntPoint(-1, -1)),
              Coord(0, IntPoint(-1, 1)),
              Coord(4, IntPoint(1, 1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(11, IntPoint(-1, -1)),
              Coord(0, IntPoint(1, -1)),
              Coord(3, IntPoint(-1, 1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(3, IntPoint(1, -1)),
              Coord(2, IntPoint(-1, 1)),
              Coord(7, IntPoint(1, 1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(6, IntPoint(1, 1)),
              Coord(10, IntPoint(1, -1)),
              Coord(7, IntPoint(-1, -1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(1, IntPoint(1, 1)),
              Coord(4, IntPoint(1, -1)),
              Coord(10, IntPoint(1, 1)),
              Coord(7, IntPoint(-1, 1)),
              Coord(3, IntPoint(-1, -1)),
              Coord(0, IntPoint(-1, -1))
            },
          )
        ],
        equidistants: [
          EquidistantBoardConstraint(
            sides: {
              Side(
                Coord(5, IntPoint(1, 1)),
                Coord(6, IntPoint(-1, -1)),
              ),
              Side(
                Coord(17, IntPoint(1, 1)),
                Coord(15, IntPoint(1, -1)),
              ),
              Side(
                Coord(13, IntPoint(-1, -1)),
                Coord(14, IntPoint(-1, 1)),
              )
            },
          ),
          EquidistantBoardConstraint(
            sides: {
              Side(
                Coord(12, IntPoint(-1, -1)),
                Coord(1, IntPoint(-1, -1)),
              ),
              Side(
                Coord(1, IntPoint(1, -1)),
                Coord(9, IntPoint(-1, -1)),
              ),
              Side(
                Coord(6, IntPoint(-1, 1)),
                Coord(13, IntPoint(-1, -1)),
              ),
              Side(
                Coord(2, IntPoint(-1, -1)),
                Coord(15, IntPoint(1, -1)),
              ),
              Side(
                Coord(2, IntPoint(1, 1)),
                Coord(16, IntPoint(1, 1)),
              ),
              Side(
                Coord(0, IntPoint(1, 1)),
                Coord(17, IntPoint(1, 1)),
              ),
              Side(
                Coord(4, IntPoint(-1, 1)),
                Coord(14, IntPoint(-1, 1)),
              ),
              Side(
                Coord(1, IntPoint(-1, 1)),
                Coord(0, IntPoint(-1, -1)),
              ),
              Side(
                Coord(8, IntPoint(-1, 1)),
                Coord(1, IntPoint(-1, 1)),
              ),
              Side(
                Coord(5, IntPoint(1, 1)),
                Coord(0, IntPoint(-1, 1)),
              ),
              Side(
                Coord(0, IntPoint(1, -1)),
                Coord(11, IntPoint(1, 1)),
              ),
              Side(
                Coord(2, IntPoint(-1, 1)),
                Coord(2, IntPoint(1, -1)),
              ),
              Side(
                Coord(6, IntPoint(1, 1)),
                Coord(6, IntPoint(-1, -1)),
              ),
              Side(
                Coord(6, IntPoint(1, 1)),
                Coord(2, IntPoint(-1, 1)),
              ),
              Side(
                Coord(0, IntPoint(-1, -1)),
                Coord(6, IntPoint(1, 1)),
              ),
              Side(
                Coord(0, IntPoint(-1, -1)),
                Coord(1, IntPoint(1, -1)),
              ),
              Side(
                Coord(0, IntPoint(-1, -1)),
                Coord(0, IntPoint(-1, 1)),
              ),
              Side(
                Coord(0, IntPoint(-1, -1)),
                Coord(0, IntPoint(1, -1)),
              ),
              Side(
                Coord(0, IntPoint(-1, -1)),
                Coord(2, IntPoint(-1, 1)),
              ),
              Side(
                Coord(0, IntPoint(1, -1)),
                Coord(2, IntPoint(-1, 1)),
              ),
              Side(
                Coord(0, IntPoint(-1, 1)),
                Coord(0, IntPoint(1, -1)),
              ),
              Side(
                Coord(1, IntPoint(-1, 1)),
                Coord(0, IntPoint(-1, 1)),
              ),
              Side(
                Coord(1, IntPoint(1, -1)),
                Coord(1, IntPoint(-1, 1)),
              ),
              Side(
                Coord(6, IntPoint(1, 1)),
                Coord(1, IntPoint(1, -1)),
              )
            },
          ),
          EquidistantBoardConstraint(
            sides: {
              Side(
                Coord(13, IntPoint(-1, -1)),
                Coord(9, IntPoint(-1, -1)),
              ),
              Side(
                Coord(12, IntPoint(-1, -1)),
                Coord(9, IntPoint(-1, -1)),
              ),
              Side(
                Coord(8, IntPoint(-1, 1)),
                Coord(12, IntPoint(-1, -1)),
              ),
              Side(
                Coord(14, IntPoint(-1, 1)),
                Coord(8, IntPoint(-1, 1)),
              ),
              Side(
                Coord(5, IntPoint(1, 1)),
                Coord(14, IntPoint(-1, 1)),
              ),
              Side(
                Coord(17, IntPoint(1, 1)),
                Coord(5, IntPoint(1, 1)),
              ),
              Side(
                Coord(11, IntPoint(1, 1)),
                Coord(17, IntPoint(1, 1)),
              ),
              Side(
                Coord(16, IntPoint(1, 1)),
                Coord(11, IntPoint(1, 1)),
              ),
              Side(
                Coord(2, IntPoint(1, -1)),
                Coord(16, IntPoint(1, 1)),
              ),
              Side(
                Coord(15, IntPoint(1, -1)),
                Coord(2, IntPoint(1, -1)),
              ),
              Side(
                Coord(6, IntPoint(-1, -1)),
                Coord(15, IntPoint(1, -1)),
              ),
              Side(
                Coord(13, IntPoint(-1, -1)),
                Coord(6, IntPoint(-1, -1)),
              )
            },
          ),
          EquidistantBoardConstraint(
            sides: {
              Side(
                Coord(2, IntPoint(-1, -1)),
                Coord(6, IntPoint(1, 1)),
              ),
              Side(
                Coord(6, IntPoint(-1, 1)),
                Coord(6, IntPoint(1, 1)),
              ),
              Side(
                Coord(1, IntPoint(1, -1)),
                Coord(6, IntPoint(-1, 1)),
              ),
              Side(
                Coord(1, IntPoint(-1, -1)),
                Coord(1, IntPoint(1, -1)),
              ),
              Side(
                Coord(1, IntPoint(-1, 1)),
                Coord(1, IntPoint(-1, -1)),
              ),
              Side(
                Coord(4, IntPoint(-1, 1)),
                Coord(1, IntPoint(-1, 1)),
              ),
              Side(
                Coord(0, IntPoint(-1, 1)),
                Coord(4, IntPoint(-1, 1)),
              ),
              Side(
                Coord(0, IntPoint(1, 1)),
                Coord(0, IntPoint(-1, 1)),
              ),
              Side(
                Coord(0, IntPoint(1, -1)),
                Coord(0, IntPoint(1, 1)),
              ),
              Side(
                Coord(2, IntPoint(1, 1)),
                Coord(0, IntPoint(1, -1)),
              ),
              Side(
                Coord(2, IntPoint(-1, 1)),
                Coord(2, IntPoint(1, 1)),
              ),
              Side(
                Coord(2, IntPoint(-1, -1)),
                Coord(2, IntPoint(-1, 1)),
              )
            },
          ),
          EquidistantBoardConstraint(
            sides: {
              Side(
                Coord(6, IntPoint(-1, 1)),
                Coord(9, IntPoint(-1, -1)),
              ),
              Side(
                Coord(1, IntPoint(-1, -1)),
                Coord(9, IntPoint(-1, -1)),
              ),
              Side(
                Coord(8, IntPoint(-1, 1)),
                Coord(1, IntPoint(-1, -1)),
              ),
              Side(
                Coord(4, IntPoint(-1, 1)),
                Coord(8, IntPoint(-1, 1)),
              ),
              Side(
                Coord(5, IntPoint(1, 1)),
                Coord(4, IntPoint(-1, 1)),
              ),
              Side(
                Coord(0, IntPoint(1, 1)),
                Coord(5, IntPoint(1, 1)),
              ),
              Side(
                Coord(11, IntPoint(1, 1)),
                Coord(0, IntPoint(1, 1)),
              ),
              Side(
                Coord(2, IntPoint(1, 1)),
                Coord(11, IntPoint(1, 1)),
              ),
              Side(
                Coord(2, IntPoint(1, -1)),
                Coord(2, IntPoint(1, 1)),
              ),
              Side(
                Coord(2, IntPoint(-1, -1)),
                Coord(2, IntPoint(1, -1)),
              ),
              Side(
                Coord(6, IntPoint(-1, -1)),
                Coord(2, IntPoint(-1, -1)),
              ),
              Side(
                Coord(6, IntPoint(-1, 1)),
                Coord(6, IntPoint(-1, -1)),
              )
            },
          )
        ],
      ),
    );
  }();
  static final Board starbox3 = () {
    return Board(
      charts: [
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1)
      ],
      convs: [
        Conv(
          fromA: 0,
          toA: 4,
          rot: IntPoint(0, 2),
          trans: IntPoint(2, 0),
        ),
        Conv(
          fromA: 0,
          toA: 10,
          rot: IntPoint(-2, 0),
          trans: IntPoint(-2, 0),
        ),
        Conv(
          fromA: 0,
          toA: 12,
          rot: IntPoint(0, 2),
          trans: IntPoint(-2, 0),
        ),
        Conv(
          fromA: 1,
          toA: 2,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, 2),
        ),
        Conv(
          fromA: 1,
          toA: 4,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, -2),
        ),
        Conv(
          fromA: 1,
          toA: 8,
          rot: IntPoint(2, 0),
          trans: IntPoint(0, 2),
        ),
        Conv(
          fromA: 2,
          toA: 8,
          rot: IntPoint(0, 2),
          trans: IntPoint(-2, 0),
        ),
        Conv(
          fromA: 3,
          toA: 6,
          rot: IntPoint(0, 2),
          trans: IntPoint(2, 0),
        ),
        Conv(
          fromA: 3,
          toA: 7,
          rot: IntPoint(0, 2),
          trans: IntPoint(-2, 0),
        ),
        Conv(
          fromA: 3,
          toA: 9,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, 2),
        ),
        Conv(
          fromA: 3,
          toA: 10,
          rot: IntPoint(-2, 0),
          trans: IntPoint(2, 0),
        ),
        Conv(
          fromA: 5,
          toA: 9,
          rot: IntPoint(-2, 0),
          trans: IntPoint(0, -2),
        ),
        Conv(
          fromA: 5,
          toA: 11,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, -2),
        ),
        Conv(
          fromA: 6,
          toA: 8,
          rot: IntPoint(0, 2),
          trans: IntPoint(2, 0),
        ),
        Conv(
          fromA: 6,
          toA: 10,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, -2),
        ),
        Conv(
          fromA: 6,
          toA: 11,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, 2),
        ),
        Conv(
          fromA: 7,
          toA: 9,
          rot: IntPoint(2, 0),
          trans: IntPoint(2, 0),
        ),
        Conv(
          fromA: 8,
          toA: 11,
          rot: IntPoint(-2, 0),
          trans: IntPoint(-2, 0),
        ),
        Conv(
          fromA: 9,
          toA: 11,
          rot: IntPoint(0, 2),
          trans: IntPoint(2, 0),
        ),
        Conv(
          fromA: 10,
          toA: 12,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, -2),
        )
      ],
      quads: [
        Quad(
          DoublePoint(0.353, 0.647),
          DoublePoint(0.353, 0.950),
          DoublePoint(0.656, 0.950),
          DoublePoint(0.656, 0.647),
        ),
        Quad(
          DoublePoint(0.0501, 0.344),
          DoublePoint(0.0501, 0.647),
          DoublePoint(0.353, 0.647),
          DoublePoint(0.353, 0.344),
        ),
        Quad(
          DoublePoint(0.0501, 0.0408),
          DoublePoint(0.0501, 0.344),
          DoublePoint(0.353, 0.344),
          DoublePoint(0.353, 0.0408),
        ),
        Quad(
          DoublePoint(0.656, 0.344),
          DoublePoint(0.656, 0.495),
          DoublePoint(0.959, 0.647),
          DoublePoint(0.808, 0.344),
        ),
        Quad(
          DoublePoint(0.0501, 0.647),
          DoublePoint(0.0501, 0.950),
          DoublePoint(0.353, 0.950),
          DoublePoint(0.353, 0.647),
        ),
        Quad(
          DoublePoint(0.656, 0.0408),
          DoublePoint(0.353, 0.0408),
          DoublePoint(0.656, 0.192),
          DoublePoint(0.959, 0.0408),
        ),
        Quad(
          DoublePoint(0.505, 0.344),
          DoublePoint(0.353, 0.647),
          DoublePoint(0.656, 0.495),
          DoublePoint(0.656, 0.344),
        ),
        Quad(
          DoublePoint(0.808, 0.344),
          DoublePoint(0.959, 0.647),
          DoublePoint(0.959, 0.344),
          DoublePoint(0.959, 0.0408),
        ),
        Quad(
          DoublePoint(0.353, 0.0408),
          DoublePoint(0.353, 0.344),
          DoublePoint(0.353, 0.647),
          DoublePoint(0.505, 0.344),
        ),
        Quad(
          DoublePoint(0.656, 0.192),
          DoublePoint(0.656, 0.344),
          DoublePoint(0.808, 0.344),
          DoublePoint(0.959, 0.0408),
        ),
        Quad(
          DoublePoint(0.353, 0.647),
          DoublePoint(0.656, 0.647),
          DoublePoint(0.959, 0.647),
          DoublePoint(0.656, 0.495),
        ),
        Quad(
          DoublePoint(0.353, 0.0408),
          DoublePoint(0.505, 0.344),
          DoublePoint(0.656, 0.344),
          DoublePoint(0.656, 0.192),
        ),
        Quad(
          DoublePoint(0.656, 0.647),
          DoublePoint(0.656, 0.950),
          DoublePoint(0.959, 0.950),
          DoublePoint(0.959, 0.647),
        )
      ],
      constraints: ConstraintSet(
        coincidents: [
          CoincidentBoardConstraint(
            coords: {
              Coord(7, IntPoint(1, -1)),
              Coord(9, IntPoint(1, -1)),
              Coord(5, IntPoint(1, -1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(7, IntPoint(-1, 1)),
              Coord(3, IntPoint(1, 1)),
              Coord(10, IntPoint(1, 1)),
              Coord(12, IntPoint(1, -1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(7, IntPoint(-1, -1)),
              Coord(3, IntPoint(1, -1)),
              Coord(9, IntPoint(1, 1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(5, IntPoint(1, 1)),
              Coord(9, IntPoint(-1, -1)),
              Coord(11, IntPoint(1, -1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(5, IntPoint(-1, 1)),
              Coord(2, IntPoint(1, -1)),
              Coord(11, IntPoint(-1, -1)),
              Coord(8, IntPoint(-1, -1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(9, IntPoint(-1, 1)),
              Coord(3, IntPoint(-1, -1)),
              Coord(6, IntPoint(1, -1)),
              Coord(11, IntPoint(1, 1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(3, IntPoint(-1, 1)),
              Coord(6, IntPoint(1, 1)),
              Coord(10, IntPoint(1, -1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(11, IntPoint(-1, 1)),
              Coord(6, IntPoint(-1, -1)),
              Coord(8, IntPoint(1, -1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(6, IntPoint(-1, 1)),
              Coord(0, IntPoint(-1, -1)),
              Coord(8, IntPoint(1, 1)),
              Coord(10, IntPoint(-1, -1)),
              Coord(1, IntPoint(1, 1)),
              Coord(4, IntPoint(1, -1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(8, IntPoint(-1, 1)),
              Coord(1, IntPoint(1, -1)),
              Coord(2, IntPoint(1, 1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(10, IntPoint(-1, 1)),
              Coord(0, IntPoint(1, -1)),
              Coord(12, IntPoint(-1, -1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {Coord(0, IntPoint(1, 1)), Coord(12, IntPoint(-1, 1))},
          ),
          CoincidentBoardConstraint(
            coords: {Coord(1, IntPoint(-1, -1)), Coord(2, IntPoint(-1, 1))},
          ),
          CoincidentBoardConstraint(
            coords: {Coord(4, IntPoint(-1, -1)), Coord(1, IntPoint(-1, 1))},
          ),
          CoincidentBoardConstraint(
            coords: {Coord(4, IntPoint(1, 1)), Coord(0, IntPoint(-1, 1))},
          )
        ],
        equidistants: [
          EquidistantBoardConstraint(
            sides: {
              Side(
                Coord(0, IntPoint(1, -1)),
                Coord(3, IntPoint(-1, 1)),
              ),
              Side(
                Coord(3, IntPoint(-1, -1)),
                Coord(6, IntPoint(-1, -1)),
              ),
              Side(
                Coord(6, IntPoint(-1, -1)),
                Coord(1, IntPoint(1, -1)),
              ),
              Side(
                Coord(5, IntPoint(-1, -1)),
                Coord(5, IntPoint(1, 1)),
              ),
              Side(
                Coord(3, IntPoint(1, -1)),
                Coord(7, IntPoint(1, 1)),
              ),
              Side(
                Coord(3, IntPoint(-1, -1)),
                Coord(9, IntPoint(-1, -1)),
              ),
              Side(
                Coord(3, IntPoint(-1, -1)),
                Coord(3, IntPoint(-1, 1)),
              ),
              Side(
                Coord(3, IntPoint(1, -1)),
                Coord(3, IntPoint(-1, -1)),
              )
            },
          ),
          EquidistantBoardConstraint(
            sides: {
              Side(
                Coord(2, IntPoint(1, -1)),
                Coord(1, IntPoint(-1, -1)),
              ),
              Side(
                Coord(0, IntPoint(-1, -1)),
                Coord(3, IntPoint(-1, -1)),
              ),
              Side(
                Coord(3, IntPoint(-1, -1)),
                Coord(3, IntPoint(1, 1)),
              ),
              Side(
                Coord(5, IntPoint(1, -1)),
                Coord(3, IntPoint(-1, -1)),
              ),
              Side(
                Coord(2, IntPoint(1, -1)),
                Coord(3, IntPoint(-1, -1)),
              ),
              Side(
                Coord(0, IntPoint(1, -1)),
                Coord(12, IntPoint(1, 1)),
              ),
              Side(
                Coord(2, IntPoint(-1, -1)),
                Coord(1, IntPoint(1, -1)),
              ),
              Side(
                Coord(0, IntPoint(-1, -1)),
                Coord(1, IntPoint(-1, -1)),
              ),
              Side(
                Coord(1, IntPoint(-1, 1)),
                Coord(1, IntPoint(1, -1)),
              ),
              Side(
                Coord(0, IntPoint(-1, 1)),
                Coord(1, IntPoint(-1, 1)),
              ),
              Side(
                Coord(4, IntPoint(-1, 1)),
                Coord(0, IntPoint(-1, -1)),
              ),
              Side(
                Coord(0, IntPoint(1, 1)),
                Coord(0, IntPoint(-1, -1)),
              ),
              Side(
                Coord(0, IntPoint(-1, 1)),
                Coord(0, IntPoint(1, -1)),
              ),
              Side(
                Coord(10, IntPoint(1, 1)),
                Coord(0, IntPoint(1, 1)),
              )
            },
          ),
          EquidistantBoardConstraint(
            sides: {
              Side(
                Coord(7, IntPoint(1, 1)),
                Coord(3, IntPoint(1, 1)),
              ),
              Side(
                Coord(2, IntPoint(1, -1)),
                Coord(2, IntPoint(-1, -1)),
              ),
              Side(
                Coord(5, IntPoint(-1, -1)),
                Coord(2, IntPoint(1, -1)),
              ),
              Side(
                Coord(5, IntPoint(1, -1)),
                Coord(5, IntPoint(-1, -1)),
              ),
              Side(
                Coord(7, IntPoint(1, 1)),
                Coord(5, IntPoint(1, -1)),
              ),
              Side(
                Coord(1, IntPoint(1, -1)),
                Coord(2, IntPoint(1, -1)),
              ),
              Side(
                Coord(1, IntPoint(-1, -1)),
                Coord(2, IntPoint(-1, -1)),
              ),
              Side(
                Coord(1, IntPoint(-1, 1)),
                Coord(1, IntPoint(-1, -1)),
              ),
              Side(
                Coord(4, IntPoint(-1, 1)),
                Coord(1, IntPoint(-1, 1)),
              ),
              Side(
                Coord(0, IntPoint(-1, 1)),
                Coord(4, IntPoint(-1, 1)),
              ),
              Side(
                Coord(0, IntPoint(1, 1)),
                Coord(0, IntPoint(-1, 1)),
              ),
              Side(
                Coord(12, IntPoint(1, 1)),
                Coord(0, IntPoint(1, 1)),
              ),
              Side(
                Coord(10, IntPoint(1, 1)),
                Coord(12, IntPoint(1, 1)),
              ),
              Side(
                Coord(0, IntPoint(1, -1)),
                Coord(10, IntPoint(1, 1)),
              ),
              Side(
                Coord(0, IntPoint(1, 1)),
                Coord(0, IntPoint(1, -1)),
              ),
              Side(
                Coord(0, IntPoint(-1, -1)),
                Coord(0, IntPoint(1, -1)),
              ),
              Side(
                Coord(0, IntPoint(-1, 1)),
                Coord(0, IntPoint(-1, -1)),
              ),
              Side(
                Coord(1, IntPoint(-1, 1)),
                Coord(0, IntPoint(-1, -1)),
              ),
              Side(
                Coord(1, IntPoint(1, -1)),
                Coord(0, IntPoint(-1, -1)),
              )
            },
          ),
          EquidistantBoardConstraint(
            sides: {
              Side(
                Coord(3, IntPoint(1, 1)),
                Coord(3, IntPoint(-1, 1)),
              ),
              Side(
                Coord(9, IntPoint(-1, -1)),
                Coord(2, IntPoint(1, -1)),
              ),
              Side(
                Coord(9, IntPoint(1, -1)),
                Coord(9, IntPoint(-1, -1)),
              ),
              Side(
                Coord(3, IntPoint(1, -1)),
                Coord(9, IntPoint(1, -1)),
              ),
              Side(
                Coord(3, IntPoint(1, 1)),
                Coord(3, IntPoint(1, -1)),
              ),
              Side(
                Coord(6, IntPoint(-1, -1)),
                Coord(2, IntPoint(1, -1)),
              ),
              Side(
                Coord(0, IntPoint(-1, -1)),
                Coord(6, IntPoint(-1, -1)),
              ),
              Side(
                Coord(6, IntPoint(1, 1)),
                Coord(0, IntPoint(-1, -1)),
              )
            },
          )
        ],
      ),
    );
  }();
  static final Board starbox4 = () {
    return Board(
      charts: [
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1)
      ],
      convs: [
        Conv(
          fromA: 0,
          toA: 3,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, -2),
        ),
        Conv(
          fromA: 0,
          toA: 6,
          rot: IntPoint(-2, 0),
          trans: IntPoint(0, -2),
        ),
        Conv(
          fromA: 0,
          toA: 9,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, 2),
        ),
        Conv(
          fromA: 1,
          toA: 13,
          rot: IntPoint(-2, 0),
          trans: IntPoint(-2, 0),
        ),
        Conv(
          fromA: 1,
          toA: 15,
          rot: IntPoint(0, 2),
          trans: IntPoint(2, 0),
        ),
        Conv(
          fromA: 1,
          toA: 19,
          rot: IntPoint(0, 2),
          trans: IntPoint(-2, 0),
        ),
        Conv(
          fromA: 2,
          toA: 4,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, 2),
        ),
        Conv(
          fromA: 2,
          toA: 5,
          rot: IntPoint(0, 2),
          trans: IntPoint(-2, 0),
        ),
        Conv(
          fromA: 2,
          toA: 13,
          rot: IntPoint(-2, 0),
          trans: IntPoint(0, 2),
        ),
        Conv(
          fromA: 2,
          toA: 16,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, -2),
        ),
        Conv(
          fromA: 3,
          toA: 15,
          rot: IntPoint(0, 2),
          trans: IntPoint(-2, 0),
        ),
        Conv(
          fromA: 4,
          toA: 6,
          rot: IntPoint(-2, 0),
          trans: IntPoint(-2, 0),
        ),
        Conv(
          fromA: 4,
          toA: 7,
          rot: IntPoint(0, 2),
          trans: IntPoint(-2, 0),
        ),
        Conv(
          fromA: 4,
          toA: 13,
          rot: IntPoint(0, 2),
          trans: IntPoint(2, 0),
        ),
        Conv(
          fromA: 5,
          toA: 7,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, 2),
        ),
        Conv(
          fromA: 5,
          toA: 16,
          rot: IntPoint(-2, 0),
          trans: IntPoint(2, 0),
        ),
        Conv(
          fromA: 5,
          toA: 18,
          rot: IntPoint(0, 2),
          trans: IntPoint(-2, 0),
        ),
        Conv(
          fromA: 6,
          toA: 7,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, -2),
        ),
        Conv(
          fromA: 6,
          toA: 9,
          rot: IntPoint(0, -2),
          trans: IntPoint(2, 0),
        ),
        Conv(
          fromA: 7,
          toA: 18,
          rot: IntPoint(-2, 0),
          trans: IntPoint(0, -2),
        ),
        Conv(
          fromA: 8,
          toA: 16,
          rot: IntPoint(0, -2),
          trans: IntPoint(-2, 0),
        ),
        Conv(
          fromA: 8,
          toA: 17,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, 2),
        ),
        Conv(
          fromA: 8,
          toA: 19,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, -2),
        ),
        Conv(
          fromA: 9,
          toA: 10,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, 2),
        ),
        Conv(
          fromA: 10,
          toA: 14,
          rot: IntPoint(0, 2),
          trans: IntPoint(-2, 0),
        ),
        Conv(
          fromA: 11,
          toA: 12,
          rot: IntPoint(0, 2),
          trans: IntPoint(-2, 0),
        ),
        Conv(
          fromA: 11,
          toA: 14,
          rot: IntPoint(0, 2),
          trans: IntPoint(2, 0),
        ),
        Conv(
          fromA: 11,
          toA: 18,
          rot: IntPoint(0, -2),
          trans: IntPoint(0, 2),
        ),
        Conv(
          fromA: 12,
          toA: 17,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, -2),
        ),
        Conv(
          fromA: 13,
          toA: 15,
          rot: IntPoint(0, -2),
          trans: IntPoint(0, -2),
        ),
        Conv(
          fromA: 14,
          toA: 18,
          rot: IntPoint(-2, 0),
          trans: IntPoint(2, 0),
        ),
        Conv(
          fromA: 16,
          toA: 17,
          rot: IntPoint(2, 0),
          trans: IntPoint(-2, 0),
        )
      ],
      quads: [
        Quad(
          DoublePoint(0.0456, 0.500),
          DoublePoint(0.0457, 0.727),
          DoublePoint(0.273, 0.727),
          DoublePoint(0.197, 0.500),
        ),
        Quad(
          DoublePoint(0.500, 0.803),
          DoublePoint(0.500, 0.954),
          DoublePoint(0.727, 0.954),
          DoublePoint(0.727, 0.727),
        ),
        Quad(
          DoublePoint(0.500, 0.651),
          DoublePoint(0.727, 0.727),
          DoublePoint(0.651, 0.500),
          DoublePoint(0.500, 0.500),
        ),
        Quad(
          DoublePoint(0.0457, 0.727),
          DoublePoint(0.0457, 0.954),
          DoublePoint(0.273, 0.954),
          DoublePoint(0.273, 0.727),
        ),
        Quad(
          DoublePoint(0.273, 0.727),
          DoublePoint(0.500, 0.651),
          DoublePoint(0.500, 0.500),
          DoublePoint(0.349, 0.500),
        ),
        Quad(
          DoublePoint(0.500, 0.500),
          DoublePoint(0.651, 0.500),
          DoublePoint(0.727, 0.273),
          DoublePoint(0.500, 0.349),
        ),
        Quad(
          DoublePoint(0.273, 0.727),
          DoublePoint(0.349, 0.500),
          DoublePoint(0.273, 0.273),
          DoublePoint(0.197, 0.500),
        ),
        Quad(
          DoublePoint(0.349, 0.500),
          DoublePoint(0.500, 0.500),
          DoublePoint(0.500, 0.349),
          DoublePoint(0.273, 0.273),
        ),
        Quad(
          DoublePoint(0.803, 0.500),
          DoublePoint(0.727, 0.727),
          DoublePoint(0.955, 0.727),
          DoublePoint(0.954, 0.500),
        ),
        Quad(
          DoublePoint(0.0455, 0.273),
          DoublePoint(0.0456, 0.500),
          DoublePoint(0.197, 0.500),
          DoublePoint(0.273, 0.273),
        ),
        Quad(
          DoublePoint(0.0455, 0.0456),
          DoublePoint(0.0455, 0.273),
          DoublePoint(0.273, 0.273),
          DoublePoint(0.273, 0.0456),
        ),
        Quad(
          DoublePoint(0.500, 0.0456),
          DoublePoint(0.500, 0.197),
          DoublePoint(0.727, 0.273),
          DoublePoint(0.727, 0.0456),
        ),
        Quad(
          DoublePoint(0.727, 0.0456),
          DoublePoint(0.727, 0.273),
          DoublePoint(0.954, 0.273),
          DoublePoint(0.954, 0.0456),
        ),
        Quad(
          DoublePoint(0.500, 0.803),
          DoublePoint(0.727, 0.727),
          DoublePoint(0.500, 0.651),
          DoublePoint(0.273, 0.727),
        ),
        Quad(
          DoublePoint(0.273, 0.0456),
          DoublePoint(0.273, 0.273),
          DoublePoint(0.500, 0.197),
          DoublePoint(0.500, 0.0456),
        ),
        Quad(
          DoublePoint(0.273, 0.727),
          DoublePoint(0.273, 0.954),
          DoublePoint(0.500, 0.954),
          DoublePoint(0.500, 0.803),
        ),
        Quad(
          DoublePoint(0.727, 0.727),
          DoublePoint(0.803, 0.500),
          DoublePoint(0.727, 0.273),
          DoublePoint(0.651, 0.500),
        ),
        Quad(
          DoublePoint(0.727, 0.273),
          DoublePoint(0.803, 0.500),
          DoublePoint(0.954, 0.500),
          DoublePoint(0.954, 0.273),
        ),
        Quad(
          DoublePoint(0.500, 0.349),
          DoublePoint(0.727, 0.273),
          DoublePoint(0.500, 0.197),
          DoublePoint(0.273, 0.273),
        ),
        Quad(
          DoublePoint(0.727, 0.727),
          DoublePoint(0.727, 0.954),
          DoublePoint(0.955, 0.954),
          DoublePoint(0.955, 0.727),
        )
      ],
      constraints: ConstraintSet(
        coincidents: [
          CoincidentBoardConstraint(
            coords: {
              Coord(6, IntPoint(1, -1)),
              Coord(0, IntPoint(1, -1)),
              Coord(9, IntPoint(1, 1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(4, IntPoint(-1, -1)),
              Coord(0, IntPoint(1, 1)),
              Coord(6, IntPoint(-1, -1)),
              Coord(13, IntPoint(1, -1)),
              Coord(15, IntPoint(-1, -1)),
              Coord(3, IntPoint(1, -1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(13, IntPoint(-1, -1)),
              Coord(1, IntPoint(-1, -1)),
              Coord(15, IntPoint(1, -1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(16, IntPoint(-1, 1)),
              Coord(8, IntPoint(-1, -1)),
              Coord(17, IntPoint(-1, 1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(2, IntPoint(-1, 1)),
              Coord(1, IntPoint(1, -1)),
              Coord(13, IntPoint(-1, 1)),
              Coord(16, IntPoint(-1, -1)),
              Coord(8, IntPoint(-1, 1)),
              Coord(19, IntPoint(-1, -1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(5, IntPoint(1, 1)),
              Coord(11, IntPoint(1, 1)),
              Coord(16, IntPoint(1, 1)),
              Coord(18, IntPoint(-1, 1)),
              Coord(17, IntPoint(-1, -1)),
              Coord(12, IntPoint(-1, 1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(6, IntPoint(1, 1)),
              Coord(9, IntPoint(1, -1)),
              Coord(18, IntPoint(1, -1)),
              Coord(7, IntPoint(1, -1)),
              Coord(14, IntPoint(-1, 1)),
              Coord(10, IntPoint(1, 1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(18, IntPoint(1, 1)),
              Coord(11, IntPoint(-1, 1)),
              Coord(14, IntPoint(1, 1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(2, IntPoint(1, 1)),
              Coord(5, IntPoint(-1, 1)),
              Coord(16, IntPoint(1, -1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(13, IntPoint(1, 1)),
              Coord(2, IntPoint(-1, -1)),
              Coord(4, IntPoint(-1, 1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(6, IntPoint(-1, 1)),
              Coord(4, IntPoint(1, -1)),
              Coord(7, IntPoint(-1, -1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(18, IntPoint(-1, -1)),
              Coord(5, IntPoint(1, -1)),
              Coord(7, IntPoint(1, 1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(4, IntPoint(1, 1)),
              Coord(5, IntPoint(-1, -1)),
              Coord(2, IntPoint(1, -1)),
              Coord(7, IntPoint(-1, 1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {Coord(11, IntPoint(1, -1)), Coord(12, IntPoint(-1, -1))},
          ),
          CoincidentBoardConstraint(
            coords: {Coord(14, IntPoint(1, -1)), Coord(11, IntPoint(-1, -1))},
          ),
          CoincidentBoardConstraint(
            coords: {Coord(14, IntPoint(-1, -1)), Coord(10, IntPoint(1, -1))},
          ),
          CoincidentBoardConstraint(
            coords: {Coord(17, IntPoint(1, -1)), Coord(12, IntPoint(1, 1))},
          ),
          CoincidentBoardConstraint(
            coords: {Coord(8, IntPoint(1, -1)), Coord(17, IntPoint(1, 1))},
          ),
          CoincidentBoardConstraint(
            coords: {Coord(8, IntPoint(1, 1)), Coord(19, IntPoint(1, -1))},
          ),
          CoincidentBoardConstraint(
            coords: {Coord(1, IntPoint(1, 1)), Coord(19, IntPoint(-1, 1))},
          ),
          CoincidentBoardConstraint(
            coords: {Coord(15, IntPoint(1, 1)), Coord(1, IntPoint(-1, 1))},
          ),
          CoincidentBoardConstraint(
            coords: {Coord(3, IntPoint(1, 1)), Coord(15, IntPoint(-1, 1))},
          ),
          CoincidentBoardConstraint(
            coords: {Coord(0, IntPoint(-1, 1)), Coord(3, IntPoint(-1, -1))},
          ),
          CoincidentBoardConstraint(
            coords: {Coord(9, IntPoint(-1, 1)), Coord(0, IntPoint(-1, -1))},
          ),
          CoincidentBoardConstraint(
            coords: {Coord(10, IntPoint(-1, 1)), Coord(9, IntPoint(-1, -1))},
          )
        ],
        equidistants: [
          EquidistantBoardConstraint(
            sides: {
              Side(
                Coord(9, IntPoint(-1, -1)),
                Coord(10, IntPoint(-1, -1)),
              ),
              Side(
                Coord(6, IntPoint(1, 1)),
                Coord(10, IntPoint(1, -1)),
              ),
              Side(
                Coord(1, IntPoint(1, -1)),
                Coord(1, IntPoint(1, 1)),
              ),
              Side(
                Coord(3, IntPoint(1, 1)),
                Coord(0, IntPoint(1, 1)),
              ),
              Side(
                Coord(0, IntPoint(-1, 1)),
                Coord(0, IntPoint(1, 1)),
              ),
              Side(
                Coord(6, IntPoint(1, 1)),
                Coord(9, IntPoint(-1, -1)),
              ),
              Side(
                Coord(11, IntPoint(1, -1)),
                Coord(5, IntPoint(1, 1)),
              ),
              Side(
                Coord(12, IntPoint(1, 1)),
                Coord(5, IntPoint(1, 1)),
              ),
              Side(
                Coord(1, IntPoint(1, -1)),
                Coord(8, IntPoint(1, 1)),
              ),
              Side(
                Coord(0, IntPoint(-1, 1)),
                Coord(3, IntPoint(-1, 1)),
              ),
              Side(
                Coord(3, IntPoint(1, 1)),
                Coord(3, IntPoint(-1, 1)),
              ),
              Side(
                Coord(1, IntPoint(-1, 1)),
                Coord(3, IntPoint(1, 1)),
              ),
              Side(
                Coord(1, IntPoint(1, 1)),
                Coord(1, IntPoint(-1, 1)),
              ),
              Side(
                Coord(19, IntPoint(1, 1)),
                Coord(1, IntPoint(1, 1)),
              ),
              Side(
                Coord(8, IntPoint(1, 1)),
                Coord(19, IntPoint(1, 1)),
              ),
              Side(
                Coord(8, IntPoint(1, -1)),
                Coord(8, IntPoint(1, 1)),
              ),
              Side(
                Coord(12, IntPoint(1, 1)),
                Coord(8, IntPoint(1, -1)),
              ),
              Side(
                Coord(12, IntPoint(1, 1)),
                Coord(12, IntPoint(1, -1)),
              ),
              Side(
                Coord(11, IntPoint(1, -1)),
                Coord(12, IntPoint(1, -1)),
              ),
              Side(
                Coord(11, IntPoint(-1, -1)),
                Coord(11, IntPoint(1, -1)),
              ),
              Side(
                Coord(10, IntPoint(1, -1)),
                Coord(11, IntPoint(-1, -1)),
              ),
              Side(
                Coord(10, IntPoint(-1, -1)),
                Coord(10, IntPoint(1, -1)),
              ),
              Side(
                Coord(0, IntPoint(-1, -1)),
                Coord(9, IntPoint(-1, -1)),
              ),
              Side(
                Coord(0, IntPoint(-1, 1)),
                Coord(0, IntPoint(-1, -1)),
              )
            },
          ),
          EquidistantBoardConstraint(
            sides: {
              Side(
                Coord(0, IntPoint(-1, -1)),
                Coord(0, IntPoint(1, 1)),
              ),
              Side(
                Coord(10, IntPoint(1, -1)),
                Coord(9, IntPoint(-1, -1)),
              ),
              Side(
                Coord(12, IntPoint(1, 1)),
                Coord(11, IntPoint(1, -1)),
              ),
              Side(
                Coord(1, IntPoint(1, 1)),
                Coord(8, IntPoint(1, 1)),
              ),
              Side(
                Coord(0, IntPoint(-1, 1)),
                Coord(3, IntPoint(1, 1)),
              ),
              Side(
                Coord(0, IntPoint(-1, -1)),
                Coord(6, IntPoint(1, 1)),
              ),
              Side(
                Coord(6, IntPoint(1, 1)),
                Coord(10, IntPoint(-1, -1)),
              ),
              Side(
                Coord(11, IntPoint(-1, -1)),
                Coord(6, IntPoint(1, 1)),
              ),
              Side(
                Coord(5, IntPoint(1, 1)),
                Coord(11, IntPoint(-1, -1)),
              ),
              Side(
                Coord(12, IntPoint(1, -1)),
                Coord(5, IntPoint(1, 1)),
              ),
              Side(
                Coord(8, IntPoint(1, -1)),
                Coord(5, IntPoint(1, 1)),
              ),
              Side(
                Coord(1, IntPoint(1, -1)),
                Coord(8, IntPoint(1, -1)),
              ),
              Side(
                Coord(19, IntPoint(1, 1)),
                Coord(1, IntPoint(1, -1)),
              ),
              Side(
                Coord(1, IntPoint(-1, 1)),
                Coord(1, IntPoint(1, -1)),
              ),
              Side(
                Coord(0, IntPoint(1, 1)),
                Coord(1, IntPoint(-1, 1)),
              ),
              Side(
                Coord(3, IntPoint(-1, 1)),
                Coord(0, IntPoint(1, 1)),
              )
            },
          ),
          EquidistantBoardConstraint(
            sides: {
              Side(
                Coord(5, IntPoint(1, -1)),
                Coord(11, IntPoint(-1, 1)),
              ),
              Side(
                Coord(11, IntPoint(-1, -1)),
                Coord(11, IntPoint(-1, 1)),
              ),
              Side(
                Coord(4, IntPoint(1, -1)),
                Coord(0, IntPoint(1, -1)),
              ),
              Side(
                Coord(2, IntPoint(1, -1)),
                Coord(2, IntPoint(-1, -1)),
              ),
              Side(
                Coord(1, IntPoint(-1, -1)),
                Coord(2, IntPoint(-1, -1)),
              ),
              Side(
                Coord(8, IntPoint(-1, -1)),
                Coord(2, IntPoint(1, 1)),
              ),
              Side(
                Coord(2, IntPoint(1, -1)),
                Coord(2, IntPoint(1, 1)),
              ),
              Side(
                Coord(2, IntPoint(1, -1)),
                Coord(5, IntPoint(1, -1)),
              ),
              Side(
                Coord(4, IntPoint(1, -1)),
                Coord(2, IntPoint(1, -1)),
              ),
              Side(
                Coord(0, IntPoint(1, -1)),
                Coord(0, IntPoint(-1, -1)),
              ),
              Side(
                Coord(8, IntPoint(1, -1)),
                Coord(8, IntPoint(-1, -1)),
              ),
              Side(
                Coord(1, IntPoint(-1, 1)),
                Coord(1, IntPoint(-1, -1)),
              )
            },
          ),
          EquidistantBoardConstraint(
            sides: {
              Side(
                Coord(4, IntPoint(1, -1)),
                Coord(6, IntPoint(1, 1)),
              ),
              Side(
                Coord(5, IntPoint(1, -1)),
                Coord(6, IntPoint(1, 1)),
              ),
              Side(
                Coord(5, IntPoint(1, 1)),
                Coord(5, IntPoint(1, -1)),
              ),
              Side(
                Coord(2, IntPoint(1, 1)),
                Coord(5, IntPoint(1, 1)),
              ),
              Side(
                Coord(1, IntPoint(1, -1)),
                Coord(2, IntPoint(1, 1)),
              ),
              Side(
                Coord(2, IntPoint(-1, -1)),
                Coord(1, IntPoint(1, -1)),
              ),
              Side(
                Coord(0, IntPoint(1, 1)),
                Coord(2, IntPoint(-1, -1)),
              ),
              Side(
                Coord(4, IntPoint(1, -1)),
                Coord(0, IntPoint(1, 1)),
              )
            },
          ),
          EquidistantBoardConstraint(
            sides: {
              Side(
                Coord(11, IntPoint(-1, 1)),
                Coord(6, IntPoint(1, 1)),
              ),
              Side(
                Coord(0, IntPoint(1, -1)),
                Coord(6, IntPoint(1, 1)),
              ),
              Side(
                Coord(0, IntPoint(1, 1)),
                Coord(0, IntPoint(1, -1)),
              ),
              Side(
                Coord(1, IntPoint(-1, -1)),
                Coord(0, IntPoint(1, 1)),
              ),
              Side(
                Coord(1, IntPoint(1, -1)),
                Coord(1, IntPoint(-1, -1)),
              ),
              Side(
                Coord(8, IntPoint(-1, -1)),
                Coord(1, IntPoint(1, -1)),
              ),
              Side(
                Coord(5, IntPoint(1, 1)),
                Coord(8, IntPoint(-1, -1)),
              ),
              Side(
                Coord(11, IntPoint(-1, 1)),
                Coord(5, IntPoint(1, 1)),
              )
            },
          )
        ],
      ),
    );
  }();
  static final Board paths4 = () {
    return Board(
      charts: [(3, 3), (1, 1), (1, 1), (1, 1), (1, 1), (3, 3), (3, 3), (3, 3)],
      convs: [
        Conv(
          fromA: 0,
          toA: 1,
          rot: IntPoint(0, 2),
          trans: IntPoint(-6, -2),
        ),
        Conv(
          fromA: 0,
          toA: 2,
          rot: IntPoint(0, 2),
          trans: IntPoint(-2, -6),
        ),
        Conv(
          fromA: 1,
          toA: 5,
          rot: IntPoint(0, 2),
          trans: IntPoint(-2, 2),
        ),
        Conv(
          fromA: 2,
          toA: 6,
          rot: IntPoint(0, 2),
          trans: IntPoint(2, -2),
        ),
        Conv(
          fromA: 3,
          toA: 6,
          rot: IntPoint(0, 2),
          trans: IntPoint(6, 2),
        ),
        Conv(
          fromA: 3,
          toA: 7,
          rot: IntPoint(0, 2),
          trans: IntPoint(-2, 2),
        ),
        Conv(
          fromA: 4,
          toA: 5,
          rot: IntPoint(0, 2),
          trans: IntPoint(2, 6),
        ),
        Conv(
          fromA: 4,
          toA: 7,
          rot: IntPoint(0, 2),
          trans: IntPoint(2, -2),
        )
      ],
      quads: [
        Quad(
          DoublePoint(0.0455, 0.0455),
          DoublePoint(0.0455, 0.435),
          DoublePoint(0.435, 0.435),
          DoublePoint(0.435, 0.0455),
        ),
        Quad(
          DoublePoint(0.435, 0.175),
          DoublePoint(0.435, 0.305),
          DoublePoint(0.565, 0.305),
          DoublePoint(0.565, 0.175),
        ),
        Quad(
          DoublePoint(0.175, 0.435),
          DoublePoint(0.175, 0.565),
          DoublePoint(0.305, 0.565),
          DoublePoint(0.305, 0.435),
        ),
        Quad(
          DoublePoint(0.435, 0.695),
          DoublePoint(0.435, 0.825),
          DoublePoint(0.565, 0.825),
          DoublePoint(0.565, 0.695),
        ),
        Quad(
          DoublePoint(0.695, 0.435),
          DoublePoint(0.695, 0.565),
          DoublePoint(0.825, 0.565),
          DoublePoint(0.825, 0.435),
        ),
        Quad(
          DoublePoint(0.565, 0.0455),
          DoublePoint(0.565, 0.435),
          DoublePoint(0.955, 0.435),
          DoublePoint(0.955, 0.0455),
        ),
        Quad(
          DoublePoint(0.0455, 0.565),
          DoublePoint(0.0455, 0.955),
          DoublePoint(0.435, 0.955),
          DoublePoint(0.435, 0.565),
        ),
        Quad(
          DoublePoint(0.565, 0.565),
          DoublePoint(0.565, 0.955),
          DoublePoint(0.955, 0.955),
          DoublePoint(0.955, 0.565),
        )
      ],
      constraints: ConstraintSet(
        coincidents: [
          CoincidentBoardConstraint(
            coords: {Coord(7, IntPoint(3, -1)), Coord(4, IntPoint(1, 1))},
          ),
          CoincidentBoardConstraint(
            coords: {Coord(7, IntPoint(1, -1)), Coord(4, IntPoint(-1, 1))},
          ),
          CoincidentBoardConstraint(
            coords: {Coord(7, IntPoint(-1, 3)), Coord(3, IntPoint(1, 1))},
          ),
          CoincidentBoardConstraint(
            coords: {Coord(7, IntPoint(-1, 1)), Coord(3, IntPoint(1, -1))},
          ),
          CoincidentBoardConstraint(
            coords: {Coord(3, IntPoint(-1, 1)), Coord(6, IntPoint(5, 3))},
          ),
          CoincidentBoardConstraint(
            coords: {Coord(3, IntPoint(-1, -1)), Coord(6, IntPoint(5, 1))},
          ),
          CoincidentBoardConstraint(
            coords: {Coord(6, IntPoint(3, -1)), Coord(2, IntPoint(1, 1))},
          ),
          CoincidentBoardConstraint(
            coords: {Coord(6, IntPoint(1, -1)), Coord(2, IntPoint(-1, 1))},
          ),
          CoincidentBoardConstraint(
            coords: {Coord(4, IntPoint(1, -1)), Coord(5, IntPoint(3, 5))},
          ),
          CoincidentBoardConstraint(
            coords: {Coord(4, IntPoint(-1, -1)), Coord(5, IntPoint(1, 5))},
          ),
          CoincidentBoardConstraint(
            coords: {Coord(1, IntPoint(1, 1)), Coord(5, IntPoint(-1, 3))},
          ),
          CoincidentBoardConstraint(
            coords: {Coord(1, IntPoint(1, -1)), Coord(5, IntPoint(-1, 1))},
          ),
          CoincidentBoardConstraint(
            coords: {Coord(2, IntPoint(1, -1)), Coord(0, IntPoint(3, 5))},
          ),
          CoincidentBoardConstraint(
            coords: {Coord(2, IntPoint(-1, -1)), Coord(0, IntPoint(1, 5))},
          ),
          CoincidentBoardConstraint(
            coords: {Coord(1, IntPoint(-1, 1)), Coord(0, IntPoint(5, 3))},
          ),
          CoincidentBoardConstraint(
            coords: {Coord(1, IntPoint(-1, -1)), Coord(0, IntPoint(5, 1))},
          )
        ],
        equidistants: [
          EquidistantBoardConstraint(
            sides: {
              Side(
                Coord(6, IntPoint(-1, 3)),
                Coord(6, IntPoint(1, 5)),
              ),
              Side(
                Coord(2, IntPoint(1, 1)),
                Coord(0, IntPoint(1, 5)),
              ),
              Side(
                Coord(0, IntPoint(3, 5)),
                Coord(2, IntPoint(-1, 1)),
              ),
              Side(
                Coord(1, IntPoint(1, -1)),
                Coord(0, IntPoint(5, 3)),
              ),
              Side(
                Coord(0, IntPoint(5, 1)),
                Coord(1, IntPoint(1, 1)),
              ),
              Side(
                Coord(4, IntPoint(1, -1)),
                Coord(4, IntPoint(-1, 1)),
              ),
              Side(
                Coord(4, IntPoint(1, 1)),
                Coord(4, IntPoint(-1, -1)),
              ),
              Side(
                Coord(3, IntPoint(-1, 1)),
                Coord(3, IntPoint(1, -1)),
              ),
              Side(
                Coord(3, IntPoint(-1, -1)),
                Coord(3, IntPoint(1, 1)),
              ),
              Side(
                Coord(7, IntPoint(3, 5)),
                Coord(7, IntPoint(5, 3)),
              ),
              Side(
                Coord(5, IntPoint(3, -1)),
                Coord(5, IntPoint(5, 1)),
              ),
              Side(
                Coord(0, IntPoint(-1, 1)),
                Coord(0, IntPoint(1, -1)),
              )
            },
          ),
          EquidistantBoardConstraint(
            sides: {
              Side(
                Coord(0, IntPoint(1, 5)),
                Coord(2, IntPoint(-1, 1)),
              ),
              Side(
                Coord(1, IntPoint(1, -1)),
                Coord(0, IntPoint(5, 1)),
              ),
              Side(
                Coord(0, IntPoint(5, 3)),
                Coord(1, IntPoint(1, 1)),
              ),
              Side(
                Coord(4, IntPoint(-1, 1)),
                Coord(4, IntPoint(-1, -1)),
              ),
              Side(
                Coord(4, IntPoint(1, -1)),
                Coord(4, IntPoint(1, 1)),
              ),
              Side(
                Coord(3, IntPoint(-1, -1)),
                Coord(3, IntPoint(1, -1)),
              ),
              Side(
                Coord(3, IntPoint(1, 1)),
                Coord(3, IntPoint(-1, 1)),
              ),
              Side(
                Coord(0, IntPoint(3, 5)),
                Coord(2, IntPoint(1, 1)),
              )
            },
          ),
          EquidistantBoardConstraint(
            sides: {
              Side(
                Coord(0, IntPoint(5, 5)),
                Coord(0, IntPoint(-1, -1)),
              ),
              Side(
                Coord(6, IntPoint(5, 5)),
                Coord(6, IntPoint(-1, -1)),
              ),
              Side(
                Coord(6, IntPoint(-1, 5)),
                Coord(6, IntPoint(5, -1)),
              ),
              Side(
                Coord(7, IntPoint(5, 5)),
                Coord(7, IntPoint(-1, -1)),
              ),
              Side(
                Coord(7, IntPoint(-1, 5)),
                Coord(7, IntPoint(5, -1)),
              ),
              Side(
                Coord(5, IntPoint(5, -1)),
                Coord(5, IntPoint(-1, 5)),
              ),
              Side(
                Coord(5, IntPoint(-1, -1)),
                Coord(5, IntPoint(5, 5)),
              ),
              Side(
                Coord(0, IntPoint(-1, 5)),
                Coord(0, IntPoint(5, -1)),
              )
            },
          ),
          EquidistantBoardConstraint(
            sides: {
              Side(
                Coord(0, IntPoint(-1, 5)),
                Coord(0, IntPoint(5, 5)),
              ),
              Side(
                Coord(6, IntPoint(-1, 5)),
                Coord(6, IntPoint(-1, -1)),
              ),
              Side(
                Coord(6, IntPoint(5, 5)),
                Coord(6, IntPoint(-1, 5)),
              ),
              Side(
                Coord(6, IntPoint(5, -1)),
                Coord(6, IntPoint(5, 5)),
              ),
              Side(
                Coord(6, IntPoint(-1, -1)),
                Coord(6, IntPoint(5, -1)),
              ),
              Side(
                Coord(7, IntPoint(-1, 5)),
                Coord(7, IntPoint(-1, -1)),
              ),
              Side(
                Coord(7, IntPoint(5, 5)),
                Coord(7, IntPoint(-1, 5)),
              ),
              Side(
                Coord(7, IntPoint(5, -1)),
                Coord(7, IntPoint(5, 5)),
              ),
              Side(
                Coord(7, IntPoint(-1, -1)),
                Coord(7, IntPoint(5, -1)),
              ),
              Side(
                Coord(5, IntPoint(5, 5)),
                Coord(5, IntPoint(-1, 5)),
              ),
              Side(
                Coord(5, IntPoint(5, -1)),
                Coord(5, IntPoint(5, 5)),
              ),
              Side(
                Coord(5, IntPoint(-1, -1)),
                Coord(5, IntPoint(5, -1)),
              ),
              Side(
                Coord(5, IntPoint(-1, 5)),
                Coord(5, IntPoint(-1, -1)),
              ),
              Side(
                Coord(0, IntPoint(5, -1)),
                Coord(0, IntPoint(5, 5)),
              ),
              Side(
                Coord(0, IntPoint(-1, -1)),
                Coord(0, IntPoint(5, -1)),
              ),
              Side(
                Coord(0, IntPoint(-1, 5)),
                Coord(0, IntPoint(-1, -1)),
              )
            },
          )
        ],
      ),
    );
  }();
  static final Board split4 = () {
    return Board(
      charts: [
        (1, 2),
        (1, 2),
        (1, 2),
        (1, 2),
        (1, 2),
        (1, 2),
        (1, 2),
        (1, 2),
        (2, 2),
        (2, 2),
        (2, 2),
        (2, 2),
        (2, 2)
      ],
      convs: [
        Conv(
          fromA: 0,
          toA: 8,
          rot: IntPoint(0, 2),
          trans: IntPoint(2, 4),
        ),
        Conv(
          fromA: 0,
          toA: 12,
          rot: IntPoint(0, 2),
          trans: IntPoint(-2, 0),
        ),
        Conv(
          fromA: 1,
          toA: 8,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, -4),
        ),
        Conv(
          fromA: 1,
          toA: 10,
          rot: IntPoint(0, 2),
          trans: IntPoint(4, 0),
        ),
        Conv(
          fromA: 2,
          toA: 8,
          rot: IntPoint(2, 0),
          trans: IntPoint(4, 2),
        ),
        Conv(
          fromA: 2,
          toA: 12,
          rot: IntPoint(2, 0),
          trans: IntPoint(0, -2),
        ),
        Conv(
          fromA: 3,
          toA: 8,
          rot: IntPoint(2, 0),
          trans: IntPoint(4, 0),
        ),
        Conv(
          fromA: 3,
          toA: 9,
          rot: IntPoint(2, 0),
          trans: IntPoint(0, 4),
        ),
        Conv(
          fromA: 4,
          toA: 8,
          rot: IntPoint(2, 0),
          trans: IntPoint(-4, 0),
        ),
        Conv(
          fromA: 4,
          toA: 10,
          rot: IntPoint(2, 0),
          trans: IntPoint(0, 4),
        ),
        Conv(
          fromA: 5,
          toA: 8,
          rot: IntPoint(2, 0),
          trans: IntPoint(-4, 2),
        ),
        Conv(
          fromA: 5,
          toA: 11,
          rot: IntPoint(2, 0),
          trans: IntPoint(0, -2),
        ),
        Conv(
          fromA: 6,
          toA: 8,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, 4),
        ),
        Conv(
          fromA: 6,
          toA: 11,
          rot: IntPoint(0, 2),
          trans: IntPoint(4, 0),
        ),
        Conv(
          fromA: 7,
          toA: 8,
          rot: IntPoint(0, 2),
          trans: IntPoint(2, -4),
        ),
        Conv(
          fromA: 7,
          toA: 9,
          rot: IntPoint(0, 2),
          trans: IntPoint(-2, 0),
        )
      ],
      quads: [
        Quad(
          DoublePoint(0.500, 0.691),
          DoublePoint(0.565, 0.947),
          DoublePoint(0.694, 0.955),
          DoublePoint(0.691, 0.691),
        ),
        Quad(
          DoublePoint(0.306, 0.0455),
          DoublePoint(0.309, 0.309),
          DoublePoint(0.500, 0.309),
          DoublePoint(0.435, 0.0535),
        ),
        Quad(
          DoublePoint(0.691, 0.691),
          DoublePoint(0.955, 0.694),
          DoublePoint(0.947, 0.565),
          DoublePoint(0.691, 0.500),
        ),
        Quad(
          DoublePoint(0.691, 0.500),
          DoublePoint(0.947, 0.435),
          DoublePoint(0.955, 0.306),
          DoublePoint(0.691, 0.309),
        ),
        Quad(
          DoublePoint(0.0535, 0.435),
          DoublePoint(0.309, 0.500),
          DoublePoint(0.309, 0.309),
          DoublePoint(0.0455, 0.306),
        ),
        Quad(
          DoublePoint(0.0455, 0.694),
          DoublePoint(0.309, 0.691),
          DoublePoint(0.309, 0.500),
          DoublePoint(0.0535, 0.565),
        ),
        Quad(
          DoublePoint(0.309, 0.691),
          DoublePoint(0.306, 0.955),
          DoublePoint(0.435, 0.947),
          DoublePoint(0.500, 0.691),
        ),
        Quad(
          DoublePoint(0.565, 0.0535),
          DoublePoint(0.500, 0.309),
          DoublePoint(0.691, 0.309),
          DoublePoint(0.694, 0.0455),
        ),
        Quad(
          DoublePoint(0.309, 0.309),
          DoublePoint(0.309, 0.691),
          DoublePoint(0.691, 0.691),
          DoublePoint(0.691, 0.309),
        ),
        Quad(
          DoublePoint(0.694, 0.0455),
          DoublePoint(0.691, 0.309),
          DoublePoint(0.955, 0.306),
          DoublePoint(0.952, 0.0481),
        ),
        Quad(
          DoublePoint(0.0481, 0.0481),
          DoublePoint(0.0455, 0.306),
          DoublePoint(0.309, 0.309),
          DoublePoint(0.306, 0.0455),
        ),
        Quad(
          DoublePoint(0.0455, 0.694),
          DoublePoint(0.0481, 0.952),
          DoublePoint(0.306, 0.955),
          DoublePoint(0.309, 0.691),
        ),
        Quad(
          DoublePoint(0.691, 0.691),
          DoublePoint(0.694, 0.955),
          DoublePoint(0.952, 0.952),
          DoublePoint(0.955, 0.694),
        )
      ],
      constraints: ConstraintSet(
        coincidents: [
          CoincidentBoardConstraint(
            coords: {Coord(5, IntPoint(-1, -1)), Coord(11, IntPoint(-1, -1))},
          ),
          CoincidentBoardConstraint(
            coords: {Coord(4, IntPoint(1, -1)), Coord(10, IntPoint(-1, 3))},
          ),
          CoincidentBoardConstraint(
            coords: {Coord(1, IntPoint(-1, -1)), Coord(10, IntPoint(3, -1))},
          ),
          CoincidentBoardConstraint(
            coords: {Coord(9, IntPoint(-1, -1)), Coord(7, IntPoint(1, -1))},
          ),
          CoincidentBoardConstraint(
            coords: {Coord(3, IntPoint(1, 3)), Coord(9, IntPoint(3, 3))},
          ),
          CoincidentBoardConstraint(
            coords: {Coord(12, IntPoint(3, -1)), Coord(2, IntPoint(-1, 3))},
          ),
          CoincidentBoardConstraint(
            coords: {Coord(0, IntPoint(1, 3)), Coord(12, IntPoint(-1, 3))},
          ),
          CoincidentBoardConstraint(
            coords: {Coord(6, IntPoint(-1, 3)), Coord(11, IntPoint(3, 3))},
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(11, IntPoint(3, -1)),
              Coord(8, IntPoint(-1, 3)),
              Coord(5, IntPoint(-1, 3)),
              Coord(6, IntPoint(-1, -1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(4, IntPoint(1, 3)),
              Coord(10, IntPoint(3, 3)),
              Coord(8, IntPoint(-1, -1)),
              Coord(1, IntPoint(-1, 3))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(8, IntPoint(3, -1)),
              Coord(3, IntPoint(1, -1)),
              Coord(7, IntPoint(1, 3)),
              Coord(9, IntPoint(-1, 3))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(2, IntPoint(1, -1)),
              Coord(3, IntPoint(-1, -1)),
              Coord(8, IntPoint(3, 1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(0, IntPoint(1, -1)),
              Coord(8, IntPoint(3, 3)),
              Coord(12, IntPoint(-1, -1)),
              Coord(2, IntPoint(-1, -1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(6, IntPoint(1, -1)),
              Coord(0, IntPoint(-1, -1)),
              Coord(8, IntPoint(1, 3))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(8, IntPoint(-1, 1)),
              Coord(5, IntPoint(1, 3)),
              Coord(4, IntPoint(-1, 3))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(7, IntPoint(-1, 3)),
              Coord(1, IntPoint(1, 3)),
              Coord(8, IntPoint(1, -1))
            },
          )
        ],
        equidistants: [
          EquidistantBoardConstraint(
            sides: {
              Side(
                Coord(1, IntPoint(-1, 3)),
                Coord(1, IntPoint(-1, -1)),
              ),
              Side(
                Coord(1, IntPoint(1, 3)),
                Coord(1, IntPoint(1, -1)),
              ),
              Side(
                Coord(7, IntPoint(-1, -1)),
                Coord(1, IntPoint(1, 3)),
              ),
              Side(
                Coord(3, IntPoint(1, -1)),
                Coord(7, IntPoint(1, -1)),
              ),
              Side(
                Coord(3, IntPoint(1, 3)),
                Coord(3, IntPoint(1, -1)),
              ),
              Side(
                Coord(0, IntPoint(1, -1)),
                Coord(2, IntPoint(-1, 3)),
              ),
              Side(
                Coord(0, IntPoint(1, 3)),
                Coord(0, IntPoint(1, -1)),
              ),
              Side(
                Coord(5, IntPoint(-1, 3)),
                Coord(6, IntPoint(-1, 3)),
              ),
              Side(
                Coord(5, IntPoint(-1, -1)),
                Coord(5, IntPoint(-1, 3)),
              ),
              Side(
                Coord(1, IntPoint(-1, 3)),
                Coord(4, IntPoint(1, -1)),
              ),
              Side(
                Coord(4, IntPoint(-1, 3)),
                Coord(4, IntPoint(-1, -1)),
              ),
              Side(
                Coord(2, IntPoint(1, -1)),
                Coord(3, IntPoint(-1, 3)),
              ),
              Side(
                Coord(2, IntPoint(1, 3)),
                Coord(2, IntPoint(1, -1)),
              ),
              Side(
                Coord(0, IntPoint(-1, -1)),
                Coord(0, IntPoint(-1, 3)),
              ),
              Side(
                Coord(6, IntPoint(1, 3)),
                Coord(0, IntPoint(-1, -1)),
              ),
              Side(
                Coord(4, IntPoint(-1, 3)),
                Coord(5, IntPoint(1, -1)),
              )
            },
          ),
          EquidistantBoardConstraint(
            sides: {
              Side(
                Coord(0, IntPoint(1, -1)),
                Coord(2, IntPoint(1, 3)),
              ),
              Side(
                Coord(3, IntPoint(1, -1)),
                Coord(3, IntPoint(-1, 3)),
              ),
              Side(
                Coord(3, IntPoint(1, -1)),
                Coord(7, IntPoint(-1, -1)),
              ),
              Side(
                Coord(1, IntPoint(-1, 3)),
                Coord(1, IntPoint(1, -1)),
              ),
              Side(
                Coord(4, IntPoint(-1, -1)),
                Coord(1, IntPoint(-1, 3)),
              ),
              Side(
                Coord(5, IntPoint(-1, 3)),
                Coord(5, IntPoint(1, -1)),
              ),
              Side(
                Coord(6, IntPoint(1, 3)),
                Coord(5, IntPoint(-1, 3)),
              ),
              Side(
                Coord(0, IntPoint(1, -1)),
                Coord(0, IntPoint(-1, 3)),
              )
            },
          ),
          EquidistantBoardConstraint(
            sides: {
              Side(
                Coord(2, IntPoint(1, -1)),
                Coord(2, IntPoint(-1, 3)),
              ),
              Side(
                Coord(0, IntPoint(-1, -1)),
                Coord(0, IntPoint(1, 3)),
              ),
              Side(
                Coord(6, IntPoint(-1, 3)),
                Coord(0, IntPoint(-1, -1)),
              ),
              Side(
                Coord(4, IntPoint(-1, 3)),
                Coord(5, IntPoint(-1, -1)),
              ),
              Side(
                Coord(4, IntPoint(1, -1)),
                Coord(4, IntPoint(-1, 3)),
              ),
              Side(
                Coord(1, IntPoint(1, 3)),
                Coord(1, IntPoint(-1, -1)),
              ),
              Side(
                Coord(7, IntPoint(1, -1)),
                Coord(1, IntPoint(1, 3)),
              ),
              Side(
                Coord(2, IntPoint(1, -1)),
                Coord(3, IntPoint(1, 3)),
              )
            },
          ),
          EquidistantBoardConstraint(
            sides: {
              Side(
                Coord(0, IntPoint(1, -1)),
                Coord(1, IntPoint(-1, 3)),
              ),
              Side(
                Coord(3, IntPoint(1, -1)),
                Coord(5, IntPoint(-1, 3)),
              )
            },
          ),
          EquidistantBoardConstraint(
            sides: {
              Side(
                Coord(3, IntPoint(1, -1)),
                Coord(1, IntPoint(-1, 3)),
              ),
              Side(
                Coord(5, IntPoint(-1, 3)),
                Coord(1, IntPoint(-1, 3)),
              ),
              Side(
                Coord(0, IntPoint(1, -1)),
                Coord(5, IntPoint(-1, 3)),
              ),
              Side(
                Coord(3, IntPoint(1, -1)),
                Coord(0, IntPoint(1, -1)),
              )
            },
          ),
          EquidistantBoardConstraint(
            sides: {
              Side(
                Coord(2, IntPoint(-1, 3)),
                Coord(0, IntPoint(1, 3)),
              ),
              Side(
                Coord(5, IntPoint(-1, 3)),
                Coord(11, IntPoint(-1, 3)),
              ),
              Side(
                Coord(5, IntPoint(-1, -1)),
                Coord(6, IntPoint(-1, 3)),
              ),
              Side(
                Coord(10, IntPoint(-1, -1)),
                Coord(1, IntPoint(-1, 3)),
              ),
              Side(
                Coord(4, IntPoint(1, -1)),
                Coord(1, IntPoint(-1, -1)),
              ),
              Side(
                Coord(3, IntPoint(1, 3)),
                Coord(7, IntPoint(1, -1)),
              ),
              Side(
                Coord(9, IntPoint(3, -1)),
                Coord(3, IntPoint(1, -1)),
              ),
              Side(
                Coord(12, IntPoint(3, 3)),
                Coord(0, IntPoint(1, -1)),
              )
            },
          ),
          EquidistantBoardConstraint(
            sides: {
              Side(
                Coord(6, IntPoint(-1, 3)),
                Coord(11, IntPoint(1, 3)),
              ),
              Side(
                Coord(7, IntPoint(-1, -1)),
                Coord(1, IntPoint(1, -1)),
              ),
              Side(
                Coord(7, IntPoint(1, -1)),
                Coord(7, IntPoint(-1, -1)),
              ),
              Side(
                Coord(1, IntPoint(-1, -1)),
                Coord(1, IntPoint(1, -1)),
              ),
              Side(
                Coord(4, IntPoint(1, -1)),
                Coord(4, IntPoint(-1, -1)),
              ),
              Side(
                Coord(5, IntPoint(1, -1)),
                Coord(4, IntPoint(-1, -1)),
              ),
              Side(
                Coord(5, IntPoint(-1, -1)),
                Coord(5, IntPoint(1, -1)),
              ),
              Side(
                Coord(11, IntPoint(-1, 1)),
                Coord(5, IntPoint(-1, -1)),
              ),
              Side(
                Coord(10, IntPoint(-1, 1)),
                Coord(4, IntPoint(1, -1)),
              ),
              Side(
                Coord(1, IntPoint(-1, -1)),
                Coord(10, IntPoint(1, -1)),
              ),
              Side(
                Coord(9, IntPoint(1, -1)),
                Coord(7, IntPoint(1, -1)),
              ),
              Side(
                Coord(3, IntPoint(1, 3)),
                Coord(9, IntPoint(3, 1)),
              ),
              Side(
                Coord(3, IntPoint(-1, 3)),
                Coord(3, IntPoint(1, 3)),
              ),
              Side(
                Coord(2, IntPoint(1, 3)),
                Coord(3, IntPoint(-1, 3)),
              ),
              Side(
                Coord(2, IntPoint(-1, 3)),
                Coord(2, IntPoint(1, 3)),
              ),
              Side(
                Coord(12, IntPoint(3, 1)),
                Coord(2, IntPoint(-1, 3)),
              ),
              Side(
                Coord(0, IntPoint(1, 3)),
                Coord(12, IntPoint(1, 3)),
              ),
              Side(
                Coord(0, IntPoint(-1, 3)),
                Coord(0, IntPoint(1, 3)),
              ),
              Side(
                Coord(6, IntPoint(1, 3)),
                Coord(0, IntPoint(-1, 3)),
              ),
              Side(
                Coord(6, IntPoint(-1, 3)),
                Coord(6, IntPoint(1, 3)),
              )
            },
          )
        ],
      ),
    );
  }();
  static final Board triangles3 = () {
    return Board(
      charts: [
        (1, 1),
        (2, 2),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1),
        (1, 1)
      ],
      convs: [
        Conv(
          fromA: 0,
          toA: 1,
          rot: IntPoint(0, 2),
          trans: IntPoint(2, 4),
        ),
        Conv(
          fromA: 0,
          toA: 1,
          rot: IntPoint(-2, 0),
          trans: IntPoint(0, 4),
        ),
        Conv(
          fromA: 0,
          toA: 5,
          rot: IntPoint(-2, 0),
          trans: IntPoint(2, 0),
        ),
        Conv(
          fromA: 0,
          toA: 8,
          rot: IntPoint(0, 2),
          trans: IntPoint(-2, 0),
        ),
        Conv(
          fromA: 1,
          toA: 2,
          rot: IntPoint(0, 2),
          trans: IntPoint(-2, 2),
        ),
        Conv(
          fromA: 1,
          toA: 2,
          rot: IntPoint(-2, 0),
          trans: IntPoint(-2, 0),
        ),
        Conv(
          fromA: 1,
          toA: 3,
          rot: IntPoint(-2, 0),
          trans: IntPoint(0, -4),
        ),
        Conv(
          fromA: 1,
          toA: 3,
          rot: IntPoint(0, 2),
          trans: IntPoint(-4, -2),
        ),
        Conv(
          fromA: 1,
          toA: 4,
          rot: IntPoint(0, 2),
          trans: IntPoint(2, -2),
        ),
        Conv(
          fromA: 1,
          toA: 4,
          rot: IntPoint(2, 0),
          trans: IntPoint(0, -2),
        ),
        Conv(
          fromA: 2,
          toA: 6,
          rot: IntPoint(2, 0),
          trans: IntPoint(2, 0),
        ),
        Conv(
          fromA: 2,
          toA: 7,
          rot: IntPoint(0, 2),
          trans: IntPoint(-2, 0),
        ),
        Conv(
          fromA: 3,
          toA: 7,
          rot: IntPoint(2, 0),
          trans: IntPoint(0, 2),
        ),
        Conv(
          fromA: 3,
          toA: 8,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, -2),
        ),
        Conv(
          fromA: 4,
          toA: 5,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, -2),
        ),
        Conv(
          fromA: 4,
          toA: 6,
          rot: IntPoint(-2, 0),
          trans: IntPoint(0, 2),
        )
      ],
      quads: [
        Quad(
          DoublePoint(0.500, 0.727),
          DoublePoint(0.273, 0.727),
          DoublePoint(0.500, 0.955),
          DoublePoint(0.727, 0.727),
        ),
        Quad(
          DoublePoint(0.273, 0.273),
          DoublePoint(0.273, 0.727),
          DoublePoint(0.727, 0.727),
          DoublePoint(0.727, 0.273),
        ),
        Quad(
          DoublePoint(0.273, 0.273),
          DoublePoint(0.500, 0.273),
          DoublePoint(0.727, 0.273),
          DoublePoint(0.500, 0.0455),
        ),
        Quad(
          DoublePoint(0.727, 0.500),
          DoublePoint(0.727, 0.727),
          DoublePoint(0.955, 0.500),
          DoublePoint(0.727, 0.273),
        ),
        Quad(
          DoublePoint(0.273, 0.273),
          DoublePoint(0.0455, 0.500),
          DoublePoint(0.273, 0.727),
          DoublePoint(0.273, 0.500),
        ),
        Quad(
          DoublePoint(0.0455, 0.500),
          DoublePoint(0.0455, 0.955),
          DoublePoint(0.500, 0.955),
          DoublePoint(0.273, 0.727),
        ),
        Quad(
          DoublePoint(0.0455, 0.0455),
          DoublePoint(0.0455, 0.500),
          DoublePoint(0.273, 0.273),
          DoublePoint(0.500, 0.0455),
        ),
        Quad(
          DoublePoint(0.500, 0.0455),
          DoublePoint(0.727, 0.273),
          DoublePoint(0.955, 0.500),
          DoublePoint(0.955, 0.0455),
        ),
        Quad(
          DoublePoint(0.727, 0.727),
          DoublePoint(0.500, 0.955),
          DoublePoint(0.955, 0.955),
          DoublePoint(0.955, 0.500),
        )
      ],
      constraints: ConstraintSet(
        coincidents: [
          CoincidentBoardConstraint(
            coords: {
              Coord(8, IntPoint(-1, 1)),
              Coord(5, IntPoint(1, 1)),
              Coord(0, IntPoint(1, 1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(7, IntPoint(1, 1)),
              Coord(8, IntPoint(1, -1)),
              Coord(3, IntPoint(1, 1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(6, IntPoint(1, -1)),
              Coord(7, IntPoint(-1, -1)),
              Coord(2, IntPoint(1, -1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(5, IntPoint(-1, -1)),
              Coord(6, IntPoint(-1, 1)),
              Coord(4, IntPoint(-1, 1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(1, IntPoint(3, -1)),
              Coord(7, IntPoint(-1, 1)),
              Coord(3, IntPoint(1, -1)),
              Coord(2, IntPoint(1, 1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(0, IntPoint(1, -1)),
              Coord(8, IntPoint(-1, -1)),
              Coord(3, IntPoint(-1, 1)),
              Coord(1, IntPoint(3, 3))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(5, IntPoint(1, -1)),
              Coord(0, IntPoint(-1, 1)),
              Coord(4, IntPoint(1, 1)),
              Coord(1, IntPoint(-1, 3))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(1, IntPoint(-1, -1)),
              Coord(6, IntPoint(1, 1)),
              Coord(2, IntPoint(-1, -1)),
              Coord(4, IntPoint(-1, -1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {Coord(1, IntPoint(3, 1)), Coord(3, IntPoint(-1, -1))},
          ),
          CoincidentBoardConstraint(
            coords: {Coord(0, IntPoint(-1, -1)), Coord(1, IntPoint(1, 3))},
          ),
          CoincidentBoardConstraint(
            coords: {Coord(4, IntPoint(1, -1)), Coord(1, IntPoint(-1, 1))},
          ),
          CoincidentBoardConstraint(
            coords: {Coord(2, IntPoint(-1, 1)), Coord(1, IntPoint(1, -1))},
          )
        ],
        equidistants: [
          EquidistantBoardConstraint(
            sides: {
              Side(
                Coord(2, IntPoint(1, -1)),
                Coord(1, IntPoint(-1, -1)),
              ),
              Side(
                Coord(6, IntPoint(-1, -1)),
                Coord(1, IntPoint(-1, -1)),
              ),
              Side(
                Coord(4, IntPoint(-1, 1)),
                Coord(1, IntPoint(-1, -1)),
              ),
              Side(
                Coord(0, IntPoint(-1, 1)),
                Coord(4, IntPoint(-1, 1)),
              ),
              Side(
                Coord(5, IntPoint(-1, 1)),
                Coord(0, IntPoint(-1, 1)),
              ),
              Side(
                Coord(0, IntPoint(1, 1)),
                Coord(0, IntPoint(-1, 1)),
              ),
              Side(
                Coord(0, IntPoint(1, -1)),
                Coord(0, IntPoint(1, 1)),
              ),
              Side(
                Coord(8, IntPoint(1, 1)),
                Coord(0, IntPoint(1, -1)),
              ),
              Side(
                Coord(3, IntPoint(1, 1)),
                Coord(0, IntPoint(1, -1)),
              ),
              Side(
                Coord(1, IntPoint(3, -1)),
                Coord(3, IntPoint(1, 1)),
              ),
              Side(
                Coord(7, IntPoint(1, -1)),
                Coord(1, IntPoint(3, -1)),
              ),
              Side(
                Coord(2, IntPoint(1, -1)),
                Coord(1, IntPoint(3, -1)),
              )
            },
          ),
          EquidistantBoardConstraint(
            sides: {
              Side(
                Coord(4, IntPoint(-1, 1)),
                Coord(6, IntPoint(-1, -1)),
              ),
              Side(
                Coord(0, IntPoint(-1, 1)),
                Coord(1, IntPoint(-1, -1)),
              ),
              Side(
                Coord(0, IntPoint(1, -1)),
                Coord(0, IntPoint(-1, 1)),
              ),
              Side(
                Coord(1, IntPoint(3, -1)),
                Coord(0, IntPoint(1, -1)),
              ),
              Side(
                Coord(1, IntPoint(-1, -1)),
                Coord(1, IntPoint(3, -1)),
              ),
              Side(
                Coord(2, IntPoint(1, -1)),
                Coord(6, IntPoint(-1, -1)),
              ),
              Side(
                Coord(7, IntPoint(1, -1)),
                Coord(2, IntPoint(1, -1)),
              ),
              Side(
                Coord(3, IntPoint(1, 1)),
                Coord(7, IntPoint(1, -1)),
              ),
              Side(
                Coord(8, IntPoint(1, 1)),
                Coord(3, IntPoint(1, 1)),
              ),
              Side(
                Coord(0, IntPoint(1, 1)),
                Coord(8, IntPoint(1, 1)),
              ),
              Side(
                Coord(5, IntPoint(-1, 1)),
                Coord(0, IntPoint(1, 1)),
              ),
              Side(
                Coord(4, IntPoint(-1, 1)),
                Coord(5, IntPoint(-1, 1)),
              )
            },
          ),
          EquidistantBoardConstraint(
            sides: {
              Side(
                Coord(2, IntPoint(1, -1)),
                Coord(3, IntPoint(1, 1)),
              ),
              Side(
                Coord(0, IntPoint(1, -1)),
                Coord(1, IntPoint(-1, -1)),
              ),
              Side(
                Coord(0, IntPoint(-1, 1)),
                Coord(1, IntPoint(3, -1)),
              ),
              Side(
                Coord(0, IntPoint(1, 1)),
                Coord(4, IntPoint(-1, 1)),
              ),
              Side(
                Coord(0, IntPoint(1, 1)),
                Coord(3, IntPoint(1, 1)),
              ),
              Side(
                Coord(2, IntPoint(1, -1)),
                Coord(4, IntPoint(-1, 1)),
              )
            },
          )
        ],
      ),
    );
  }();
  static final Board bowtie = () {
    return Board(
      charts: [(1, 1), (1, 1), (1, 1), (1, 1), (1, 1)],
      convs: [
        Conv(
          fromA: 0,
          toA: 1,
          rot: IntPoint(0, 2),
          trans: IntPoint(2, 0),
        ),
        Conv(
          fromA: 0,
          toA: 2,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, -2),
        ),
        Conv(
          fromA: 0,
          toA: 3,
          rot: IntPoint(2, 0),
          trans: IntPoint(2, 0),
        ),
        Conv(
          fromA: 0,
          toA: 4,
          rot: IntPoint(0, 2),
          trans: IntPoint(-2, 0),
        ),
        Conv(
          fromA: 1,
          toA: 3,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, 2),
        ),
        Conv(
          fromA: 2,
          toA: 4,
          rot: IntPoint(2, 0),
          trans: IntPoint(0, 2),
        )
      ],
      quads: [
        Quad(
          DoublePoint(0.2, 0.5),
          DoublePoint(0.5, 0.7),
          DoublePoint(0.8, 0.5),
          DoublePoint(0.5, 0.3),
        ),
        Quad(
          DoublePoint(0.0, 0.5),
          DoublePoint(0.1, 0.8),
          DoublePoint(0.5, 0.7),
          DoublePoint(0.2, 0.5),
        ),
        Quad(
          DoublePoint(0.5, 0.7),
          DoublePoint(0.8, 0.9),
          DoublePoint(1.0, 0.5),
          DoublePoint(0.8, 0.5),
        ),
        Quad(
          DoublePoint(0.2, 0.1),
          DoublePoint(0.0, 0.5),
          DoublePoint(0.2, 0.5),
          DoublePoint(0.5, 0.3),
        ),
        Quad(
          DoublePoint(0.5, 0.3),
          DoublePoint(0.8, 0.5),
          DoublePoint(1.0, 0.5),
          DoublePoint(0.9, 0.2),
        )
      ],
      constraints: ConstraintSet.createNew(),
    );
  }();
}
