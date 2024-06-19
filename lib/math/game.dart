import 'package:fifteen/math/board.dart';
import 'package:fifteen/math/coord.dart';
import 'package:fifteen/math/dir_coord.dart';
import 'package:fifteen/math/offsett.dart';
import 'package:fifteen/math/quad.dart';

class Game {
  final int len;
  final List<int> permutation;
  final List<Offsett> dirs;

  Game({
    required this.len,
    required this.permutation,
    required this.dirs,
  });

  static Game fromBoard(Board board) {
    int len = board.countSubquads();
    return Game(
      len: len,
      permutation: [for (var i = 0; i < len; i++) i],
      dirs: [for (var i = 0; i < len; i++) Offsett.UP],
    );
  }

  Quad getQuad(List<Quad> subquads, int index) {
    return subquads[permutation[index]].rel(dirs[index]);
  }

  Quad getQuadRelless(List<Quad> subquads, int index) {
    return subquads[permutation[index]];
  }

  bool isSpace(int index) {
    return permutation[index] == len - 1;
  }

  int getSpace() {
    for (int i = 0; i < len; i++) {
      if (isSpace(i)) return i;
    }
    return -1; // ERROR!
  }

  Game tapAtIndex(Board board, int index) {
    final Coord? c = board.getCoord(index);
    if (c == null) {
      return this;
    }
    for (Offsett dir in Offsett.DIRS) {
      DirCoord? result = board.simpleTransform(c, dir);
      if (result == null) continue;
      int resultIndex = board.getIndex(result.coord);
      if (isSpace(resultIndex)) {
        List<int> newPermutation = permutation.toList();
        List<Offsett> newDirs = dirs.toList();
        newPermutation[index] = permutation[resultIndex];
        newPermutation[resultIndex] = permutation[index];
        newDirs[index] = dirs[resultIndex].rel(result.dir);
        newDirs[resultIndex] = dirs[index].invrel(result.dir);
        return Game(
          len: len,
          permutation: newPermutation,
          dirs: newDirs,
        );
      }
    }
    return this;
  }
}
