import 'package:fifteen/main.dart';
import 'package:fifteen/math/board.dart';
import 'package:fifteen/math/game.dart';
import 'package:fifteen/shader_tests/game_page.dart';
import 'package:fifteen/shader_tests/image_test_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selectedIndex = 0;

  Widget getButton(Board board, String label, MyAppState appState) {
    final theme = Theme.of(context);
    return TextButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(theme.colorScheme.primary),
          foregroundColor: WidgetStateProperty.all(theme.colorScheme.onPrimary),
        ),
        onPressed: () => {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                appState.setBoard(board);
                return GamePage(
                  imagePath: "assets/images/img3.png",
                  shaderPath: "shaders/image_quad.frag",
                  appState: appState,
                );
              }))
            },
        child: Text(label));
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    final theme = Theme.of(context);

    return LayoutBuilder(builder: (context, constraints) {
      return SafeArea(
        top: true,
        child: Scaffold(
          body: Center(
            child: Wrap(
              runSpacing: 5.0,
              spacing: 5.0,
              children: [
                getButton(Board.rect(4, 4), "4 x 4", appState),
                getButton(Board.rect(5, 5), "5 x 5", appState),
                getButton(Board.rect(20, 20), "20 x 20", appState),
                getButton(Board.test(), "Cube", appState),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all(theme.colorScheme.primary),
                    foregroundColor:
                        WidgetStateProperty.all(theme.colorScheme.onPrimary),
                  ),
                  onPressed: () => {
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
                    ),
                  },
                  child: Text("shader test"),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
