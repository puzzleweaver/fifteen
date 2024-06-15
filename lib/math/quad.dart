import 'dart:math';

import 'package:flutter/material.dart';

class Quad {
  final Offset p1, p2, p3, p4;

  Quad(this.p1, this.p2, this.p3, this.p4);

  static Quad unit() {
    return Quad(
      Offset(0.0, 0.0),
      Offset(0.0, 1.0),
      Offset(1.0, 1.0),
      Offset(1.0, 0.0),
    );
  }

  Quad mult(double k) {
    return Quad(
      p1 * k,
      p2 * k,
      p3 * k,
      p4 * k,
    );
  }

  Quad scale(double kx, double ky) {
    return Quad(
      Offset(p1.dx * kx, p1.dy * ky),
      Offset(p2.dx * kx, p2.dy * ky),
      Offset(p3.dx * kx, p3.dy * ky),
      Offset(p4.dx * kx, p4.dy * ky),
    );
  }

  Quad add(Offset o) {
    return Quad(
      p1 + o,
      p2 + o,
      p3 + o,
      p4 + o,
    );
  }

  Quad sub(Offset o) {
    return add(-o);
  }

  Offset _rot(Offset o, double theta) {
    return Offset(
      o.dx * cos(theta) + o.dy * sin(theta),
      o.dy * cos(theta) - o.dx * sin(theta),
    );
  }

  Quad rot(double theta) {
    return Quad(
      _rot(p1, theta),
      _rot(p2, theta),
      _rot(p3, theta),
      _rot(p4, theta),
    );
  }

  Quad dent(double amount) {
    return Quad(
      (p1 * (1.0 - amount) + (p1 + p2 + p3 + p4) * 0.25 * amount),
      p2,
      p3,
      p4,
    );
  }

  static Quad lerp(Quad a, Quad b, double t) {
    return Quad(
      Offset.lerp(a.p1, b.p1, t)!,
      Offset.lerp(a.p2, b.p2, t)!,
      Offset.lerp(a.p3, b.p3, t)!,
      Offset.lerp(a.p4, b.p4, t)!,
    );
  }

  Quad lerpTo(Quad b, double t) {
    return Quad.lerp(this, b, t);
  }
}
