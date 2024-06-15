import 'package:fifteen/math/conv.dart';
import 'package:fifteen/math/offsett.dart';
import 'package:fifteen/math/quad.dart';
import 'package:flutter/material.dart';

class Board {
  final List<(int, int)> charts;
  final List<Conv> convs;
  final List<Quad> quads;

  Board({required this.charts, required this.convs, required this.quads});

  static Board test() {
    return Board(
      charts: [(2, 2), (2, 2), (2, 2)],
      convs: [
        Conv(0, 1, Offsett.newCenter(-4, 0), Offsett.UP),
        Conv(0, 2, Offsett.newCenter(0, -4), Offsett.UP),
        Conv(2, 1, Offsett.newCenter(0, 6), Offsett.RIGHT),
      ],
      quads: [
        Quad(
          Offset(-0.8426729364919308, -0.5664551916030472),
          Offset(-0.05897370410395686, -1),
          Offset(-0.01268553244599202, 0.0005059164077277634),
          Offset(-0.8680440013839179, 0.3481024287495134),
        ),
        Quad(
          Offset(-0.05897370410395686, -1),
          Offset(0.8680440013839185, -0.5155889979320708),
          Offset(0.8173018715999445, 0.5176564076527692),
          Offset(-0.01268553244599202, 0.0005059164077278466),
        ),
        Quad(
          Offset(-0.8680440013839179, 0.34810242874951347),
          Offset(-0.01268553244599202, 0.0005059164077278466),
          Offset(0.8173018715999444, 0.5176564076527692),
          Offset(-0.012685532445992576, 0.9999999999999999),
        ),
      ],
    );
  }
}
