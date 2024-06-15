import 'dart:math';
import 'dart:ui';
import 'dart:ui' as ui;

import 'package:fifteen/math/board.dart';
import 'package:fifteen/math/quad.dart';
import 'package:flutter/material.dart';

class ImageTestPainter extends CustomPainter {
  final FragmentShader shader;
  final double time; // time
  final ui.Image? image;

  ImageTestPainter(FragmentShader fragmentShader, this.time, this.image)
      : shader = fragmentShader;

  void setQuad(FragmentShader shader, xIndex, yIndex, Quad quad) {
    shader.setFloat(xIndex, quad.p1.dx);
    shader.setFloat(xIndex + 1, quad.p2.dx);
    shader.setFloat(xIndex + 2, quad.p3.dx);
    shader.setFloat(xIndex + 3, quad.p4.dx);
    shader.setFloat(yIndex, quad.p1.dy);
    shader.setFloat(yIndex + 1, quad.p2.dy);
    shader.setFloat(yIndex + 2, quad.p3.dy);
    shader.setFloat(yIndex + 3, quad.p4.dy);
  }

  @override
  void paint(Canvas canvas, Size size) {
    shader.setImageSampler(0, image!);
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);
    shader.setFloat(2, time);

    final paint = Paint();

    paint.shader = shader;
    // canvas.drawRect(Offset.zero & size, paint);

    // cyclic time
    double ctime = 0.25 * (1.0 + cos(time)) * (1.0 + cos(time));

    // Quadd from = Quadd.unit().lerpTo(
    //   Quadd.unit()
    //       .sub(Offset(0.5, 0.5))
    //       .rot(1.0)
    //       .mult(0.25)
    //       .dent(0.5)
    //       .add(Offset(3 / 8, 3 / 8)),
    //   ctime,
    // );
    // Quadd to =
    //     Quadd.unit().sub(Offset(0.5, 0.5)).mult(0.5).add(Offset(0.5, 0.5));

    final paint2 = Paint();
    paint2.style = PaintingStyle.stroke;
    paint2.strokeWidth = 2;
    paint2.color = Colors.white;

    Random r = Random(1000);

    int n = 5, m = 5;
    for (int i = 0; i < n; i++) {
      for (int j = 0; j < m; j++) {
        Quad from =
            Quad.unit().scale(1.0 / n, 1.0 / m).add(Offset(i / n, j / m));
        int ni = i + r.nextInt(3) - 1;
        int nj = j + r.nextInt(3) - 1;
        if (r.nextDouble() < 0.5) {
          if (ni != i) {
            nj = j;
          }
        } else {
          if (nj != j) {
            ni = i;
          }
        }
        Quad to = from.lerpTo(
          Quad.unit().scale(1.0 / n, 1.0 / m).add(Offset(ni / n, nj / m)),
          ctime,
        );
        ;

        setQuad(shader, 2, 6, from);
        setQuad(
          shader,
          10,
          14,
          to,
        );

        // drawQuad(canvas, from, size, paint);
        // drawQuad(canvas, from, size, paint2);
      }
    }

    // paint2.color = Colors.red;
    // drawQuad(canvas, to, size, paint2);
    // paint2.color = Colors.green;
    // drawQuad(canvas, from, size, paint2);

    Board board = Board.test();

    paint2.color = Colors.green;
    paint2.strokeWidth = 10;
    for (int i = 0; i < board.quads.length; i++) {
      Quad q = board.quads[i].mult(0.5).add(Offset(0.5, 0.5));
      Quad from = board.quads[i].mult(0.5).add(Offset(0.5, 0.5)),
          to = from.lerpTo(
            board.quads[(i + 1) % board.quads.length]
                .mult(0.5)
                .add(Offset(0.5, 0.5)),
            ctime,
          );
      setQuad(shader, 2, 6, from);
      setQuad(
        shader,
        10,
        14,
        to,
      );
      drawQuad(canvas, q, size, paint);
      drawQuad(canvas, q, size, paint2);
    }
  }

  void drawRect(
    Canvas canvas,
    double x,
    double y,
    double w,
    double h,
    Paint paint,
  ) {
    drawPoly(canvas, [x, x + w, x + w, x], [y, y, y + h, y + h], paint);
  }

  void drawQuad(Canvas canvas, Quad quad0, Size size, Paint paint) {
    Quad quad = quad0.scale(size.width, size.height);
    drawPoly(
      canvas,
      [quad.p1.dx, quad.p2.dx, quad.p3.dx, quad.p4.dx, quad.p1.dx],
      [quad.p1.dy, quad.p2.dy, quad.p3.dy, quad.p4.dy, quad.p1.dy],
      paint,
    );
  }

  void drawPoly(Canvas canvas, List<double> xs, List<double> ys, Paint paint) {
    Path path = Path();
    path.moveTo(xs[0], ys[0]);
    for (int i = 1; i < xs.length; i++) {
      path.lineTo(xs[i], ys[i]);
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
