import 'dart:math';

import 'package:fifteen/math/int_point.dart';
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

  Quad rel(IntPoint dir) {
    if (dir == IntPoint.up) return this;
    if (dir == IntPoint.right) return Quad(p4, p1, p2, p3);
    if (dir == IntPoint.down) return Quad(p3, p4, p1, p2);
    if (dir == IntPoint.left) return Quad(p2, p3, p4, p1);
    return this;
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

  Quad subquad(int i, int j, int n, int m) {
    double s = 1.0 * i / n,
        t = 1.0 * j / m,
        ns = 1.0 * (i + 1) / n,
        nt = 1.0 * (j + 1) / m;
    return Quad(
      Offset.lerp(
        Offset.lerp(p1, p2, t),
        Offset.lerp(p4, p3, t),
        s,
      )!,
      Offset.lerp(
        Offset.lerp(p1, p2, t),
        Offset.lerp(p4, p3, t),
        ns,
      )!,
      Offset.lerp(
        Offset.lerp(p1, p2, nt),
        Offset.lerp(p4, p3, nt),
        ns,
      )!,
      Offset.lerp(
        Offset.lerp(p1, p2, nt),
        Offset.lerp(p4, p3, nt),
        s,
      )!,
    );
  }

  double _wedge(Offset a, Offset b) {
    return a.dx * b.dy - a.dy * b.dx;
  }

  double _dot(Offset a, Offset b) {
    return a.dx * b.dx + a.dy * b.dy;
  }

  double _isInsideHelperAlpha(
      Offset x, Offset p0, Offset p1, Offset p2, Offset p3) {
    x = x - p0;
    p1 = p1 - p0;
    p2 = p2 - p0;
    p3 = p3 - p0;
    double r2r3 = _wedge(p2, p1) - _wedge(p3, p1),
        dXd3 = _dot(x, p1) - _dot(p3, p1),
        d2d3 = _dot(p2, p1) - _dot(p3, p1);
    double den = r2r3 * dXd3 / d2d3 + _wedge(p3, p1);
    return _wedge(x, p1) / den;
  }

  bool isInside(Offset pt) {
    // calculate alpha01(pt) and alpha12(pt)
    double alpha01 = _isInsideHelperAlpha(pt, p1, p2, p3, p4);
    double alpha12 = _isInsideHelperAlpha(pt, p2, p3, p4, p1);
    return alpha01 >= 0.0 && alpha01 <= 1.0 && alpha12 >= 0.0 && alpha12 <= 1.0;
  }

  @override
  String toString() {
    return "Quad($p1, $p2, $p3, $p4,)";
  }
}
