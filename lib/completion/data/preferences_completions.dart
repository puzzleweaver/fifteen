import 'dart:async';

import 'package:async/async.dart';
import 'package:fifteen/app/domain/preferences_data.dart';
import 'package:fifteen/completion/data/completions.dart';
import 'package:fifteen/completion/domain/completion.dart';

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

  // TODO move this logic into domain layer?
  bool isSolvedOnce(String boardId) =>
      preferences.solvedBoards.contains(boardId);
  bool isLockedOnce(List<String> boardSequenceIds, String boardId) {
    int furthestSolved = boardSequenceIds
        .map((id) => isSolvedOnce(id))
        .toList()
        .lastIndexOf(true);
    int index = boardSequenceIds.indexOf(boardId);
    return index > furthestSolved + 1;
  }

  @override
  Stream<bool> isSolved(String boardId) =>
      returnOnChanges(() => isSolvedOnce(boardId));

  @override
  Stream<bool> isLocked(List<String> boardSequenceIds, String boardId) =>
      returnOnChanges(() => isLockedOnce(boardSequenceIds, boardId));

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
