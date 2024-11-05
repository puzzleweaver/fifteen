import 'dart:math';

import 'package:fifteen/board/domain/board.dart';
import 'package:fifteen/board/domain/coord.dart';
import 'package:fifteen/board/domain/double_point.dart';
import 'package:fifteen/board/domain/int_point.dart';
import 'package:fifteen/board/domain/oriented_coord.dart';
import 'package:fifteen/board/domain/quad.dart';
import 'package:fifteen/level/ui/level_renderer.dart';
import 'package:fifteen/app/ui/custom_canvas.dart';
import 'package:flutter/material.dart';

class GraphWidgetPainter extends FifteenPainter {
  final Board board;

  GraphWidgetPainter({
    required this.board,
    required super.shader,
    required super.image,
  });

  @override
  void paint(Canvas canvas, Size size) {
    LevelRenderer renderer = LevelRenderer(
      canvas: canvas,
      size: size,
      shader: shader,
      image: image,
    );
    // renderer.drawSubquadOutlines(board);
    List<Cycle?> nullableCycles = [];
    for (Coord coord in board.coords) {
      Quad quad = board.getQuad(coord);
      nullableCycles.addAll(
        [
          getCycle(
            coord,
            IntPoint.left,
            IntPoint.left,
            quad.p1,
          ),
          getCycle(
            coord,
            IntPoint.up,
            IntPoint.left,
            quad.p2,
          ),
          getCycle(
            coord,
            IntPoint.right,
            IntPoint.left,
            quad.p3,
          ),
          getCycle(
            coord,
            IntPoint.down,
            IntPoint.left,
            quad.p4,
          ),
        ],
      );
    }
    List<Cycle> cycles = nullableCycles.whereType<Cycle>().toSet().toList();
    renderer.setFill(color: Colors.white);
    renderer.setStroke(color: Colors.white, strokeWidth: 1);
    for (int i = 0; i < cycles.length; i++) {
      for (int j = i + 1; j < cycles.length; j++) {
        Cycle a = cycles[i];
        Cycle b = cycles[j];
        if (a.numberInCommon(b) == 2) {
          renderer.drawLine(a.point, b.point);
        }
      }
    }
    for (Cycle cycle in cycles) {
      // renderCycle(renderer, cycle);
      renderer.setFill(
          color: [
        Colors.green,
        Colors.black,
        Colors.red,
        Colors.yellow,
        Colors.purple,
        Colors.orange,
      ][cycle.order - 1]);
      renderer.drawVertex(cycle.point, 0.04);
    }
  }

  Cycle? getCycle(
    Coord coord,
    IntPoint dir,
    IntPoint turn,
    DoublePoint pt,
  ) {
    OrientedCoord oc = OrientedCoord(coord, dir);
    int count = 0;
    List<Coord> path = [];
    do {
      path.add(oc.coord);
      OrientedCoord? next = board.step(oc.coord, oc.dir);
      if (next == null) return null;
      oc = next * oc.dir;
      oc *= turn;
      count++;
    } while (oc.coord != coord && count <= 7);
    if (oc.coord == coord) {
      return Cycle(
        path: path,
        point: pt,
      );
    }
    return null;
  }

  void renderCycle(LevelRenderer renderer, Cycle cycle) {
    renderer.setStroke(
      color: Color.fromARGB(
        255,
        Random().nextInt(255),
        Random().nextInt(255),
        Random().nextInt(255),
      ),
    );
    renderer.drawVertex(cycle.point, 0.025);
    for (int i = 0; i < cycle.path.length; i++) {
      renderer.drawLine(
        board.getVertex(cycle.path[i]),
        board.getVertex(cycle.path[(i + 1) % cycle.path.length]),
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}

class Cycle {
  final List<Coord> path;
  final DoublePoint point;

  Cycle({required this.path, required this.point});

  int get order => path.length;

  int numberInCommon(Cycle c) {
    return path.where((space) => c.path.contains(space)).length;
  }

  @override
  bool operator ==(Object other) {
    if (other is! Cycle) return false;
    return numberInCommon(other) == path.length;
  }

  @override
  int get hashCode => Object.hashAll(path);
}
