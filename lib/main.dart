import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
  var board = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 0];
  var n = 0;
  void increment() {
    n++;
    notifyListeners();
  }

  int getBoard(int i) {
    if (i < 0 || i > 15) return -1;
    return board[i];
  }

  void swap(int i, int j) {
    var tmp = board[i];
    board[i] = board[j];
    board[j] = tmp;
    notifyListeners();
  }

  void tap(int i) {
    for (var j in [
      if (i % 4 != 3) i + 1,
      if (i % 4 != 0) i - 1,
      i + 4,
      i - 4
    ]) {
      if (getBoard(j) == 0) {
        swap(i, j);
        return;
      }
    }
  }

  void reset() {
    for (var i = 0; i < 16; i++) {
      board[i] = i + 1;
    }
    board[15] = 0;
    notifyListeners();
  }
}

Widget getButt(int i, MyAppState state) {
  var val = state.board[i];
  return TextButton(
      style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(
              val != 0 ? Colors.blue : Colors.white)),
      onPressed: () => {state.tap(i)},
      child: Text(
        "$val",
        style: new TextStyle(
          fontSize: 20.0,
          color: Colors.white,
        ),
      ));
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min, // shrink it so it centers vertically
          children: [
            Text('State: ${appState.current.asLowerCase}'),
            Text('Fifteen Puzzle:'),
            for (var i = 0; i < 4; i++)
              Row(
                  mainAxisSize:
                      MainAxisSize.min, // shrink it so it centers vertically,
                  children: [
                    for (var j = 0; j < 4; j++) getButt(i * 4 + j, appState),
                  ]),
            Text(""),
            TextButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(Colors.blue),
                  foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
                ),
                onPressed: appState.reset,
                child: Text("reset"))
          ],
        ),
      ),
    );
  }
}
