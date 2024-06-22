import 'dart:math';

class Offsett {
  final int x, y;

  Offsett(this.x, this.y);

  static final up = Offsett(0, 2),
      right = Offsett(2, 0),
      down = Offsett(0, -2),
      left = Offsett(-2, 0),
      dirs = [up, right, down, left];

  static Offsett randomDir(Random r) {
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

  Offsett invrel(Offsett dir) {
    Offsett ret = Offsett(
      (dir.y * x - dir.x * y) ~/ 2,
      (dir.y * y + dir.x * x) ~/ 2,
    );
    assert(ret == this * dir.inv());
    return ret;
  }

  Offsett inv() {
    return Offsett(-x, y);
  }

  Offsett operator +(Offsett o) {
    return Offsett(x + o.x, y + o.y);
  }

  Offsett operator -(Offsett o) {
    return Offsett(x - o.x, y - o.y);
  }

  Offsett operator *(Object other) {
    if (other is int) {
      return Offsett(x * other, y * other);
    } else if (other is Offsett) {
      return Offsett(
        (other.y * x + other.x * y) ~/ 2,
        (other.y * y - other.x * x) ~/ 2,
      );
    }
    throw UnimplementedError("Offsett Operator *");
  }

  Offsett operator -() {
    return Offsett(-x, -y);
  }

  @override
  String toString() {
    return "Offsett($x, $y)";
  }

  int taxi() {
    return x.abs() + y.abs();
  }

  @override
  bool operator ==(Object other) {
    if (other is! Offsett) return false;
    return x == other.x && y == other.y;
  }

  @override
  int get hashCode => x * 10 + y;

  Offsett asDir() {
    Offsett ret = Offsett(
      2 * (x < 0 ? -1 : (x > 0 ? 1 : 0)),
      2 * (y < 0 ? -1 : (y > 0 ? 1 : 0)),
    );
    assert(ret == up || ret == right || ret == down || ret == left);
    return ret;
  }
}
