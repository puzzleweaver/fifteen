import 'package:fifteen/builder_ui/builder_page.dart';
import 'package:fifteen/game_ui/game_page.dart';
import 'package:fifteen/main.dart';
import 'package:fifteen/math/board.dart';
import 'package:fifteen/math/level.dart';
import 'package:fifteen/shader_test_ui/image_test_page.dart';
import 'package:fifteen/shared_ui/game_preview_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DebugPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<FifteenAppState>();
    return Scaffold(
      appBar: AppBar(
        title: Text("DEBUG (go away)"),
      ),
      body: SingleChildScrollView(
        child: Wrap(
          children: [
            ElevatedButton(
              onPressed: () => goToImageTest(context),
              child: Text("Shader Test"),
            ),
            SizedBox.square(dimension: 8.0),
            ElevatedButton(
              onPressed: () => goToBuilder(context, appState),
              child: Text("Board Builder"),
            ),
            SizedBox.square(dimension: 8.0),
            ...Level.allBoards.map(
              (level) => ElevatedButton(
                  onPressed: () => play(context, appState, level),
                  child: PreviewWidget(
                    level: level,
                    dimension: 100.0,
                    locked: false,
                  )),
            )
          ],
        ),
      ),
    );
  }

  void play(BuildContext context, FifteenAppState appState, Level level) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          appState.setBoard(level.board);
          return GamePage(
            level: level,
            appState: appState,
          );
        },
      ),
    );
  }

  void goToImageTest(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return ImageTestPage(
            imagePath: "assets/images/img2.png",
            shaderPath: "shaders/image_quad.frag",
          );
        },
      ),
    );
  }

  void goToBuilder(BuildContext context, FifteenAppState appState) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          appState.setBoard(Board.createNew());
          return BuilderPage(
            appState: appState,
          );
        },
      ),
    );
  }
}
