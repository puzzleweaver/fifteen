import 'dart:math';

import 'package:fifteen/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(FifteenApp());
}

class FifteenApp extends StatelessWidget {
  const FifteenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Fifteen',
        theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
            fontFamily: "Courier"),
        home: HomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  final boardDimList = [(4, 4), (6, 6), (8, 8), (3, 5)];

  var boardDim = (2, 2);
  var board = [1, 2, 3, 0];

  void solve() {
    setPlayDim(boardDim);
    notifyListeners();
  }

  int _getSpace() {
    for (var i = 0; i < board.length; i++) {
      if (board[i] == 0) return i;
    }
    print("BAD BAD BAD BAD!!!!");
    return 0;
  }

  void tap(int x, int y) {
    print("Position Tapped ($x, $y)");
    _move(y * boardDim.$1 + x);
    notifyListeners();
  }

  void _move(var to) {
    var from = _getSpace();
    var tmp = board[from];
    board[from] = board[to];
    board[to] = tmp;
  }

  List<int> _getMovables() {
    var space = _getSpace();
    var n = boardDim.$1;
    return [
      space + 1,
      space - 1,
      space + n,
      space - n,
    ].where((i) => i >= 0 && i < board.length).toList();
  }

  void setPlayDim(var size) {
    boardDim = size;
    var squares = boardDim.$1 * boardDim.$2;
    board = [for (var i = 0; i < squares - 1; i++) i + 1, 0];
  }

  void shufflePlay() {
    for (var i = 0; i < 6 * board.length; i++) {
      var movables = _getMovables();
      _move(movables[Random().nextInt(movables.length)]);
    }
  }
}
