import 'dart:math';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:fifteen/board/domain/double_point.dart';
import 'package:fifteen/board/domain/int_point.dart';

part 'quad.mapper.dart';

@MappableClass()
class Quad with QuadMappable {
  final DoublePoint p1, p2, p3, p4;

  Quad(this.p1, this.p2, this.p3, this.p4);

  static Quad unit() {
    return Quad(
      DoublePoint(0.0, 0.0),
      DoublePoint(0.0, 1.0),
      DoublePoint(1.0, 1.0),
      DoublePoint(1.0, 0.0),
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
      DoublePoint(p1.x * kx, p1.y * ky),
      DoublePoint(p2.x * kx, p2.y * ky),
      DoublePoint(p3.x * kx, p3.y * ky),
      DoublePoint(p4.x * kx, p4.y * ky),
    );
  }

  Quad add(DoublePoint o) {
    return Quad(p1 + o, p2 + o, p3 + o, p4 + o);
  }

  Quad rel(IntPoint dir) {
    if (dir == IntPoint.up) return this;
    if (dir == IntPoint.left) return Quad(p4, p1, p2, p3);
    if (dir == IntPoint.down) return Quad(p3, p4, p1, p2);
    if (dir == IntPoint.right) return Quad(p2, p3, p4, p1);
    return this;
  }

  Quad sub(DoublePoint offset) {
    return add(-offset);
  }

  DoublePoint _rot(DoublePoint o, double theta) {
    return o * cos(theta) + o.normal() * sin(theta);
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
      DoublePoint.lerp(a.p1, b.p1, t),
      DoublePoint.lerp(a.p2, b.p2, t),
      DoublePoint.lerp(a.p3, b.p3, t),
      DoublePoint.lerp(a.p4, b.p4, t),
    );
  }

  Quad lerpTo(Quad b, double t) {
    return Quad.lerp(this, b, t);
  }

  DoublePoint interiorLerp(double a, double b) => DoublePoint.lerp(
        DoublePoint.lerp(p1, p2, b),
        DoublePoint.lerp(p4, p3, b),
        a,
      );

  Quad subquad(double s, double t, double ns, double nt) => Quad(
        interiorLerp(s, t),
        interiorLerp(s, nt),
        interiorLerp(ns, nt),
        interiorLerp(ns, t),
      );

  double _wedge(DoublePoint a, DoublePoint b) {
    return a.x * b.y - a.y * b.x;
  }

  double _dot(DoublePoint a, DoublePoint b) {
    return a.x * b.x + a.y * b.y;
  }

  double _isInsideHelperAlpha(
    DoublePoint x,
    DoublePoint p0,
    DoublePoint p1,
    DoublePoint p2,
    DoublePoint p3,
  ) {
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

  bool isInside(DoublePoint pt) {
    // calculate alpha01(pt) and alpha12(pt)
    double alpha01 = _isInsideHelperAlpha(pt, p1, p2, p3, p4);
    double alpha12 = _isInsideHelperAlpha(pt, p2, p3, p4, p1);
    return alpha01 >= 0.0 && alpha01 <= 1.0 && alpha12 >= 0.0 && alpha12 <= 1.0;
  }

  DoublePoint get center => (p1 + p2 + p3 + p4) / 4.0;

  static const fromJson = QuadMapper.fromJson;
}
