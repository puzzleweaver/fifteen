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
  final boards = [(4, 4), (6, 6), (8, 8), (3, 5)];
  var _solved = {};

  bool isSolved(var name) {
    return _solved.containsKey(name) ? false : _solved[name];
  }

  void setSolved(var name) {
    _solved[name] = true;
    notifyListeners();
  }
}
