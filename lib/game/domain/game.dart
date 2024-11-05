import 'dart:math';

import 'package:fifteen/board/domain/board.dart';
import 'package:fifteen/board/domain/oriented_coord.dart';
import 'package:fifteen/board/domain/coord.dart';
import 'package:fifteen/board/domain/int_point.dart';
import 'package:fifteen/board/domain/quad.dart';

class Game {
  final int boardSize;
  final List<int> permutation;
  final List<IntPoint> rotation;

  Game({
    required this.boardSize,
    required this.permutation,
    required this.rotation,
  });

  static Game createNew() => Game(
        boardSize: 0,
        permutation: [],
        rotation: [],
      );

  static Game _fromLen(int len) {
    return Game(
      boardSize: len,
      permutation: [for (var i = 0; i < len; i++) i],
      rotation: [for (var i = 0; i < len; i++) IntPoint.up],
    );
  }

  static Game fromBoard(Board board) {
    return _fromLen(board.subquads.length);
  }

  Game solve() {
    return _fromLen(boardSize);
  }

  Game shuffle(Board board) {
    Game ret = this;
    int len = board.subquads.length * 60;
    for (int i = 0; i < len; i++) {
      int spaceIndex = ret.space;
      Coord spaceCoord = board.getCoord(spaceIndex)!;
      IntPoint dir = IntPoint.randomDir(Random());
      OrientedCoord? result = board.step(spaceCoord, dir);
      if (result != null) {
        int resultIndex = board.getIndex(result.coord);
        ret = ret.move(spaceIndex, resultIndex, result.dir);
      }
    }
    return ret;
  }

  bool isInPlace(int index) {
    return permutation[index] == index && rotation[index] == IntPoint.up;
  }

  bool get isSolved {
    return [for (int i = 0; i < boardSize; i++) i].every(isInPlace);
  }

  Quad getQuad(List<Quad> subquads, int index) {
    return subquads[permutation[index]].rel(rotation[index]);
  }

  bool isSpace(int index) {
    return permutation[index] == boardSize - 1;
  }

  int get space {
    for (int i = 0; i < boardSize; i++) {
      if (isSpace(i)) return i;
    }
    return -1; // ERROR!
  }

  Game move(int i, int j, IntPoint dir) {
    List<int> newPermutation = permutation.toList();
    List<IntPoint> newDirs = rotation.toList();
    newPermutation[i] = permutation[j];
    newPermutation[j] = permutation[i];
    newDirs[i] = rotation[j] * dir;
    newDirs[j] = rotation[i].invrel(dir);
    return Game(
      boardSize: boardSize,
      permutation: newPermutation,
      rotation: newDirs,
    );
  }

  /// returns the game after doing the move, or null when the tap isn't a move.
  Game? tapAtIndex(Board board, int index) {
    final Coord? c = board.getCoord(index);
    if (c != null) {
      for (IntPoint dir in IntPoint.dirs) {
        OrientedCoord? result = board.step(c, dir);
        if (result != null) {
          int resultIndex = board.getIndex(result.coord);
          if (isSpace(resultIndex)) {
            return move(index, resultIndex, result.dir);
          }
        }
      }
    }
    return null;
  }
}
