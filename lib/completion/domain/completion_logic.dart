import 'package:fifteen/board/domain/board.dart';

class CompletionLogic {
  final bool Function(String boardId) isSolved;

  CompletionLogic({required this.isSolved});

  int furthestSolved(List<Board> boardSequence) {
    return boardSequence
        .map((board) => isSolved(board.id))
        .toList()
        .lastIndexOf(true);
  }

  int firstUnsolved(List<Board> boardSequence) {
    return boardSequence
        .map((board) => isSolved(board.id))
        .toList()
        .indexWhere((solved) => solved == false);
  }

  bool isLocked(List<Board> boardSequence, String boardId) {
    int index = boardSequence.indexWhere((board) => board.id == boardId);
    return index > furthestSolved(boardSequence) + 3;
  }

  Board? next(List<Board> boardSequence) {
    // int nextIndex = furthestSolved(boardSequence) + 1;
    int nextIndex = firstUnsolved(boardSequence);
    if (nextIndex >= boardSequence.length || nextIndex < 0) return null;
    return boardSequence[nextIndex];
  }
}
