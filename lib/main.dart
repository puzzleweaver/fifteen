import 'package:fifteen/home_page.dart';
import 'package:fifteen/math/board.dart';
import 'package:fifteen/math/game.dart';
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
  Board board = Board.rect(4, 4);
  Game game = Game.fromBoard(Board.rect(4, 4));

  void setBoard(Board board) {
    this.board = board;
    game = Game.fromBoard(board);
  }

  void tapAtIndex(int index) {
    game = game.tapAtIndex(board, index);
  }
}
