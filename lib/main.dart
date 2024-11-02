import 'dart:async';
import 'dart:math';

import 'package:fifteen/home/ui/home_page.dart';
import 'package:fifteen/board/domain/board.dart';
import 'package:fifteen/math/game.dart';
import 'package:fifteen/math/level.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

void main() {
  // initialize ad stuff
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(MobileAds.instance.initialize());

  runApp(const FifteenApp());
}

class FifteenApp extends StatelessWidget {
  const FifteenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FifteenAppState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Fifteen',
        theme: ThemeData(
          useMaterial3: false,
          colorScheme: const ColorScheme(
            primary: Colors.blue,
            onPrimary: Colors.black,
            secondary: Colors.green,
            onSecondary: Colors.black,
            error: Colors.red,
            onError: Color.fromARGB(255, 254, 0, 0),
            surface: Color.fromARGB(34, 232, 240, 255),
            onSurface: Color(0xFF241E30),
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
        home: const HomePage(),
      ),
    );
  }
}

class FifteenAppState extends ChangeNotifier {
  Level level = Level.createNew();
  Board get board => level.board;
  Game game = Game.createNew();
  List<double> adRolls = [for (int i = 0; i < 100; i++) Random().nextDouble()];

  void rerollAds() {
    adRolls = [for (int i = 0; i < 100; i++) Random().nextDouble()];
    notifyListeners();
  }

  void setLevel(Level newLevel) {
    level = newLevel;
    game = Game.fromBoard(level.board).shuffle(level.board);
  }

  void tapAtIndex(int index) {
    Game newGame = game.tapAtIndex(level.board, index);
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
