import 'dart:async';

import 'package:fifteen/board/domain/board.dart';

abstract class Boards {
  /// Returns the sequence of boards shown in adventure order.
  Future<List<Board>> sequence();
}
