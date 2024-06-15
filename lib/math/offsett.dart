class Offsett {
  final int x, y;

  Offsett(this.x, this.y);

  static final UP = Offsett(0, 2),
      RIGHT = Offsett(2, 0),
      DOWN = Offsett(0, -2),
      LEFT = Offsett(-2, 0),
      CORNER = Offsett(-1, 1),
      DIRS = [UP, RIGHT, DOWN, LEFT],
      DEFAULT = newCenter(0, 0);

  static Offsett midpoint(Offsett a, Offsett b) {
    return Offsett((a.x + b.x) / 2 as int, ((a.y + b.y) / 2) as int);
  }

  static Offsett newCenter(int x, int y) {
    return Offsett(x * 2, y * 2);
  }

  static Offsett newCorner(int x, int y) {
    return Offsett(x * 2 - 1, y * 2 - 1);
  }

  static Offsett newOffsett(int x, int y) {
    return Offsett(x * 2, y * 2);
  }

  // assumes that directions are length 1.
  Offsett rel(Offsett dir) {
    return Offsett(
        (dir.y * x + dir.x * y) / 2 as int, (dir.y * y - dir.x * x) / 2 as int);
  }

  Offsett invrel(Offsett dir) {
    return Offsett(
        (dir.y * x - dir.x * y) / 2 as int, (dir.y * y + dir.x * x) / 2 as int);
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

  String toString() {
    return "(${x / 2}, ${y / 2})";
  }

  int taxi() {
    return x.abs() + y.abs();
  }

  bool _card() {
    return (x == 0) != (y == 0);
  }

  bool sim(Offsett b) {
    return _card() && b._card() && (x + y).abs() == (b.x + b.y).abs();
  }

  int dot(Offsett dir) {
    return (x * dir.x + y * dir.y);
  }

  int wedge(Offsett dir) {
    return (x * dir.y - y * dir.x);
  }

  Offsett dx() {
    return Offsett(2 * x.compareTo(0), 0);
  }

  Offsett dy() {
    return Offsett(0, 2 * y.compareTo(0));
  }

  Offsett addHalf(Offsett dir) {
    return Offsett(x + dir.x / 2 as int, y + dir.y / 2 as int);
  }

  bool isEdge() {
    return (x % 2 == 0) != (y % 2 == 0);
  }

  // only for cardinal directions.
  bool isHorizontal() {
    return x != 0;
  }

  // TODO: overwrite operator?
  bool equals(Offsett o) {
    return o.x == x && o.y == y;
  }
}
