import 'package:fifteen/main.dart';
import 'package:fifteen/math/board.dart';
import 'package:fifteen/game_ui/game_page.dart';
import 'package:fifteen/shader_test_ui/image_test_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return LayoutBuilder(builder: (context, constraints) {
      return SafeArea(
        top: true,
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/icon.png",
                    height: 300, width: 300, fit: BoxFit.fill),
                Wrap(
                  runSpacing: 5.0,
                  spacing: 5.0,
                  children: [
                    getButton(Board.rect(4, 4), "4 x 4", appState),
                    getButton(Board.rect(5, 5), "5 x 5", appState),
                    getButton(Board.rect(20, 20), "20 x 20", appState),
                    getButton(Board.test(), "Cube", appState),
                    ElevatedButton(
                      onPressed: goToImageTest,
                      child: Text("shader test"),
                    ),
                    ElevatedButton(
                      onPressed: () => {},
                      child: Text("HI"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget getButton(Board board, String label, MyAppState appState) {
    return ElevatedButton(
      onPressed: () => goToGame(board, appState),
      child: Text(label),
    );
  }

  void goToImageTest() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return ImageTestPage(
            imagePath: "assets/images/img.png",
            shaderPath: "shaders/image_quad.frag",
          );
        },
      ),
    );
  }

  void goToGame(Board board, MyAppState appState) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          appState.setBoard(board);
          return GamePage(
            imagePath: "assets/images/img3.png",
            shaderPath: "shaders/image_quad.frag",
            appState: appState,
          );
        },
      ),
    );
  }
}
