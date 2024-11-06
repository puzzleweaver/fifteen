import 'package:fifteen/completion/domain/completion.dart';

abstract class Completions {
  /// Returns whether the specified board has been solved.
  bool isSolved(String boardId);

  /// Returns whether the specified board is unlocked.
  bool isLocked(List<String> boardSequenceIds, String boardId);

  /// Register a new completion.
  void save(Completion newCompletion);

  /// Delete all completion data.
  void deleteAll();
}
