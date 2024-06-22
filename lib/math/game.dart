import 'dart:math';

import 'package:fifteen/math/board.dart';
import 'package:fifteen/math/coord.dart';
import 'package:fifteen/math/dir_coord.dart';
import 'package:fifteen/math/offsett.dart';
import 'package:fifteen/math/quad.dart';

class Game {
  final int len;
  final List<int> permutation;
  final List<Offsett> rotation;

  Game({
    required this.len,
    required this.permutation,
    required this.rotation,
  });

  static Game fromBoard(Board board) {
    int len = board.countSubquads();
    return Game(
      len: len,
      permutation: [for (var i = 0; i < len; i++) i],
      rotation: [for (var i = 0; i < len; i++) Offsett.up],
    ); //.shuffle(board);
  }

  bool isSolved(int index) {
    return permutation[index] == index && rotation[index] == Offsett.up;
  }

  Quad getQuad(List<Quad> subquads, int index) {
    return subquads[permutation[index]].rel(rotation[index]);
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

  Game move(int i, int j, Offsett dir) {
    List<int> newPermutation = permutation.toList();
    List<Offsett> newDirs = rotation.toList();
    newPermutation[i] = permutation[j];
    newPermutation[j] = permutation[i];
    newDirs[i] = rotation[j] * dir;
    newDirs[j] = rotation[i].invrel(dir);
    return Game(
      len: len,
      permutation: newPermutation,
      rotation: newDirs,
    );
  }

  Game tapAtIndex(Board board, int index) {
    final Coord? c = board.getCoord(index);
    if (c != null) {
      for (Offsett dir in Offsett.dirs) {
        DirCoord? result = board.step(c, dir);
        if (result != null) {
          int resultIndex = board.getIndex(result.coord);
          if (isSpace(resultIndex)) {
            return move(index, resultIndex, result.dir);
          }
        }
      }
    }
    return this;
  }

  //
  Game shuffle(Board board) {
    Game ret = this;
    int len = board.countSubquads() * 60;
    for (int i = 0; i < len; i++) {
      int spaceIndex = ret.getSpace();
      Coord spaceCoord = board.getCoord(spaceIndex)!;
      Offsett dir = Offsett.randomDir(Random());
      DirCoord? result = board.step(spaceCoord, dir);
      if (result != null) {
        int resultIndex = board.getIndex(result.coord);
        ret = ret.move(spaceIndex, resultIndex, result.dir);
      }
    }
    return ret;
  }
}
