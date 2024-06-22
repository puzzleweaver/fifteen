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
          trans: IntPoint(0, -2),
        ),
        Conv(
          fromA: 0,
          toA: 3,
          rot: IntPoint(0, 2),
          trans: IntPoint(-2, 0),
        ),
        Conv(
          fromA: 1,
          toA: 2,
          rot: IntPoint(0, 2),
          trans: IntPoint(-2, 0),
        ),
        Conv(
          fromA: 1,
          toA: 8,
          rot: IntPoint(-2, 0),
          trans: IntPoint(2, 0),
        ),
        Conv(
          fromA: 2,
          toA: 3,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, 2),
        ),
        Conv(
          fromA: 2,
          toA: 4,
          rot: IntPoint(-2, 0),
          trans: IntPoint(0, -2),
        ),
        Conv(
          fromA: 2,
          toA: 9,
          rot: IntPoint(-2, 0),
          trans: IntPoint(2, 0),
        ),
        Conv(
          fromA: 3,
          toA: 7,
          rot: IntPoint(-2, 0),
          trans: IntPoint(0, -2),
        ),
        Conv(
          fromA: 4,
          toA: 6,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, -2),
        ),
        Conv(
          fromA: 4,
          toA: 7,
          rot: IntPoint(0, 2),
          trans: IntPoint(-2, 0),
        ),
        Conv(
          fromA: 4,
          toA: 9,
          rot: IntPoint(-2, 0),
          trans: IntPoint(0, 2),
        ),
        Conv(
          fromA: 5,
          toA: 6,
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
          fromA: 6,
          toA: 11,
          rot: IntPoint(-2, 0),
          trans: IntPoint(0, 2),
        ),
        Conv(
          fromA: 8,
          toA: 9,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, -2),
        ),
        Conv(
          fromA: 8,
          toA: 10,
          rot: IntPoint(0, 2),
          trans: IntPoint(2, 0),
        ),
        Conv(
          fromA: 9,
          toA: 11,
          rot: IntPoint(0, 2),
          trans: IntPoint(2, 0),
        ),
        Conv(
          fromA: 10,
          toA: 11,
          rot: IntPoint(0, 2),
          trans: IntPoint(0, -2),
        )
      ],
      quads: [
        Quad(
          DoublePoint(0.500, 0.0455),
          DoublePoint(0.303, 0.159),
          DoublePoint(0.500, 0.273),
          DoublePoint(0.697, 0.159),
        ),
        Quad(
          DoublePoint(0.303, 0.159),
          DoublePoint(0.106, 0.273),
          DoublePoint(0.303, 0.386),
          DoublePoint(0.500, 0.273),
        ),
        Quad(
          DoublePoint(0.500, 0.273),
          DoublePoint(0.303, 0.386),
          DoublePoint(0.500, 0.500),
          DoublePoint(0.697, 0.386),
        ),
        Quad(
          DoublePoint(0.697, 0.159),
          DoublePoint(0.500, 0.273),
          DoublePoint(0.697, 0.386),
          DoublePoint(0.894, 0.273),
        ),
        Quad(
          DoublePoint(0.500, 0.500),
          DoublePoint(0.500, 0.727),
          DoublePoint(0.697, 0.614),
          DoublePoint(0.697, 0.386),
        ),
        Quad(
          DoublePoint(0.697, 0.614),
          DoublePoint(0.697, 0.841),
          DoublePoint(0.894, 0.727),
          DoublePoint(0.894, 0.500),
        ),
        Quad(
          DoublePoint(0.500, 0.727),
          DoublePoint(0.500, 0.955),
          DoublePoint(0.697, 0.841),
          DoublePoint(0.697, 0.614),
        ),
        Quad(
          DoublePoint(0.697, 0.386),
          DoublePoint(0.697, 0.614),
          DoublePoint(0.894, 0.500),
          DoublePoint(0.894, 0.273),
        ),
        Quad(
          DoublePoint(0.106, 0.500),
          DoublePoint(0.303, 0.614),
          DoublePoint(0.303, 0.386),
          DoublePoint(0.106, 0.273),
        ),
        Quad(
          DoublePoint(0.303, 0.614),
          DoublePoint(0.500, 0.727),
          DoublePoint(0.500, 0.500),
          DoublePoint(0.303, 0.386),
        ),
        Quad(
          DoublePoint(0.106, 0.727),
          DoublePoint(0.303, 0.841),
          DoublePoint(0.303, 0.614),
          DoublePoint(0.106, 0.500),
        ),
        Quad(
          DoublePoint(0.303, 0.841),
          DoublePoint(0.500, 0.955),
          DoublePoint(0.500, 0.727),
          DoublePoint(0.303, 0.614),
        )
      ],
      constraints: ConstraintSet(
        coincidents: [
          CoincidentBoardConstraint(
            coords: {Coord(11, IntPoint(-1, 1)), Coord(6, IntPoint(-1, 1))},
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(9, IntPoint(-1, 1)),
              Coord(4, IntPoint(-1, 1)),
              Coord(11, IntPoint(1, 1)),
              Coord(6, IntPoint(-1, -1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(9, IntPoint(1, 1)),
              Coord(2, IntPoint(1, 1)),
              Coord(4, IntPoint(-1, -1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(8, IntPoint(1, 1)),
              Coord(1, IntPoint(1, 1)),
              Coord(9, IntPoint(1, -1)),
              Coord(2, IntPoint(-1, 1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {Coord(8, IntPoint(1, -1)), Coord(1, IntPoint(-1, 1))},
          ),
          CoincidentBoardConstraint(
            coords: {Coord(10, IntPoint(-1, 1)), Coord(11, IntPoint(-1, -1))},
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(8, IntPoint(-1, 1)),
              Coord(10, IntPoint(1, 1)),
              Coord(9, IntPoint(-1, -1)),
              Coord(11, IntPoint(1, -1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {Coord(8, IntPoint(-1, -1)), Coord(10, IntPoint(1, -1))},
          ),
          CoincidentBoardConstraint(
            coords: {Coord(7, IntPoint(1, -1)), Coord(3, IntPoint(1, -1))},
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(4, IntPoint(1, -1)),
              Coord(2, IntPoint(1, -1)),
              Coord(7, IntPoint(-1, -1)),
              Coord(3, IntPoint(1, 1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {Coord(5, IntPoint(-1, 1)), Coord(6, IntPoint(1, 1))},
          ),
          CoincidentBoardConstraint(
            coords: {Coord(5, IntPoint(1, -1)), Coord(7, IntPoint(1, 1))},
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(5, IntPoint(-1, -1)),
              Coord(4, IntPoint(1, 1)),
              Coord(6, IntPoint(1, -1)),
              Coord(7, IntPoint(-1, 1))
            },
          ),
          CoincidentBoardConstraint(
            coords: {Coord(3, IntPoint(-1, -1)), Coord(0, IntPoint(1, -1))},
          ),
          CoincidentBoardConstraint(
            coords: {Coord(0, IntPoint(-1, 1)), Coord(1, IntPoint(-1, -1))},
          ),
          CoincidentBoardConstraint(
            coords: {
              Coord(2, IntPoint(-1, -1)),
              Coord(0, IntPoint(1, 1)),
              Coord(1, IntPoint(1, -1)),
              Coord(3, IntPoint(-1, 1))
            },
          )
        ],
        equidistants: [
          EquidistantBoardConstraint(
            sides: {
              Side(
                Coord(5, IntPoint(-1, 1)),
                Coord(4, IntPoint(-1, 1)),
              ),
              Side(
                Coord(6, IntPoint(-1, 1)),
                Coord(10, IntPoint(-1, 1)),
              ),
              Side(
                Coord(8, IntPoint(-1, 1)),
                Coord(10, IntPoint(-1, -1)),
              ),
              Side(
                Coord(9, IntPoint(-1, 1)),
                Coord(11, IntPoint(-1, 1)),
              ),
              Side(
                Coord(9, IntPoint(-1, 1)),
                Coord(10, IntPoint(-1, 1)),
              ),
              Side(
                Coord(9, IntPoint(1, 1)),
                Coord(8, IntPoint(-1, 1)),
              ),
              Side(
                Coord(8, IntPoint(-1, -1)),
                Coord(8, IntPoint(1, 1)),
              ),
              Side(
                Coord(8, IntPoint(1, -1)),
                Coord(8, IntPoint(-1, -1)),
              ),
              Side(
                Coord(8, IntPoint(-1, -1)),
                Coord(10, IntPoint(-1, -1)),
              ),
              Side(
                Coord(8, IntPoint(1, -1)),
                Coord(8, IntPoint(1, 1)),
              ),
              Side(
                Coord(8, IntPoint(-1, -1)),
                Coord(8, IntPoint(-1, 1)),
              ),
              Side(
                Coord(10, IntPoint(-1, -1)),
                Coord(10, IntPoint(-1, 1)),
              ),
              Side(
                Coord(8, IntPoint(-1, 1)),
                Coord(10, IntPoint(-1, 1)),
              ),
              Side(
                Coord(8, IntPoint(1, 1)),
                Coord(8, IntPoint(-1, 1)),
              ),
              Side(
                Coord(8, IntPoint(-1, 1)),
                Coord(9, IntPoint(-1, 1)),
              ),
              Side(
                Coord(8, IntPoint(1, 1)),
                Coord(9, IntPoint(1, 1)),
              ),
              Side(
                Coord(9, IntPoint(-1, 1)),
                Coord(9, IntPoint(1, 1)),
              ),
              Side(
                Coord(7, IntPoint(1, -1)),
                Coord(4, IntPoint(1, -1)),
              ),
              Side(
                Coord(5, IntPoint(1, -1)),
                Coord(5, IntPoint(1, 1)),
              ),
              Side(
                Coord(5, IntPoint(1, 1)),
                Coord(4, IntPoint(1, 1)),
              ),
              Side(
                Coord(4, IntPoint(-1, -1)),
                Coord(4, IntPoint(1, 1)),
              ),
              Side(
                Coord(4, IntPoint(1, -1)),
                Coord(5, IntPoint(1, -1)),
              ),
              Side(
                Coord(4, IntPoint(1, -1)),
                Coord(4, IntPoint(-1, -1)),
              ),
              Side(
                Coord(4, IntPoint(1, 1)),
                Coord(4, IntPoint(-1, 1)),
              ),
              Side(
                Coord(5, IntPoint(1, -1)),
                Coord(4, IntPoint(1, 1)),
              ),
              Side(
                Coord(4, IntPoint(1, 1)),
                Coord(5, IntPoint(-1, 1)),
              ),
              Side(
                Coord(4, IntPoint(1, -1)),
                Coord(4, IntPoint(1, 1)),
              ),
              Side(
                Coord(5, IntPoint(1, -1)),
                Coord(7, IntPoint(1, -1)),
              ),
              Side(
                Coord(5, IntPoint(-1, 1)),
                Coord(6, IntPoint(-1, 1)),
              ),
              Side(
                Coord(5, IntPoint(-1, 1)),
                Coord(5, IntPoint(1, 1)),
              ),
              Side(
                Coord(0, IntPoint(1, -1)),
                Coord(3, IntPoint(1, -1)),
              ),
              Side(
                Coord(2, IntPoint(1, 1)),
                Coord(0, IntPoint(1, 1)),
              ),
              Side(
                Coord(0, IntPoint(1, 1)),
                Coord(2, IntPoint(1, -1)),
              ),
              Side(
                Coord(0, IntPoint(-1, -1)),
                Coord(0, IntPoint(1, -1)),
              ),
              Side(
                Coord(0, IntPoint(1, -1)),
                Coord(0, IntPoint(1, 1)),
              ),
              Side(
                Coord(0, IntPoint(1, -1)),
                Coord(2, IntPoint(1, -1)),
              ),
              Side(
                Coord(0, IntPoint(1, 1)),
                Coord(0, IntPoint(-1, 1)),
              ),
              Side(
                Coord(0, IntPoint(-1, -1)),
                Coord(0, IntPoint(-1, 1)),
              ),
              Side(
                Coord(0, IntPoint(-1, 1)),
                Coord(1, IntPoint(1, 1)),
              ),
              Side(
                Coord(0, IntPoint(-1, -1)),
                Coord(0, IntPoint(1, 1)),
              ),
              Side(
                Coord(0, IntPoint(-1, 1)),
                Coord(1, IntPoint(-1, 1)),
              ),
              Side(
                Coord(0, IntPoint(1, 1)),
                Coord(1, IntPoint(1, 1)),
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
