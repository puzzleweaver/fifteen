import 'dart:async';

import 'package:async/async.dart';
import 'package:fifteen/app/domain/preferences_data.dart';
import 'package:fifteen/board/domain/board.dart';
import 'package:fifteen/completion/data/completions.dart';
import 'package:fifteen/completion/domain/completion.dart';
import 'package:fifteen/completion/domain/completion_logic.dart';

class PreferencesCompletions extends Completions {
  final PreferencesData preferences;

  PreferencesCompletions({required this.preferences});

  // stuff for keeping everything up-to-date: just emit to controller to refresh dependent UI.
  static StreamController<void> controller = StreamController.broadcast();
  static Stream<void> get onChanges => controller.stream;
  static Stream<T> returnOnChanges<T>(T Function() getValue) =>
      StreamGroup.merge([
        onChanges.map((_) => getValue()),
        Stream.value(getValue()),
      ]).distinct();

  bool isSolvedOnce(String boardId) =>
      preferences.solvedBoards.contains(boardId);

  @override
  Stream<bool> isSolved(String boardId) =>
      returnOnChanges(() => isSolvedOnce(boardId));

  @override
  Stream<bool> isLocked(List<Board> boardSequence, String boardId) =>
      returnOnChanges(
        () => CompletionLogic(isSolved: isSolvedOnce)
            .isLocked(boardSequence, boardId),
      );

  @override
  Stream<Board?> next(List<Board> boardSequence) => returnOnChanges(
        () => CompletionLogic(isSolved: isSolvedOnce).next(boardSequence),
      );

  @override
  void save(Completion newCompletion) {
    preferences.solvedBoards = {
      ...preferences.solvedBoards,
      newCompletion.boardId,
    }.toList();
    controller.add(null);
  }

  @override
  void deleteAll() {
    preferences.solvedBoards = [];
    controller.add(null);
  }
}
