import 'package:fifteen/board/domain/board.dart';
import 'package:fifteen/board/domain/coord.dart';
import 'package:fifteen/board/domain/int_point.dart';
import 'package:fifteen/board/domain/oriented_coord.dart';
import 'package:fifteen/game/domain/game.dart';

class GameplayState {
  final Board board;
  final Game game;
  final Game previousGame;
  final int moveCount;

  GameplayState({
    required this.board,
    required this.game,
    required this.previousGame,
    required this.moveCount,
  });

  static GameplayState fromGame(Board board, Game initialGame) => GameplayState(
        board: board,
        game: initialGame,
        previousGame: initialGame,
        moveCount: 0,
      );

  static GameplayState get empty => fromGame(Board.empty, Game.empty);
  static GameplayState fromBoard(Board board) =>
      fromGame(board, Game.fromBoard(board));
  GameplayState get shuffled => fromGame(board, game.shuffle(board));
  GameplayState get solved => fromGame(board, game.solve());

  GameplayState get previewing => fromBoard(board);

  /// Return the state after tapping a square. Returns null if there's no change.
  GameplayState? tap(int index) {
    Game? newGame = game.tapAtIndex(board, index);
    if (newGame == null) return null; // no change
    return GameplayState(
      board: board,
      previousGame: game,
      game: newGame,
      moveCount: moveCount + 1,
    );
  }

  (OrientedCoord, OrientedCoord)? getAnimationStuff() {
    IntPoint? getDir(int from, int to) {
      for (IntPoint dir in IntPoint.dirs) {
        Coord? next = board.step(board.getCoord(from)!, dir)?.coord;
        if (next == null) continue;
        if (board.getIndex(next) == to) return dir;
      }
      return null;
    }

    int spaceIs = game.space, spaceWas = previousGame.space;
    Coord? spaceIsCoord = board.getCoord(spaceIs),
        spaceWasCoord = board.getCoord(spaceWas);
    if (spaceIsCoord == null || spaceWasCoord == null) return null;
    IntPoint? spaceIsDir = getDir(spaceIs, spaceWas),
        spaceWasDir = getDir(spaceWas, spaceIs);
    if (spaceIsDir == null || spaceWasDir == null) return null;
    return (
      OrientedCoord(spaceIsCoord, spaceIsDir),
      OrientedCoord(spaceWasCoord, spaceWasDir),
    );
  }

  bool get isSolved => game.isSolved;
}
