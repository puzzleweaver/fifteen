import 'dart:math';
import 'dart:math' as math;

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';

part 'double_point.mapper.dart';

@MappableClass()
class DoublePoint with DoublePointMappable {
  final double x, y;

  DoublePoint(this.x, this.y);

  double get distance => sqrt(x * x + y * y);

  double dot(DoublePoint other) => x * other.x + y * other.y;
  DoublePoint mult(double factor) => DoublePoint(factor * x, factor * y);

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

  Offset toOffset() {
    return Offset(x, y);
  }

  static DoublePoint fromOffset(Offset o) {
    return DoublePoint(o.dx, o.dy);
  }

  static DoublePoint lerp(DoublePoint p1, DoublePoint p2, double t) {
    return p1 * (1.0 - t) + p2 * t;
  }

  DoublePoint? min(DoublePoint p) => DoublePoint(
        math.min(x, p.x),
        math.min(y, p.y),
      );
  DoublePoint? max(DoublePoint p) => DoublePoint(
        math.max(x, p.x),
        math.max(y, p.y),
      );

  static const fromJson = DoublePointMapper.fromJson;
}
