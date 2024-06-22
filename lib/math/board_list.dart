import 'package:fifteen/math/board.dart';
import 'package:fifteen/math/constraint.dart';
import 'package:fifteen/math/conv.dart';
import 'package:fifteen/math/offsett.dart';
import 'package:fifteen/math/quad.dart';
import 'package:flutter/material.dart';

class BoardList {
  static Board testRect(int n, int m) {
    return Board(
      charts: [(n, m)],
      convs: [],
      quads: [
        Quad(
          Offset(0.0, 0.0),
          Offset(1.0, 0.0),
          Offset(1.0, 1.0),
          Offset(0.0, 1.0),
        ),
      ],
      constraints: ConstraintSet.createNew(),
    );
  }

  static final List<Board> all = [
    testRect(3, 3),
    testRect(4, 4),
    testRect(5, 3),
    testRect(100, 100),
    Board(
      charts: [(1, 1), (1, 1), (1, 1), (1, 1), (1, 1)],
      convs: [
        Conv(
          fromA: 0,
          toA: 1,
          rot: Offsett(0, 2),
          trans: Offsett(2, 0),
        ),
        Conv(
          fromA: 0,
          toA: 2,
          rot: Offsett(0, 2),
          trans: Offsett(0, -2),
        ),
        Conv(
          fromA: 0,
          toA: 3,
          rot: Offsett(2, 0),
          trans: Offsett(2, 0),
        ),
        Conv(
          fromA: 0,
          toA: 4,
          rot: Offsett(0, 2),
          trans: Offsett(-2, 0),
        ),
        Conv(
          fromA: 1,
          toA: 3,
          rot: Offsett(0, 2),
          trans: Offsett(0, 2),
        ),
        Conv(
          fromA: 2,
          toA: 4,
          rot: Offsett(2, 0),
          trans: Offsett(0, 2),
        )
      ],
      quads: [
        Quad(
          Offset(0.2, 0.5),
          Offset(0.5, 0.7),
          Offset(0.8, 0.5),
          Offset(0.5, 0.3),
        ),
        Quad(
          Offset(0.0, 0.5),
          Offset(0.1, 0.8),
          Offset(0.5, 0.7),
          Offset(0.2, 0.5),
        ),
        Quad(
          Offset(0.5, 0.7),
          Offset(0.8, 0.9),
          Offset(1.0, 0.5),
          Offset(0.8, 0.5),
        ),
        Quad(
          Offset(0.2, 0.1),
          Offset(0.0, 0.5),
          Offset(0.2, 0.5),
          Offset(0.5, 0.3),
        ),
        Quad(
          Offset(0.5, 0.3),
          Offset(0.8, 0.5),
          Offset(1.0, 0.5),
          Offset(0.9, 0.2),
        )
      ],
      constraints: ConstraintSet.createNew(),
    ),
    Board(
      charts: [(1, 1)],
      convs: [],
      quads: [
        Quad(
          Offset(0.0, 0.2),
          Offset(0.5, 0.9),
          Offset(0.7, 0.7),
          Offset(1.0, 0.1),
        )
      ],
      constraints: ConstraintSet(
        coincidents: [],
        equidistants: [],
      ),
    ),
    Board(
      charts: [(2, 2), (2, 2), (2, 2)],
      convs: [
        Conv(fromA: 0, toA: 1, trans: Offsett(0, -4), rot: Offsett.up),
        Conv(fromA: 0, toA: 2, trans: Offsett(-4, 0), rot: Offsett.up),
        Conv(fromA: 1, toA: 2, trans: Offsett(0, 6), rot: Offsett.right),
      ],
      quads: [
        Quad(
          Offset(-0.8426729364919308, -0.5664551916030472),
          Offset(-0.05897370410395686, -1),
          Offset(-0.01268553244599202, 0.0005059164077277634),
          Offset(-0.8680440013839179, 0.3481024287495134),
        ).mult(0.5).add(Offset(0.5, 0.5)),
        Quad(
          Offset(-0.05897370410395686, -1),
          Offset(0.8680440013839185, -0.5155889979320708),
          Offset(0.8173018715999445, 0.5176564076527692),
          Offset(-0.01268553244599202, 0.0005059164077278466),
        ).mult(0.5).add(Offset(0.5, 0.5)),
        Quad(
          Offset(-0.8680440013839179, 0.34810242874951347),
          Offset(-0.01268553244599202, 0.0005059164077278466),
          Offset(0.8173018715999444, 0.5176564076527692),
          Offset(-0.012685532445992576, 0.9999999999999999),
        ).mult(0.5).add(Offset(0.5, 0.5)),
      ],
      constraints: ConstraintSet.createNew(),
    ),
  ];
}
