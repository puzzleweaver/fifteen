import 'dart:math';

class IntPoint {
  final int x, y;

  IntPoint(this.x, this.y);

  static final up = IntPoint(0, 2),
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

  IntPoint operator +(IntPoint o) {
    return IntPoint(x + o.x, y + o.y);
  }

  IntPoint operator -(IntPoint o) {
    return IntPoint(x - o.x, y - o.y);
  }

  IntPoint operator *(Object other) {
    if (other is int) {
      return IntPoint(x * other, y * other);
    } else if (other is IntPoint) {
      return IntPoint(
        (other.y * x + other.x * y) ~/ 2,
        (other.y * y - other.x * x) ~/ 2,
      );
    }
    throw UnimplementedError("Offsett Operator *");
  }

  IntPoint operator -() {
    return IntPoint(-x, -y);
  }

  @override
  String toString() {
    return "IntPoint($x, $y)";
  }

  int taxi() {
    return x.abs() + y.abs();
  }

  @override
  bool operator ==(Object other) {
    if (other is! IntPoint) return false;
    return x == other.x && y == other.y;
  }

  @override
  int get hashCode => Object.hash(x, y);

  IntPoint asDir() {
    IntPoint ret = IntPoint(
      2 * (x < 0 ? -1 : (x > 0 ? 1 : 0)),
      2 * (y < 0 ? -1 : (y > 0 ? 1 : 0)),
    );
    assert(ret == up || ret == right || ret == down || ret == left);
    return ret;
  }
}
