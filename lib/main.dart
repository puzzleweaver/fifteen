import 'package:fifteen/home_ui/home_page.dart';
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
          useMaterial3: false,
          colorScheme: ColorScheme(
            primary: const Color.fromARGB(255, 255, 117, 158),
            onPrimary: Colors.black,
            secondary: const Color.fromARGB(255, 151, 255, 203),
            onSecondary: Colors.black,
            error: Colors.red,
            onError: const Color.fromARGB(255, 254, 0, 0),
            surface: const Color.fromARGB(255, 79, 210, 210),
            onSurface: const Color(0xFF241E30),
            brightness: Brightness.light,
            surfaceBright: Colors.green,
          ),
          fontFamily: "Courier",
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              shape: WidgetStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
        ),
        home: HomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  Board board = Board.createNew();
  Game game = Game(len: 0, permutation: [], dirs: []);

  void setBoard(Board board) {
    this.board = board;
    game = Game.fromBoard(board);
  }

  void tapAtIndex(int index) {
    game = game.tapAtIndex(board, index);
  }

  void shuffle() {
    game = game.shuffle(board);
  }
}
