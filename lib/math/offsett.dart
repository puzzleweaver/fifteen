import 'dart:math';

class Offsett {
  final int x, y;
  final bool _isDir;

  Offsett(this.x, this.y, {bool? isDir}) : _isDir = isDir ?? false;

  static final up = Offsett(0, 1, isDir: true),
      right = Offsett(1, 0, isDir: true),
      down = Offsett(0, -1, isDir: true),
      left = Offsett(-1, 0, isDir: true),
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

  Offsett rel(Offsett dir) {
    assert(dir._isDir);
    return Offsett(
      dir.y * x + dir.x * y,
      dir.y * y - dir.x * x,
      isDir: dir._isDir && _isDir,
    );
  }

  Offsett invrel(Offsett dir) {
    assert(dir._isDir);
    Offsett ret = Offsett(
      dir.y * x - dir.x * y,
      dir.y * y + dir.x * x,
      isDir: dir._isDir && _isDir,
    );
    assert(ret.equals(rel(dir.inv())));
    return ret;
  }

  Offsett inv() {
    assert(_isDir);
    return Offsett(-x, y, isDir: _isDir);
  }

  Offsett add(Offsett o) {
    return Offsett(x + o.x, y + o.y);
  }

  Offsett sub(Offsett o) {
    return Offsett(x - o.x, y - o.y);
  }

  Offsett mult(int d) {
    return Offsett(x * d, y * d);
  }

  Offsett neg() {
    return Offsett(-x, -y);
  }

  @override
  String toString() {
    if (_isDir) {
      if (x == 0 && y == 1) return "up";
      if (x == 1 && y == 0) return "right";
      if (x == 0 && y == -1) return "down";
      if (x == -1 && y == 0) return "left";
      return "DIR($x, $y)";
    }
    return "($x, $y)";
  }

  int taxi() {
    return x.abs() + y.abs();
  }

  int dot(Offsett dir) {
    return (x * dir.x + y * dir.y);
  }

  int wedge(Offsett dir) {
    return (x * dir.y - y * dir.x);
  }

  bool equals(Offsett? o) {
    return x == o?.x && y == o?.y;
  }
}
