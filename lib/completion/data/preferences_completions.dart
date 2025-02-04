import 'dart:async';

import 'package:async/async.dart';
import 'package:fifteen/app/domain/preferences.dart';
import 'package:fifteen/board/domain/board.dart';
import 'package:fifteen/completion/data/completions.dart';
import 'package:fifteen/completion/domain/completion.dart';
import 'package:fifteen/completion/domain/completion_logic.dart';

class PreferencesCompletions extends Completions {
  final Preferences prefs;

  PreferencesCompletions({required this.prefs});

  // stuff for keeping everything up-to-date: just emit to controller to refresh dependent UI.
  static StreamController<void> controller = StreamController.broadcast();
  static Stream<void> get onChanges => controller.stream;
  static Stream<T> returnOnChanges<T>(T Function() getValue) =>
      StreamGroup.merge([
        onChanges.map((_) => getValue()),
        Stream.value(getValue()),
      ]).distinct();

  @override
  bool isSolved(String boardId) => prefs.solvedBoards.contains(boardId);

  @override
  bool isLocked(List<Board> boardSequence, String boardId) =>
      CompletionLogic(isSolved: isSolved).isLocked(
        boardSequence,
        boardId,
      );

  @override
  Board? next(List<Board> boardSequence) =>
      CompletionLogic(isSolved: isSolved).next(boardSequence);

  @override
  void save(Completion newCompletion) {
    prefs.solvedBoards = {
      ...prefs.solvedBoards,
      newCompletion.boardId,
    }.toList();
  }

  @override
  void deleteAll() {
    prefs.solvedBoards = [];
  }
}
