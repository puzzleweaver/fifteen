import 'dart:math';

import 'package:dart_mappable/dart_mappable.dart';

part 'int_point.mapper.dart';

@MappableClass()
class IntPoint with IntPointMappable {
  final int x, y;

  const IntPoint(this.x, this.y);
  static IntPoint createSpace(int i, int j) => IntPoint(i * 2, j * 2);

  bool get isEven => (x ~/ 2 + y ~/ 2).isEven;
  bool get isOdd => (x ~/ 2 + y ~/ 2).isOdd;

  IntPoint get transpose => IntPoint(y, x);
  IntPoint get normal => IntPoint(y, -x);

  IntPoint get xstep => IntPoint(x.sign * 2, 0);
  IntPoint get ystep => IntPoint(0, y.sign * 2);

  static const zero = IntPoint(0, 0),
      up = IntPoint(0, 2),
      right = IntPoint(2, 0),
      down = IntPoint(0, -2),
      left = IntPoint(-2, 0),
      dirs = [up, right, down, left];

  static IntPoint randomDir(Random r) {
    int which = r.nextInt(4);
    switch (which) {
      case 0:
        return up;
      case 1:
        return right;
      case 2:
        return down;
    }
    return left;
  }

  IntPoint invrel(IntPoint dir) {
    IntPoint ret = IntPoint(
      (dir.y * x - dir.x * y) ~/ 2,
      (dir.y * y + dir.x * x) ~/ 2,
    );
    assert(ret == this * dir.inv());
    return ret;
  }

  IntPoint inv() {
    return IntPoint(-x, y);
  }

  IntPoint operator +(IntPoint o) => IntPoint(x + o.x, y + o.y);
  IntPoint operator -(IntPoint o) => IntPoint(x - o.x, y - o.y);
  IntPoint operator -() => IntPoint(-x, -y);
  // dynamic operator *(Object other) {
  //   if (other is int) {
  //     return IntPoint(x * other, y * other);
  //   } else if (other is IntPoint) {
  //     return IntPoint(
  //       (other.y * x + other.x * y) ~/ 2,
  //       (other.y * y - other.x * x) ~/ 2,
  //     );
  //   } else if (other is Piece) {
  //     return other.copyWith(dir: this * other.dir);
  //   }
  //   throw UnimplementedError("IntPoint Operator *");
  // }

  IntPoint operator *(Object other) {
    if (other is int) {
      return IntPoint(x * other, y * other);
    } else if (other is IntPoint) {
      return IntPoint(
        (other.y * x + other.x * y) ~/ 2,
        (other.y * y - other.x * x) ~/ 2,
      );
    }
    throw UnimplementedError("IntPoint Operator *");
  }

  int get taxi => (x.abs() + y.abs()) ~/ 2;

  IntPoint asDir() {
    IntPoint ret = IntPoint(
      2 * (x < 0 ? -1 : (x > 0 ? 1 : 0)),
      2 * (y < 0 ? -1 : (y > 0 ? 1 : 0)),
    );
    assert(ret == up || ret == right || ret == down || ret == left);
    return ret;
  }

  int get dirIndex {
    if (this == up) return 0;
    if (this == right) return 1;
    if (this == down) return 2;
    if (this == left) return 3;
    return -1;
  }

  static const fromJson = IntPointMapper.fromJson;
}
