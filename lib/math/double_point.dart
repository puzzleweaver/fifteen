import 'dart:math';

import 'package:flutter/material.dart';

class DoublePoint {
  final double x, y;

  DoublePoint(this.x, this.y);

  double get distance => sqrt(x * x + y * y);

  operator +(DoublePoint p) {
    return DoublePoint(p.x + x, p.y + y);
  }

  operator -(DoublePoint p) {
    return DoublePoint(x - p.x, y - p.y);
  }

  operator -() {
    return DoublePoint(-x, -y);
  }

  operator *(double d) {
    return DoublePoint(x * d, y * d);
  }

  @override
  operator ==(Object other) {
    if (other is! DoublePoint) {
      return false;
    } else {
      return other.x == x && other.y == y;
    }
  }

  @override
  int get hashCode => Object.hash(x, y);

  Offset asOffset() {
    return Offset(x, y);
  }

  @override
  String toString() {
    return "(${x.toStringAsPrecision(3)}, ${y.toStringAsPrecision(3)})";
  }
}
