import 'dart:async';
import 'dart:math';

import 'package:fifteen/home_ui/home_page.dart';
import 'package:fifteen/math/board.dart';
import 'package:fifteen/math/game.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

void main() {
  // initialize ad stuff
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(MobileAds.instance.initialize());

  runApp(FifteenApp());
}

class FifteenApp extends StatelessWidget {
  const FifteenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FifteenAppState(),
      child: MaterialApp(
        title: 'Fifteen',
        theme: ThemeData(
          useMaterial3: false,
          colorScheme: ColorScheme(
            primary: const Color.fromARGB(255, 255, 117, 158),
            onPrimary: Colors.black,
            secondary: Color.fromARGB(255, 0, 201, 107),
            onSecondary: Colors.black,
            error: Colors.red,
            onError: const Color.fromARGB(255, 254, 0, 0),
            surface: Color.fromARGB(34, 232, 240, 255),
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

class FifteenAppState extends ChangeNotifier {
  Board board = Board.createNew();
  Game game = Game(len: 0, permutation: [], rotation: []);
  List<double> adRolls = [for (int i = 0; i < 100; i++) Random().nextDouble()];

  void rerollAds() {
    print("Rerolling Ads...");
    adRolls = [for (int i = 0; i < 100; i++) Random().nextDouble()];
    notifyListeners();
  }

  void setBoard(Board newBoard) {
    board = newBoard;
    game = Game.fromBoard(board).shuffle(board);
  }

  void tapAtIndex(int index) {
    Game newGame = game.tapAtIndex(board, index);
    if (game != newGame) {
      game = newGame;
      notifyListeners();
    }
  }

  void shuffle() {
    game = game.shuffle(board);
    notifyListeners();
  }

  void solveGame() {
    game = game.solve();
    notifyListeners();
  }
}
