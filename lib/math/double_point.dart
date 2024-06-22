import 'dart:math';

import 'package:flutter/material.dart';

class DoublePoint {
  final double x, y;

  DoublePoint(this.x, this.y);

  double get distance => sqrt(x * x + y * y);

  DoublePoint normal() {
    return DoublePoint(-y, x);
  }

  DoublePoint operator +(DoublePoint p) {
    return DoublePoint(p.x + x, p.y + y);
  }

  DoublePoint operator -(DoublePoint p) {
    return DoublePoint(x - p.x, y - p.y);
  }

  DoublePoint operator -() {
    return DoublePoint(-x, -y);
  }

  DoublePoint operator *(double d) {
    return DoublePoint(x * d, y * d);
  }

  DoublePoint operator /(double d) {
    return DoublePoint(x / d, y / d);
  }

  @override
  bool operator ==(Object other) {
    if (other is! DoublePoint) {
      return false;
    } else {
      return other.x == x && other.y == y;
    }
  }

  @override
  int get hashCode => Object.hash(x, y);

  Offset toOffset() {
    return Offset(x, y);
  }

  static DoublePoint fromOffset(Offset o) {
    return DoublePoint(o.dx, o.dy);
  }

  @override
  String toString() {
    return "DoublePoint(${x.toStringAsPrecision(3)}, ${y.toStringAsPrecision(3)})";
  }

  static DoublePoint lerp(DoublePoint p1, DoublePoint p2, double t) {
    return p1 * (1.0 - t) + p2 * t;
  }
}
