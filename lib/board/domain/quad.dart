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

  bool isInside(DoublePoint p) {
    // To check if p is in this quad, map p from this quad to [0,1]x[0,1],
    // then just see if it's in the unit square.

    Quad to = Quad.unit();
    DoublePoint p0 = this.p1, p1 = this.p2, p2 = this.p3, p3 = p4;
    DoublePoint q0 = to.p1, q1 = to.p2, q2 = to.p3, q3 = to.p4;

    // coordinates from p_i:
    DoublePoint n0 = (p1 - p0).normal(),
        n1 = (p2 - p1).normal(),
        n2 = (p3 - p2).normal(),
        n3 = (p0 - p3).normal();
    double u = (p - p3).dot(n3) / ((p - p3).dot(n3) + (p - p1).dot(n1));
    double v = (p - p0).dot(n0) / ((p - p0).dot(n0) + (p - p2).dot(n2));

    // reconstruct from q_i:
    n0 = (q1 - q0).normal();
    n1 = (q2 - q1).normal();
    n2 = (q3 - q2).normal();
    n3 = (q0 - q3).normal();
    DoublePoint A = n3.mult(u - 1) + n1.mult(u);
    DoublePoint B = n0.mult(v - 1) + n2.mult(v);
    double k = (u - 1) * q3.dot(n3) + u * q1.dot(n1);
    double l = (v - 1) * q0.dot(n0) + v * q2.dot(n2);
    double invdet = 1.0 / (A.x * B.y - A.y * B.x);
    DoublePoint detPt = DoublePoint(
      B.y * k - A.y * l,
      -B.x * k + A.x * l,
    ).mult(invdet);
    return detPt.x > 0 && detPt.x < 1 && detPt.y > 0 && detPt.y < 1;
  }

  DoublePoint get center => (p1 + p2 + p3 + p4) / 4.0;

  static const fromJson = QuadMapper.fromJson;
}
