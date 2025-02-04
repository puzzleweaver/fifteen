import 'package:fifteen/board/domain/board.dart';
import 'package:fifteen/completion/domain/completion.dart';

abstract class Completions {
  /// Returns whether the specified board has been solved.
  bool isSolved(String boardId);

  /// Returns whether the specified board is unlocked.
  bool isLocked(List<Board> boardSequence, String boardId);

  /// Returns the first unsolved board, or null if there isn't one.
  Board? next(List<Board> boardSequence);

  /// Register a new completion.
  void save(Completion newCompletion);

  /// Delete all completion data.
  void deleteAll();
}
