import 'package:uuid/uuid.dart';

class Completion {
  final String id;
  final String boardId;
  final int moveCount;
  final Duration time;
  final DateTime date;

  Completion({
    required this.id,
    required this.boardId,
    required this.moveCount,
    required this.time,
    required this.date,
  });

  static Completion createNew({
    required String boardId,
    required Duration time,
    required int moveCount,
  }) =>
      Completion(
        id: const Uuid().v1(),
        boardId: boardId,
        time: time,
        moveCount: moveCount,
        date: DateTime.now(),
      );
}
