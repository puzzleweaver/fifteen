import 'dart:math';

class Offsett {
  final int x, y;
  final bool _isDir;

  Offsett(this.x, this.y, {bool? isDir}) : _isDir = isDir ?? false;

  static final UP = Offsett(0, 1, isDir: true),
      RIGHT = Offsett(1, 0, isDir: true),
      DOWN = Offsett(0, -1, isDir: true),
      LEFT = Offsett(-1, 0, isDir: true),
      DIRS = [UP, RIGHT, DOWN, LEFT];

  static Offsett randomDir(Random r, {Offsett? prev, Offsett? exclude}) {
    if (prev != null && prev.x != exclude?.x && prev.y != exclude?.y) {
      return prev;
    }
    int which = r.nextInt(4);
    switch (which) {
      case 0:
        return randomDir(r, prev: UP, exclude: exclude);
      case 1:
        return randomDir(r, prev: RIGHT, exclude: exclude);
      case 2:
        return randomDir(r, prev: DOWN, exclude: exclude);
    }
    return randomDir(r, prev: LEFT, exclude: exclude);
  }

  Offsett rel(Offsett dir) {
    return Offsett(
      dir.y * x + dir.x * y,
      dir.y * y - dir.x * x,
      isDir: dir._isDir && _isDir,
    );
  }

  Offsett invrel(Offsett dir) {
    return Offsett(dir.y * x - dir.x * y, dir.y * y + dir.x * x);
  }

  Offsett inv() {
    return Offsett(-x, y);
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

  // TODO: overwrite operator?
  bool equals(Offsett o) {
    return o.x == x && o.y == y;
  }
}
