import 'package:fifteen/app/domain/preferences_data.dart';
import 'package:fifteen/completion/data/completions.dart';
import 'package:fifteen/completion/domain/completion.dart';

class PreferencesCompletions extends Completions {
  final PreferencesData preferences;

  PreferencesCompletions({required this.preferences});

  @override
  bool isSolved(String boardId) => preferences.solvedBoards.contains(boardId);

  @override
  bool isLocked(List<String> boardSequenceIds, String boardId) {
    int furthestSolved =
        boardSequenceIds.map((id) => isSolved(id)).toList().lastIndexOf(true);
    int index = boardSequenceIds.indexOf(boardId);
    return index > furthestSolved + 1;
  }

  @override
  void save(Completion newCompletion) {
    preferences.solvedBoards = {
      ...preferences.solvedBoards,
      newCompletion.boardId,
    }.toList();
  }

  @override
  void deleteAll() {
    preferences.solvedBoards = [];
  }
}
