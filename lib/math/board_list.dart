import 'package:fifteen/math/board.dart';
import 'package:fifteen/math/constraint.dart';
import 'package:fifteen/math/conv.dart';
import 'package:fifteen/math/coord.dart';
import 'package:fifteen/math/offsett.dart';
import 'package:fifteen/math/quad.dart';
import 'package:fifteen/math/side.dart';
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
          rot: Offsett(2, 0),
          trans: Offsett(0, -2),
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
          trans: Offsett(0, 2),
        ),
        Conv(
          fromA: 0,
          toA: 4,
          rot: Offsett(0, 2),
          trans: Offsett(0, 2),
        ),
        Conv(
          fromA: 1,
          toA: 2,
          rot: Offsett(0, 2),
          trans: Offsett(-2, 0),
        ),
        Conv(
          fromA: 1,
          toA: 10,
          rot: Offsett(0, 2),
          trans: Offsett(0, -2),
        ),
        Conv(
          fromA: 2,
          toA: 5,
          rot: Offsett(0, 2),
          trans: Offsett(-2, 0),
        ),
        Conv(
          fromA: 2,
          toA: 11,
          rot: Offsett(0, 2),
          trans: Offsett(0, -2),
        ),
        Conv(
          fromA: 3,
          toA: 4,
          rot: Offsett(0, 2),
          trans: Offsett(2, 0),
        ),
        Conv(
          fromA: 3,
          toA: 6,
          rot: Offsett(0, 2),
          trans: Offsett(-2, 0),
        ),
        Conv(
          fromA: 5,
          toA: 6,
          rot: Offsett(0, 2),
          trans: Offsett(0, 2),
        ),
        Conv(
          fromA: 5,
          toA: 7,
          rot: Offsett(2, 0),
          trans: Offsett(0, 2),
        ),
        Conv(
          fromA: 5,
          toA: 15,
          rot: Offsett(0, 2),
          trans: Offsett(0, -2),
        ),
        Conv(
          fromA: 6,
          toA: 7,
          rot: Offsett(0, 2),
          trans: Offsett(-2, 0),
        ),
        Conv(
          fromA: 7,
          toA: 8,
          rot: Offsett(0, 2),
          trans: Offsett(-2, 0),
        ),
        Conv(
          fromA: 7,
          toA: 9,
          rot: Offsett(-2, 0),
          trans: Offsett(-2, 0),
        ),
        Conv(
          fromA: 8,
          toA: 9,
          rot: Offsett(0, 2),
          trans: Offsett(0, 2),
        ),
        Conv(
          fromA: 8,
          toA: 16,
          rot: Offsett(0, 2),
          trans: Offsett(0, -2),
        ),
        Conv(
          fromA: 10,
          toA: 12,
          rot: Offsett(0, 2),
          trans: Offsett(-2, 0),
        ),
        Conv(
          fromA: 10,
          toA: 13,
          rot: Offsett(0, 2),
          trans: Offsett(0, -2),
        ),
        Conv(
          fromA: 11,
          toA: 12,
          rot: Offsett(2, 0),
          trans: Offsett(0, -2),
        ),
        Conv(
          fromA: 11,
          toA: 14,
          rot: Offsett(0, 2),
          trans: Offsett(0, -2),
        ),
        Conv(
          fromA: 11,
          toA: 15,
          rot: Offsett(0, 2),
          trans: Offsett(-2, 0),
        ),
        Conv(
          fromA: 12,
          toA: 13,
          rot: Offsett(-2, 0),
          trans: Offsett(2, 0),
        ),
        Conv(
          fromA: 12,
          toA: 14,
          rot: Offsett(0, 2),
          trans: Offsett(-2, 0),
        ),
        Conv(
          fromA: 14,
          toA: 17,
          rot: Offsett(0, 2),
          trans: Offsett(-2, 0),
        ),
        Conv(
          fromA: 15,
          toA: 16,
          rot: Offsett(0, 2),
          trans: Offsett(-2, 0),
        ),
        Conv(
          fromA: 15,
          toA: 18,
          rot: Offsett(0, 2),
          trans: Offsett(0, -2),
        ),
        Conv(
          fromA: 16,
          toA: 18,
          rot: Offsett(-2, 0),
          trans: Offsett(2, 0),
        ),
        Conv(
          fromA: 17,
          toA: 18,
          rot: Offsett(-2, 0),
          trans: Offsett(-2, 0),
        ),
        Conv(
          fromA: 17,
          toA: 19,
          rot: Offsett(0, 2),
          trans: Offsett(-2, 0),
        ),
        Conv(
          fromA: 18,
          toA: 19,
          rot: Offsett(0, 2),
          trans: Offsett(0, -2),
        )
      ],
      quads: [
        Quad(
          Offset(0.0, 0.3),
          Offset(0.3, 0.4),
          Offset(0.5, 0.3),
          Offset(0.3, 0.2),
        ),
        Quad(
          Offset(0.0, 0.3),
          Offset(0.1, 0.5),
          Offset(0.3, 0.5),
          Offset(0.3, 0.4),
        ),
        Quad(
          Offset(0.3, 0.4),
          Offset(0.3, 0.5),
          Offset(0.5, 0.5),
          Offset(0.5, 0.3),
        ),
        Quad(
          Offset(0.3, 0.1),
          Offset(0.3, 0.2),
          Offset(0.5, 0.3),
          Offset(0.5, 0.1),
        ),
        Quad(
          Offset(0.0, 0.1),
          Offset(0.0, 0.3),
          Offset(0.3, 0.2),
          Offset(0.3, 0.1),
        ),
        Quad(
          Offset(0.5, 0.3),
          Offset(0.5, 0.5),
          Offset(0.7, 0.5),
          Offset(0.6, 0.3),
        ),
        Quad(
          Offset(0.5, 0.1),
          Offset(0.5, 0.3),
          Offset(0.6, 0.3),
          Offset(0.7, 0.0),
        ),
        Quad(
          Offset(0.7, 0.0),
          Offset(0.6, 0.3),
          Offset(0.7, 0.5),
          Offset(0.8, 0.3),
        ),
        Quad(
          Offset(0.8, 0.3),
          Offset(0.7, 0.5),
          Offset(0.9, 0.5),
          Offset(0.9, 0.3),
        ),
        Quad(
          Offset(0.7, 0.0),
          Offset(0.8, 0.3),
          Offset(0.9, 0.3),
          Offset(0.9, 0.0),
        ),
        Quad(
          Offset(0.1, 0.5),
          Offset(0.1, 0.7),
          Offset(0.2, 0.7),
          Offset(0.3, 0.5),
        ),
        Quad(
          Offset(0.3, 0.5),
          Offset(0.4, 0.7),
          Offset(0.5, 0.7),
          Offset(0.5, 0.5),
        ),
        Quad(
          Offset(0.3, 0.5),
          Offset(0.2, 0.7),
          Offset(0.3, 1.0),
          Offset(0.4, 0.7),
        ),
        Quad(
          Offset(0.1, 0.7),
          Offset(0.1, 1.0),
          Offset(0.3, 1.0),
          Offset(0.2, 0.7),
        ),
        Quad(
          Offset(0.4, 0.7),
          Offset(0.3, 1.0),
          Offset(0.5, 0.9),
          Offset(0.5, 0.7),
        ),
        Quad(
          Offset(0.5, 0.5),
          Offset(0.5, 0.7),
          Offset(0.7, 0.6),
          Offset(0.7, 0.5),
        ),
        Quad(
          Offset(0.7, 0.5),
          Offset(0.7, 0.6),
          Offset(1.0, 0.7),
          Offset(0.9, 0.5),
        ),
        Quad(
          Offset(0.5, 0.7),
          Offset(0.5, 0.9),
          Offset(0.7, 0.9),
          Offset(0.7, 0.8),
        ),
        Quad(
          Offset(0.5, 0.7),
          Offset(0.7, 0.8),
          Offset(1.0, 0.7),
          Offset(0.7, 0.6),
        ),
        Quad(
          Offset(0.7, 0.8),
          Offset(0.7, 0.9),
          Offset(1.0, 0.9),
          Offset(1.0, 0.7),
        )
      ],
      constraints: ConstraintSet(
        coincidents: [
          CoincidentBoardConstraint(coords: {
            Coord(19, Offsett(1, -1)),
            Coord(16, Offsett(1, 1)),
            Coord(18, Offsett(1, 1)),
          }),
          CoincidentBoardConstraint(coords: {
            Coord(19, Offsett(-1, 1)),
            Coord(17, Offsett(1, 1)),
          }),
          CoincidentBoardConstraint(coords: {
            Coord(19, Offsett(-1, -1)),
            Coord(17, Offsett(1, -1)),
            Coord(18, Offsett(-1, 1)),
          }),
          CoincidentBoardConstraint(coords: {
            Coord(8, Offsett(1, 1)),
            Coord(16, Offsett(1, -1)),
          }),
          CoincidentBoardConstraint(coords: {
            Coord(16, Offsett(-1, 1)),
            Coord(15, Offsett(1, 1)),
            Coord(18, Offsett(1, -1)),
          }),
          CoincidentBoardConstraint(coords: {
            Coord(16, Offsett(-1, -1)),
            Coord(5, Offsett(1, 1)),
            Coord(15, Offsett(1, -1)),
            Coord(8, Offsett(-1, 1)),
            Coord(7, Offsett(1, 1)),
          }),
          CoincidentBoardConstraint(coords: {
            Coord(18, Offsett(-1, -1)),
            Coord(11, Offsett(1, 1)),
            Coord(17, Offsett(-1, -1)),
            Coord(15, Offsett(-1, 1)),
            Coord(14, Offsett(1, -1)),
          }),
          CoincidentBoardConstraint(coords: {
            Coord(17, Offsett(-1, 1)),
            Coord(14, Offsett(1, 1)),
          }),
          CoincidentBoardConstraint(coords: {
            Coord(15, Offsett(-1, -1)),
            Coord(2, Offsett(1, 1)),
            Coord(11, Offsett(1, -1)),
            Coord(5, Offsett(-1, 1)),
          }),
          CoincidentBoardConstraint(coords: {
            Coord(14, Offsett(-1, 1)),
            Coord(12, Offsett(1, 1)),
            Coord(13, Offsett(1, 1)),
          }),
          CoincidentBoardConstraint(coords: {
            Coord(14, Offsett(-1, -1)),
            Coord(11, Offsett(-1, 1)),
            Coord(12, Offsett(1, -1)),
          }),
          CoincidentBoardConstraint(coords: {
            Coord(13, Offsett(-1, -1)),
            Coord(10, Offsett(-1, 1)),
          }),
          CoincidentBoardConstraint(coords: {
            Coord(13, Offsett(1, -1)),
            Coord(10, Offsett(1, 1)),
            Coord(12, Offsett(-1, 1)),
          }),
          CoincidentBoardConstraint(coords: {
            Coord(12, Offsett(-1, -1)),
            Coord(1, Offsett(1, 1)),
            Coord(11, Offsett(-1, -1)),
            Coord(10, Offsett(1, -1)),
            Coord(2, Offsett(-1, 1)),
          }),
          CoincidentBoardConstraint(coords: {
            Coord(10, Offsett(-1, -1)),
            Coord(1, Offsett(-1, 1)),
          }),
          CoincidentBoardConstraint(coords: {
            Coord(9, Offsett(1, 1)),
            Coord(8, Offsett(1, -1)),
          }),
          CoincidentBoardConstraint(coords: {
            Coord(9, Offsett(-1, 1)),
            Coord(7, Offsett(1, -1)),
            Coord(8, Offsett(-1, -1)),
          }),
          CoincidentBoardConstraint(coords: {
            Coord(9, Offsett(-1, -1)),
            Coord(6, Offsett(1, -1)),
            Coord(7, Offsett(-1, -1)),
          }),
          CoincidentBoardConstraint(coords: {
            Coord(5, Offsett(1, -1)),
            Coord(6, Offsett(1, 1)),
            Coord(7, Offsett(-1, 1)),
          }),
          CoincidentBoardConstraint(coords: {
            Coord(6, Offsett(-1, -1)),
            Coord(3, Offsett(1, -1)),
          }),
          CoincidentBoardConstraint(coords: {
            Coord(0, Offsett(1, 1)),
            Coord(6, Offsett(-1, 1)),
            Coord(5, Offsett(-1, -1)),
            Coord(3, Offsett(1, 1)),
            Coord(2, Offsett(1, -1)),
          }),
          CoincidentBoardConstraint(coords: {
            Coord(3, Offsett(-1, 1)),
            Coord(0, Offsett(1, -1)),
            Coord(4, Offsett(1, 1)),
          }),
          CoincidentBoardConstraint(coords: {
            Coord(4, Offsett(1, -1)),
            Coord(3, Offsett(-1, -1)),
          }),
          CoincidentBoardConstraint(coords: {
            Coord(4, Offsett(-1, 1)),
            Coord(0, Offsett(-1, -1)),
            Coord(1, Offsett(-1, -1)),
          }),
          CoincidentBoardConstraint(coords: {
            Coord(0, Offsett(-1, 1)),
            Coord(1, Offsett(1, -1)),
            Coord(2, Offsett(-1, -1)),
          })
        ],
        equidistants: [
          EquidistantBoardConstraint(sides: {
            Side(
              Coord(6, Offsett(1, -1)),
              Coord(5, Offsett(1, 1)),
            ),
            Side(
              Coord(8, Offsett(1, -1)),
              Coord(0, Offsett(1, 1)),
            ),
            Side(
              Coord(0, Offsett(-1, -1)),
              Coord(0, Offsett(1, 1)),
            ),
            Side(
              Coord(1, Offsett(1, 1)),
              Coord(12, Offsett(1, 1)),
            ),
            Side(
              Coord(11, Offsett(1, 1)),
              Coord(10, Offsett(-1, 1)),
            ),
            Side(
              Coord(3, Offsett(-1, -1)),
              Coord(1, Offsett(1, 1)),
            ),
            Side(
              Coord(17, Offsett(1, 1)),
              Coord(5, Offsett(1, 1)),
            ),
            Side(
              Coord(16, Offsett(1, 1)),
              Coord(11, Offsett(1, 1)),
            )
          }),
          EquidistantBoardConstraint(sides: {
            Side(
              Coord(5, Offsett(1, 1)),
              Coord(0, Offsett(1, 1)),
            ),
            Side(
              Coord(6, Offsett(1, -1)),
              Coord(0, Offsett(1, 1)),
            ),
            Side(
              Coord(8, Offsett(1, -1)),
              Coord(5, Offsett(1, 1)),
            ),
            Side(
              Coord(8, Offsett(1, -1)),
              Coord(6, Offsett(1, -1)),
            ),
            Side(
              Coord(17, Offsett(1, 1)),
              Coord(16, Offsett(1, 1)),
            ),
            Side(
              Coord(16, Offsett(1, 1)),
              Coord(5, Offsett(1, 1)),
            ),
            Side(
              Coord(11, Offsett(1, 1)),
              Coord(17, Offsett(1, 1)),
            ),
            Side(
              Coord(12, Offsett(1, 1)),
              Coord(11, Offsett(1, 1)),
            ),
            Side(
              Coord(1, Offsett(1, 1)),
              Coord(11, Offsett(1, 1)),
            ),
            Side(
              Coord(11, Offsett(1, 1)),
              Coord(5, Offsett(1, 1)),
            ),
            Side(
              Coord(10, Offsett(-1, 1)),
              Coord(1, Offsett(1, 1)),
            ),
            Side(
              Coord(1, Offsett(1, 1)),
              Coord(0, Offsett(-1, -1)),
            ),
            Side(
              Coord(0, Offsett(1, 1)),
              Coord(3, Offsett(-1, -1)),
            ),
            Side(
              Coord(3, Offsett(-1, -1)),
              Coord(0, Offsett(-1, -1)),
            ),
            Side(
              Coord(0, Offsett(1, 1)),
              Coord(1, Offsett(1, 1)),
            ),
            Side(
              Coord(12, Offsett(1, 1)),
              Coord(10, Offsett(-1, 1)),
            )
          }),
          EquidistantBoardConstraint(sides: {
            Side(
              Coord(3, Offsett(-1, -1)),
              Coord(0, Offsett(1, -1)),
            ),
            Side(
              Coord(0, Offsett(-1, 1)),
              Coord(0, Offsett(1, -1)),
            ),
            Side(
              Coord(0, Offsett(1, 1)),
              Coord(5, Offsett(1, -1)),
            ),
            Side(
              Coord(8, Offsett(1, -1)),
              Coord(7, Offsett(1, -1)),
            ),
            Side(
              Coord(5, Offsett(1, 1)),
              Coord(15, Offsett(1, 1)),
            ),
            Side(
              Coord(17, Offsett(1, 1)),
              Coord(17, Offsett(1, -1)),
            ),
            Side(
              Coord(11, Offsett(1, 1)),
              Coord(11, Offsett(-1, 1)),
            ),
            Side(
              Coord(0, Offsett(-1, 1)),
              Coord(1, Offsett(1, 1)),
            ),
            Side(
              Coord(10, Offsett(1, 1)),
              Coord(10, Offsett(-1, 1)),
            ),
            Side(
              Coord(7, Offsett(1, -1)),
              Coord(5, Offsett(1, -1)),
            ),
            Side(
              Coord(17, Offsett(1, -1)),
              Coord(15, Offsett(1, 1)),
            ),
            Side(
              Coord(10, Offsett(1, 1)),
              Coord(11, Offsett(-1, 1)),
            )
          }),
          EquidistantBoardConstraint(sides: {
            Side(
              Coord(16, Offsett(1, 1)),
              Coord(8, Offsett(1, 1)),
            ),
            Side(
              Coord(8, Offsett(1, 1)),
              Coord(5, Offsett(1, 1)),
            ),
            Side(
              Coord(12, Offsett(1, 1)),
              Coord(14, Offsett(1, 1)),
            ),
            Side(
              Coord(14, Offsett(1, 1)),
              Coord(11, Offsett(1, 1)),
            ),
            Side(
              Coord(5, Offsett(1, 1)),
              Coord(2, Offsett(1, 1)),
            ),
            Side(
              Coord(11, Offsett(1, 1)),
              Coord(2, Offsett(1, 1)),
            ),
            Side(
              Coord(0, Offsett(1, 1)),
              Coord(2, Offsett(1, 1)),
            ),
            Side(
              Coord(1, Offsett(1, 1)),
              Coord(2, Offsett(1, 1)),
            ),
            Side(
              Coord(0, Offsett(1, 1)),
              Coord(3, Offsett(1, -1)),
            ),
            Side(
              Coord(1, Offsett(-1, 1)),
              Coord(1, Offsett(1, 1)),
            ),
            Side(
              Coord(6, Offsett(1, -1)),
              Coord(3, Offsett(1, -1)),
            ),
            Side(
              Coord(0, Offsett(-1, -1)),
              Coord(4, Offsett(-1, -1)),
            ),
            Side(
              Coord(3, Offsett(-1, -1)),
              Coord(4, Offsett(-1, -1)),
            ),
            Side(
              Coord(6, Offsett(1, -1)),
              Coord(9, Offsett(1, -1)),
            ),
            Side(
              Coord(3, Offsett(1, -1)),
              Coord(3, Offsett(-1, -1)),
            ),
            Side(
              Coord(9, Offsett(1, -1)),
              Coord(8, Offsett(1, -1)),
            ),
            Side(
              Coord(8, Offsett(1, -1)),
              Coord(8, Offsett(1, 1)),
            ),
            Side(
              Coord(19, Offsett(1, 1)),
              Coord(17, Offsett(1, 1)),
            ),
            Side(
              Coord(17, Offsett(1, 1)),
              Coord(14, Offsett(1, 1)),
            ),
            Side(
              Coord(19, Offsett(1, 1)),
              Coord(16, Offsett(1, 1)),
            ),
            Side(
              Coord(13, Offsett(-1, 1)),
              Coord(12, Offsett(1, 1)),
            ),
            Side(
              Coord(10, Offsett(-1, 1)),
              Coord(13, Offsett(-1, 1)),
            ),
            Side(
              Coord(1, Offsett(-1, 1)),
              Coord(10, Offsett(-1, 1)),
            ),
            Side(
              Coord(0, Offsett(-1, -1)),
              Coord(1, Offsett(-1, 1)),
            )
          }),
          EquidistantBoardConstraint(sides: {
            Side(
              Coord(12, Offsett(1, 1)),
              Coord(10, Offsett(1, 1)),
            ),
            Side(
              Coord(10, Offsett(1, 1)),
              Coord(1, Offsett(1, 1)),
            ),
            Side(
              Coord(0, Offsett(-1, 1)),
              Coord(0, Offsett(1, 1)),
            ),
            Side(
              Coord(1, Offsett(1, 1)),
              Coord(11, Offsett(-1, 1)),
            ),
            Side(
              Coord(11, Offsett(1, 1)),
              Coord(15, Offsett(1, 1)),
            ),
            Side(
              Coord(11, Offsett(1, 1)),
              Coord(17, Offsett(1, -1)),
            ),
            Side(
              Coord(12, Offsett(1, 1)),
              Coord(11, Offsett(-1, 1)),
            ),
            Side(
              Coord(15, Offsett(1, 1)),
              Coord(16, Offsett(1, 1)),
            ),
            Side(
              Coord(16, Offsett(1, 1)),
              Coord(17, Offsett(1, -1)),
            ),
            Side(
              Coord(5, Offsett(1, -1)),
              Coord(5, Offsett(1, 1)),
            ),
            Side(
              Coord(5, Offsett(1, 1)),
              Coord(7, Offsett(1, -1)),
            ),
            Side(
              Coord(5, Offsett(1, -1)),
              Coord(6, Offsett(1, -1)),
            ),
            Side(
              Coord(0, Offsett(1, 1)),
              Coord(0, Offsett(1, -1)),
            ),
            Side(
              Coord(6, Offsett(1, -1)),
              Coord(7, Offsett(1, -1)),
            ),
            Side(
              Coord(0, Offsett(-1, -1)),
              Coord(0, Offsett(1, -1)),
            ),
            Side(
              Coord(0, Offsett(-1, 1)),
              Coord(0, Offsett(-1, -1)),
            )
          })
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
        (1, 1)
      ],
      convs: [
        Conv(
          fromA: 0,
          toA: 1,
          rot: Offsett(2, 0),
          trans: Offsett(0, -2),
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
          trans: Offsett(0, 2),
        ),
        Conv(
          fromA: 0,
          toA: 4,
          rot: Offsett(0, 2),
          trans: Offsett(0, 2),
        ),
        Conv(
          fromA: 1,
          toA: 2,
          rot: Offsett(0, 2),
          trans: Offsett(-2, 0),
        ),
        Conv(
          fromA: 1,
          toA: 10,
          rot: Offsett(0, 2),
          trans: Offsett(0, -2),
        ),
        Conv(
          fromA: 2,
          toA: 5,
          rot: Offsett(0, 2),
          trans: Offsett(-2, 0),
        ),
        Conv(
          fromA: 2,
          toA: 11,
          rot: Offsett(0, 2),
          trans: Offsett(0, -2),
        ),
        Conv(
          fromA: 3,
          toA: 4,
          rot: Offsett(0, 2),
          trans: Offsett(2, 0),
        ),
        Conv(
          fromA: 3,
          toA: 6,
          rot: Offsett(0, 2),
          trans: Offsett(-2, 0),
        ),
        Conv(
          fromA: 5,
          toA: 6,
          rot: Offsett(0, 2),
          trans: Offsett(0, 2),
        ),
        Conv(
          fromA: 5,
          toA: 7,
          rot: Offsett(2, 0),
          trans: Offsett(0, 2),
        ),
        Conv(
          fromA: 6,
          toA: 7,
          rot: Offsett(0, 2),
          trans: Offsett(-2, 0),
        ),
        Conv(
          fromA: 7,
          toA: 8,
          rot: Offsett(0, 2),
          trans: Offsett(-2, 0),
        ),
        Conv(
          fromA: 7,
          toA: 9,
          rot: Offsett(-2, 0),
          trans: Offsett(-2, 0),
        ),
        Conv(
          fromA: 8,
          toA: 9,
          rot: Offsett(0, 2),
          trans: Offsett(0, 2),
        ),
        Conv(
          fromA: 10,
          toA: 12,
          rot: Offsett(0, 2),
          trans: Offsett(-2, 0),
        ),
        Conv(
          fromA: 10,
          toA: 13,
          rot: Offsett(0, 2),
          trans: Offsett(0, -2),
        ),
        Conv(
          fromA: 11,
          toA: 12,
          rot: Offsett(2, 0),
          trans: Offsett(0, -2),
        ),
        Conv(
          fromA: 11,
          toA: 14,
          rot: Offsett(0, 2),
          trans: Offsett(0, -2),
        ),
        Conv(
          fromA: 12,
          toA: 13,
          rot: Offsett(-2, 0),
          trans: Offsett(2, 0),
        ),
        Conv(
          fromA: 12,
          toA: 14,
          rot: Offsett(0, 2),
          trans: Offsett(-2, 0),
        )
      ],
      quads: [
        Quad(
          Offset(0.2, 0.4),
          Offset(0.3, 0.4),
          Offset(0.4, 0.4),
          Offset(0.3, 0.3),
        ),
        Quad(
          Offset(0.2, 0.4),
          Offset(0.1, 0.5),
          Offset(0.3, 0.5),
          Offset(0.3, 0.4),
        ),
        Quad(
          Offset(0.3, 0.4),
          Offset(0.3, 0.5),
          Offset(0.4, 0.5),
          Offset(0.4, 0.4),
        ),
        Quad(
          Offset(0.3, 0.2),
          Offset(0.3, 0.3),
          Offset(0.4, 0.4),
          Offset(0.4, 0.2),
        ),
        Quad(
          Offset(0.2, 0.2),
          Offset(0.2, 0.4),
          Offset(0.3, 0.3),
          Offset(0.3, 0.2),
        ),
        Quad(
          Offset(0.4, 0.4),
          Offset(0.4, 0.5),
          Offset(0.7, 0.4),
          Offset(0.6, 0.4),
        ),
        Quad(
          Offset(0.4, 0.2),
          Offset(0.4, 0.4),
          Offset(0.6, 0.4),
          Offset(0.6, 0.2),
        ),
        Quad(
          Offset(0.6, 0.2),
          Offset(0.6, 0.4),
          Offset(0.7, 0.4),
          Offset(0.7, 0.3),
        ),
        Quad(
          Offset(0.7, 0.3),
          Offset(0.7, 0.4),
          Offset(0.8, 0.5),
          Offset(0.8, 0.3),
        ),
        Quad(
          Offset(0.6, 0.2),
          Offset(0.7, 0.3),
          Offset(0.8, 0.3),
          Offset(0.8, 0.2),
        ),
        Quad(
          Offset(0.1, 0.5),
          Offset(0.1, 0.7),
          Offset(0.2, 0.7),
          Offset(0.3, 0.5),
        ),
        Quad(
          Offset(0.3, 0.5),
          Offset(0.3, 0.7),
          Offset(0.4, 0.7),
          Offset(0.4, 0.5),
        ),
        Quad(
          Offset(0.3, 0.5),
          Offset(0.2, 0.7),
          Offset(0.3, 0.8),
          Offset(0.3, 0.7),
        ),
        Quad(
          Offset(0.1, 0.7),
          Offset(0.1, 0.8),
          Offset(0.3, 0.8),
          Offset(0.2, 0.7),
        ),
        Quad(
          Offset(0.3, 0.7),
          Offset(0.3, 0.8),
          Offset(0.4, 0.8),
          Offset(0.4, 0.7),
        )
      ],
      constraints: ConstraintSet(
        coincidents: [
          CoincidentBoardConstraint(coords: {
            Coord(14, Offsett(-1, 1)),
            Coord(12, Offsett(1, 1)),
            Coord(13, Offsett(1, 1)),
          }),
          CoincidentBoardConstraint(coords: {
            Coord(14, Offsett(1, -1)),
            Coord(11, Offsett(1, 1)),
          }),
          CoincidentBoardConstraint(coords: {
            Coord(14, Offsett(-1, -1)),
            Coord(11, Offsett(-1, 1)),
            Coord(12, Offsett(1, -1)),
          }),
          CoincidentBoardConstraint(coords: {
            Coord(13, Offsett(-1, -1)),
            Coord(10, Offsett(-1, 1)),
          }),
          CoincidentBoardConstraint(coords: {
            Coord(13, Offsett(1, -1)),
            Coord(10, Offsett(1, 1)),
            Coord(12, Offsett(-1, 1)),
          }),
          CoincidentBoardConstraint(coords: {
            Coord(11, Offsett(1, -1)),
            Coord(2, Offsett(1, 1)),
            Coord(5, Offsett(-1, 1)),
          }),
          CoincidentBoardConstraint(coords: {
            Coord(12, Offsett(-1, -1)),
            Coord(1, Offsett(1, 1)),
            Coord(11, Offsett(-1, -1)),
            Coord(10, Offsett(1, -1)),
            Coord(2, Offsett(-1, 1)),
          }),
          CoincidentBoardConstraint(coords: {
            Coord(10, Offsett(-1, -1)),
            Coord(1, Offsett(-1, 1)),
          }),
          CoincidentBoardConstraint(coords: {
            Coord(9, Offsett(1, 1)),
            Coord(8, Offsett(1, -1)),
          }),
          CoincidentBoardConstraint(coords: {
            Coord(9, Offsett(-1, 1)),
            Coord(7, Offsett(1, -1)),
            Coord(8, Offsett(-1, -1)),
          }),
          CoincidentBoardConstraint(coords: {
            Coord(9, Offsett(-1, -1)),
            Coord(6, Offsett(1, -1)),
            Coord(7, Offsett(-1, -1)),
          }),
          CoincidentBoardConstraint(coords: {
            Coord(8, Offsett(-1, 1)),
            Coord(5, Offsett(1, 1)),
            Coord(7, Offsett(1, 1)),
          }),
          CoincidentBoardConstraint(coords: {
            Coord(5, Offsett(1, -1)),
            Coord(6, Offsett(1, 1)),
            Coord(7, Offsett(-1, 1)),
          }),
          CoincidentBoardConstraint(coords: {
            Coord(6, Offsett(-1, -1)),
            Coord(3, Offsett(1, -1)),
          }),
          CoincidentBoardConstraint(coords: {
            Coord(0, Offsett(1, 1)),
            Coord(6, Offsett(-1, 1)),
            Coord(5, Offsett(-1, -1)),
            Coord(3, Offsett(1, 1)),
            Coord(2, Offsett(1, -1)),
          }),
          CoincidentBoardConstraint(coords: {
            Coord(3, Offsett(-1, 1)),
            Coord(0, Offsett(1, -1)),
            Coord(4, Offsett(1, 1)),
          }),
          CoincidentBoardConstraint(coords: {
            Coord(4, Offsett(1, -1)),
            Coord(3, Offsett(-1, -1)),
          }),
          CoincidentBoardConstraint(coords: {
            Coord(4, Offsett(-1, 1)),
            Coord(0, Offsett(-1, -1)),
            Coord(1, Offsett(-1, -1)),
          }),
          CoincidentBoardConstraint(coords: {
            Coord(0, Offsett(-1, 1)),
            Coord(1, Offsett(1, -1)),
            Coord(2, Offsett(-1, -1)),
          })
        ],
        equidistants: [],
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
          toA: 1,
          rot: Offsett(0, 2),
          trans: Offsett(0, 2),
        ),
        Conv(
          fromA: 0,
          toA: 2,
          rot: Offsett(0, 2),
          trans: Offsett(-2, 0),
        ),
        Conv(
          fromA: 1,
          toA: 3,
          rot: Offsett(0, 2),
          trans: Offsett(-2, 0),
        ),
        Conv(
          fromA: 2,
          toA: 4,
          rot: Offsett(-2, 0),
          trans: Offsett(-2, 0),
        ),
        Conv(
          fromA: 2,
          toA: 6,
          rot: Offsett(0, 2),
          trans: Offsett(-2, 0),
        ),
        Conv(
          fromA: 3,
          toA: 4,
          rot: Offsett(0, 2),
          trans: Offsett(0, -2),
        ),
        Conv(
          fromA: 3,
          toA: 5,
          rot: Offsett(0, 2),
          trans: Offsett(-2, 0),
        ),
        Conv(
          fromA: 4,
          toA: 5,
          rot: Offsett(2, 0),
          trans: Offsett(0, 2),
        ),
        Conv(
          fromA: 4,
          toA: 6,
          rot: Offsett(0, 2),
          trans: Offsett(0, -2),
        ),
        Conv(
          fromA: 5,
          toA: 7,
          rot: Offsett(0, 2),
          trans: Offsett(-2, 0),
        ),
        Conv(
          fromA: 6,
          toA: 8,
          rot: Offsett(0, 2),
          trans: Offsett(-2, 0),
        ),
        Conv(
          fromA: 7,
          toA: 8,
          rot: Offsett(0, 2),
          trans: Offsett(0, -2),
        )
      ],
      quads: [
        Quad(
          Offset(0.0, 0.5),
          Offset(0.0, 0.7),
          Offset(0.2, 0.7),
          Offset(0.3, 0.5),
        ),
        Quad(
          Offset(0.0, 0.2),
          Offset(0.0, 0.5),
          Offset(0.3, 0.5),
          Offset(0.3, 0.2),
        ),
        Quad(
          Offset(0.3, 0.5),
          Offset(0.2, 0.7),
          Offset(0.5, 0.7),
          Offset(0.5, 0.6),
        ),
        Quad(
          Offset(0.3, 0.2),
          Offset(0.3, 0.5),
          Offset(0.5, 0.4),
          Offset(0.5, 0.3),
        ),
        Quad(
          Offset(0.3, 0.5),
          Offset(0.5, 0.6),
          Offset(0.7, 0.5),
          Offset(0.5, 0.4),
        ),
        Quad(
          Offset(0.5, 0.3),
          Offset(0.5, 0.4),
          Offset(0.7, 0.5),
          Offset(0.8, 0.3),
        ),
        Quad(
          Offset(0.5, 0.6),
          Offset(0.5, 0.7),
          Offset(0.7, 0.8),
          Offset(0.7, 0.5),
        ),
        Quad(
          Offset(0.8, 0.3),
          Offset(0.7, 0.5),
          Offset(1.0, 0.5),
          Offset(1.0, 0.3),
        ),
        Quad(
          Offset(0.7, 0.5),
          Offset(0.7, 0.8),
          Offset(1.0, 0.8),
          Offset(1.0, 0.5),
        )
      ],
      constraints: ConstraintSet(
        coincidents: [
          CoincidentBoardConstraint(coords: {
            Coord(7, Offsett(1, 1)),
            Coord(8, Offsett(1, -1)),
          }),
          CoincidentBoardConstraint(coords: {
            Coord(8, Offsett(-1, 1)),
            Coord(6, Offsett(1, 1)),
          }),
          CoincidentBoardConstraint(coords: {
            Coord(8, Offsett(-1, -1)),
            Coord(4, Offsett(1, 1)),
            Coord(7, Offsett(-1, 1)),
            Coord(5, Offsett(1, 1)),
            Coord(6, Offsett(1, -1)),
          }),
          CoincidentBoardConstraint(coords: {
            Coord(7, Offsett(-1, -1)),
            Coord(5, Offsett(1, -1)),
          }),
          CoincidentBoardConstraint(coords: {
            Coord(5, Offsett(-1, 1)),
            Coord(3, Offsett(1, 1)),
            Coord(4, Offsett(1, -1)),
          }),
          CoincidentBoardConstraint(coords: {
            Coord(5, Offsett(-1, -1)),
            Coord(3, Offsett(1, -1)),
          }),
          CoincidentBoardConstraint(coords: {
            Coord(6, Offsett(-1, 1)),
            Coord(2, Offsett(1, 1)),
          }),
          CoincidentBoardConstraint(coords: {
            Coord(6, Offsett(-1, -1)),
            Coord(2, Offsett(1, -1)),
            Coord(4, Offsett(-1, 1)),
          }),
          CoincidentBoardConstraint(coords: {
            Coord(4, Offsett(-1, -1)),
            Coord(0, Offsett(1, -1)),
            Coord(3, Offsett(-1, 1)),
            Coord(2, Offsett(-1, -1)),
            Coord(1, Offsett(1, 1)),
          }),
          CoincidentBoardConstraint(coords: {
            Coord(3, Offsett(-1, -1)),
            Coord(1, Offsett(1, -1)),
          }),
          CoincidentBoardConstraint(coords: {
            Coord(2, Offsett(-1, 1)),
            Coord(0, Offsett(1, 1)),
          }),
          CoincidentBoardConstraint(coords: {
            Coord(0, Offsett(-1, -1)),
            Coord(1, Offsett(-1, 1)),
          })
        ],
        equidistants: [
          EquidistantBoardConstraint(sides: {
            Side(
              Coord(6, Offsett(1, 1)),
              Coord(7, Offsett(1, 1)),
            ),
            Side(
              Coord(7, Offsett(1, 1)),
              Coord(5, Offsett(1, -1)),
            ),
            Side(
              Coord(4, Offsett(1, 1)),
              Coord(7, Offsett(1, -1)),
            ),
            Side(
              Coord(2, Offsett(1, 1)),
              Coord(4, Offsett(1, 1)),
            ),
            Side(
              Coord(8, Offsett(1, 1)),
              Coord(4, Offsett(1, 1)),
            ),
            Side(
              Coord(0, Offsett(1, -1)),
              Coord(2, Offsett(1, 1)),
            ),
            Side(
              Coord(0, Offsett(1, -1)),
              Coord(0, Offsett(-1, 1)),
            ),
            Side(
              Coord(0, Offsett(1, -1)),
              Coord(1, Offsett(-1, -1)),
            ),
            Side(
              Coord(1, Offsett(1, -1)),
              Coord(0, Offsett(-1, -1)),
            ),
            Side(
              Coord(0, Offsett(1, -1)),
              Coord(3, Offsett(1, -1)),
            ),
            Side(
              Coord(0, Offsett(-1, -1)),
              Coord(0, Offsett(1, 1)),
            ),
            Side(
              Coord(4, Offsett(1, 1)),
              Coord(3, Offsett(1, -1)),
            )
          }),
          EquidistantBoardConstraint(sides: {
            Side(
              Coord(3, Offsett(1, 1)),
              Coord(3, Offsett(1, -1)),
            ),
            Side(
              Coord(2, Offsett(1, 1)),
              Coord(2, Offsett(1, -1)),
            )
          }),
          EquidistantBoardConstraint(sides: {
            Side(
              Coord(4, Offsett(1, 1)),
              Coord(3, Offsett(1, 1)),
            ),
            Side(
              Coord(0, Offsett(1, -1)),
              Coord(3, Offsett(1, 1)),
            ),
            Side(
              Coord(2, Offsett(1, -1)),
              Coord(4, Offsett(1, 1)),
            ),
            Side(
              Coord(2, Offsett(1, -1)),
              Coord(0, Offsett(1, -1)),
            )
          }),
          EquidistantBoardConstraint(sides: {
            Side(
              Coord(0, Offsett(-1, 1)),
              Coord(0, Offsett(1, 1)),
            ),
            Side(
              Coord(0, Offsett(1, 1)),
              Coord(0, Offsett(1, -1)),
            ),
            Side(
              Coord(0, Offsett(-1, -1)),
              Coord(0, Offsett(1, -1)),
            ),
            Side(
              Coord(0, Offsett(1, -1)),
              Coord(1, Offsett(1, -1)),
            ),
            Side(
              Coord(7, Offsett(1, 1)),
              Coord(4, Offsett(1, 1)),
            ),
            Side(
              Coord(4, Offsett(1, 1)),
              Coord(5, Offsett(1, -1)),
            ),
            Side(
              Coord(6, Offsett(1, 1)),
              Coord(4, Offsett(1, 1)),
            ),
            Side(
              Coord(8, Offsett(1, 1)),
              Coord(6, Offsett(1, 1)),
            ),
            Side(
              Coord(1, Offsett(-1, -1)),
              Coord(0, Offsett(-1, -1)),
            ),
            Side(
              Coord(0, Offsett(-1, 1)),
              Coord(0, Offsett(-1, -1)),
            ),
            Side(
              Coord(1, Offsett(-1, -1)),
              Coord(1, Offsett(1, -1)),
            ),
            Side(
              Coord(5, Offsett(1, -1)),
              Coord(3, Offsett(1, -1)),
            ),
            Side(
              Coord(1, Offsett(1, -1)),
              Coord(3, Offsett(1, -1)),
            ),
            Side(
              Coord(8, Offsett(1, 1)),
              Coord(7, Offsett(1, 1)),
            ),
            Side(
              Coord(7, Offsett(1, -1)),
              Coord(7, Offsett(1, 1)),
            ),
            Side(
              Coord(5, Offsett(1, -1)),
              Coord(7, Offsett(1, -1)),
            ),
            Side(
              Coord(2, Offsett(1, 1)),
              Coord(6, Offsett(1, 1)),
            ),
            Side(
              Coord(0, Offsett(1, 1)),
              Coord(2, Offsett(1, 1)),
            )
          })
        ],
      ),
    ),
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
  ];
}
