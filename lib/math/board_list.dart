import 'package:fifteen/math/board.dart';
import 'package:fifteen/math/constraint.dart';
import 'package:fifteen/math/conv.dart';
import 'package:fifteen/math/coord.dart';
import 'package:fifteen/math/double_point.dart';
import 'package:fifteen/math/int_point.dart';
import 'package:fifteen/math/quad.dart';
import 'package:fifteen/math/side.dart';

class BoardList {
  static Board testRect(int n, int m) {
    return Board(
      charts: [(n, m)],
      convs: [],
      quads: [
        Quad(
          DoublePoint(0.0, 0.0),
          DoublePoint(1.0, 0.0),
          DoublePoint(1.0, 1.0),
          DoublePoint(0.0, 1.0),
        ),
      ],
      constraints: ConstraintSet.createNew(),
    );
  }

  static final List<Board> all = [
    testRect(3, 3),
    testRect(4, 4),
    testRect(5, 3),
    testRect(15, 15),
    Board(
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
          DoublePoint(0.274, 0.502),
          DoublePoint(0.276, 0.728),
          DoublePoint(0.502, 0.726),
          DoublePoint(0.501, 0.630),
        ),
        Quad(
          DoublePoint(0.272, 0.276),
          DoublePoint(0.274, 0.502),
          DoublePoint(0.499, 0.370),
          DoublePoint(0.498, 0.274),
        ),
        Quad(
          DoublePoint(0.0474, 0.504),
          DoublePoint(0.0494, 0.730),
          DoublePoint(0.276, 0.728),
          DoublePoint(0.274, 0.502),
        ),
        Quad(
          DoublePoint(0.0455, 0.278),
          DoublePoint(0.0474, 0.504),
          DoublePoint(0.274, 0.502),
          DoublePoint(0.272, 0.276),
        ),
        Quad(
          DoublePoint(0.498, 0.274),
          DoublePoint(0.499, 0.370),
          DoublePoint(0.726, 0.498),
          DoublePoint(0.724, 0.272),
        ),
        Quad(
          DoublePoint(0.501, 0.630),
          DoublePoint(0.502, 0.726),
          DoublePoint(0.728, 0.724),
          DoublePoint(0.726, 0.498),
        ),
        Quad(
          DoublePoint(0.274, 0.502),
          DoublePoint(0.501, 0.630),
          DoublePoint(0.726, 0.498),
          DoublePoint(0.499, 0.370),
        ),
        Quad(
          DoublePoint(0.726, 0.498),
          DoublePoint(0.728, 0.724),
          DoublePoint(0.955, 0.722),
          DoublePoint(0.953, 0.496),
        ),
        Quad(
          DoublePoint(0.724, 0.272),
          DoublePoint(0.726, 0.498),
          DoublePoint(0.953, 0.496),
          DoublePoint(0.951, 0.270),
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
    ),
    Board(
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
          DoublePoint(0.0541, 0.299),
          DoublePoint(0.276, 0.363),
          DoublePoint(0.491, 0.281),
          DoublePoint(0.270, 0.217),
        ),
        Quad(
          DoublePoint(0.0541, 0.299),
          DoublePoint(0.0627, 0.517),
          DoublePoint(0.281, 0.509),
          DoublePoint(0.276, 0.363),
        ),
        Quad(
          DoublePoint(0.276, 0.363),
          DoublePoint(0.281, 0.509),
          DoublePoint(0.500, 0.500),
          DoublePoint(0.491, 0.281),
        ),
        Quad(
          DoublePoint(0.264, 0.0714),
          DoublePoint(0.270, 0.217),
          DoublePoint(0.491, 0.281),
          DoublePoint(0.483, 0.0627),
        ),
        Quad(
          DoublePoint(0.0455, 0.0800),
          DoublePoint(0.0541, 0.299),
          DoublePoint(0.270, 0.217),
          DoublePoint(0.264, 0.0714),
        ),
        Quad(
          DoublePoint(0.491, 0.281),
          DoublePoint(0.500, 0.500),
          DoublePoint(0.719, 0.491),
          DoublePoint(0.637, 0.276),
        ),
        Quad(
          DoublePoint(0.483, 0.0627),
          DoublePoint(0.491, 0.281),
          DoublePoint(0.637, 0.276),
          DoublePoint(0.701, 0.0541),
        ),
        Quad(
          DoublePoint(0.701, 0.0541),
          DoublePoint(0.637, 0.276),
          DoublePoint(0.719, 0.491),
          DoublePoint(0.783, 0.270),
        ),
        Quad(
          DoublePoint(0.783, 0.270),
          DoublePoint(0.719, 0.491),
          DoublePoint(0.937, 0.483),
          DoublePoint(0.929, 0.264),
        ),
        Quad(
          DoublePoint(0.701, 0.0541),
          DoublePoint(0.783, 0.270),
          DoublePoint(0.929, 0.264),
          DoublePoint(0.920, 0.0455),
        ),
        Quad(
          DoublePoint(0.0627, 0.517),
          DoublePoint(0.0714, 0.736),
          DoublePoint(0.217, 0.730),
          DoublePoint(0.281, 0.509),
        ),
        Quad(
          DoublePoint(0.281, 0.509),
          DoublePoint(0.363, 0.724),
          DoublePoint(0.509, 0.719),
          DoublePoint(0.500, 0.500),
        ),
        Quad(
          DoublePoint(0.281, 0.509),
          DoublePoint(0.217, 0.730),
          DoublePoint(0.299, 0.946),
          DoublePoint(0.363, 0.724),
        ),
        Quad(
          DoublePoint(0.0714, 0.736),
          DoublePoint(0.0800, 0.955),
          DoublePoint(0.299, 0.946),
          DoublePoint(0.217, 0.730),
        ),
        Quad(
          DoublePoint(0.363, 0.724),
          DoublePoint(0.299, 0.946),
          DoublePoint(0.517, 0.937),
          DoublePoint(0.509, 0.719),
        ),
        Quad(
          DoublePoint(0.500, 0.500),
          DoublePoint(0.509, 0.719),
          DoublePoint(0.724, 0.637),
          DoublePoint(0.719, 0.491),
        ),
        Quad(
          DoublePoint(0.719, 0.491),
          DoublePoint(0.724, 0.637),
          DoublePoint(0.946, 0.701),
          DoublePoint(0.937, 0.483),
        ),
        Quad(
          DoublePoint(0.509, 0.719),
          DoublePoint(0.517, 0.937),
          DoublePoint(0.736, 0.929),
          DoublePoint(0.730, 0.783),
        ),
        Quad(
          DoublePoint(0.509, 0.719),
          DoublePoint(0.730, 0.783),
          DoublePoint(0.946, 0.701),
          DoublePoint(0.724, 0.637),
        ),
        Quad(
          DoublePoint(0.730, 0.783),
          DoublePoint(0.736, 0.929),
          DoublePoint(0.955, 0.920),
          DoublePoint(0.946, 0.701),
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
    ),
    Board(
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
    ),
  ];
}
