import 'dart:math';
import 'dart:ui';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class Quadd {
  final Offset p1, p2, p3, p4;

  Quadd({
    required this.p1,
    required this.p2,
    required this.p3,
    required this.p4,
  });

  static Quadd unit() {
    return Quadd(
      p1: Offset(0.0, 0.0),
      p2: Offset(0.0, 1.0),
      p3: Offset(1.0, 1.0),
      p4: Offset(1.0, 0.0),
    );
  }

  Quadd mult(double k) {
    return Quadd(
      p1: p1 * k,
      p2: p2 * k,
      p3: p3 * k,
      p4: p4 * k,
    );
  }

  Quadd multO(Offset o) {
    return Quadd(
      p1: Offset(p1.dx * o.dx, p1.dy * o.dy),
      p2: Offset(p2.dx * o.dx, p2.dy * o.dy),
      p3: Offset(p3.dx * o.dx, p3.dy * o.dy),
      p4: Offset(p4.dx * o.dx, p4.dy * o.dy),
    );
  }

  Quadd add(Offset o) {
    return Quadd(
      p1: p1 + o,
      p2: p2 + o,
      p3: p3 + o,
      p4: p4 + o,
    );
  }

  Quadd sub(Offset o) {
    return add(-o);
  }

  Offset _rot(Offset o, double theta) {
    return Offset(
      o.dx * cos(theta) + o.dy * sin(theta),
      o.dy * cos(theta) - o.dx * sin(theta),
    );
  }

  Quadd rot(double theta) {
    return Quadd(
      p1: _rot(p1, theta),
      p2: _rot(p2, theta),
      p3: _rot(p3, theta),
      p4: _rot(p4, theta),
    );
  }

  Quadd dent(double amount) {
    return Quadd(
      p1: (p1 * (1.0 - amount) + (p1 + p2 + p3 + p4) * 0.25 * amount),
      p2: p2,
      p3: p3,
      p4: p4,
    );
  }

  static Quadd lerp(Quadd a, Quadd b, double t) {
    return Quadd(
      p1: Offset.lerp(a.p1, b.p1, t)!,
      p2: Offset.lerp(a.p2, b.p2, t)!,
      p3: Offset.lerp(a.p3, b.p3, t)!,
      p4: Offset.lerp(a.p4, b.p4, t)!,
    );
  }

  Quadd lerpTo(Quadd b, double t) {
    return Quadd.lerp(this, b, t);
  }
}

class ImagePainter extends CustomPainter {
  final FragmentShader shader;
  final double time; // time
  final ui.Image? image;

  ImagePainter(FragmentShader fragmentShader, this.time, this.image)
      : shader = fragmentShader;

  void setQuad(FragmentShader shader, xIndex, yIndex, Quadd quad) {
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
        Quadd from = Quadd.unit()
            .multO(Offset(1.0 / n, 1.0 / m))
            .add(Offset(i / n, j / m));
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
        Quadd to = from.lerpTo(
          Quadd.unit()
              .multO(Offset(1.0 / n, 1.0 / m))
              .add(Offset(ni / n, nj / m)),
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

        drawQuad(canvas, from, size, paint);
        drawQuad(canvas, from, size, paint2);
      }
    }

    // paint2.color = Colors.red;
    // drawQuad(canvas, to, size, paint2);
    // paint2.color = Colors.green;
    // drawQuad(canvas, from, size, paint2);
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

  void drawQuad(Canvas canvas, Quadd quad0, Size size, Paint paint) {
    Quadd quad = quad0.multO(Offset(size.width, size.height));
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
