import 'package:fifteen/builder_ui/builder_page.dart';
import 'package:fifteen/game_ui/game_page.dart';
import 'package:fifteen/main.dart';
import 'package:fifteen/math/board.dart';
import 'package:fifteen/math/level.dart';
import 'package:fifteen/shader_test_ui/shader_test_page.dart';
import 'package:fifteen/shared_ui/preview_widget.dart';
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
      body: GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 5.0,
        crossAxisSpacing: 5.0,
        padding: EdgeInsets.all(5.0),
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () => goToImageTest(context),
              child: Text("Shader Test"),
            ),
          ),
          Expanded(
            child: ElevatedButton(
              onPressed: () => goToBuilder(context, appState),
              child: Text("Board Builder"),
            ),
          ),
          ...Level.allBoards.map(
            (level) => ElevatedButton(
              onPressed: () => play(context, appState, level),
              child: SizedBox.square(
                dimension: 75.0,
                child: PreviewWidget(
                  level: level,
                  locked: false,
                ),
              ),
            ),
          )
        ],
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
      MaterialPageRoute(builder: (context) => ShaderTestPage()),
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
