import 'package:fifteen/builder/ui/builder_page.dart';
import 'package:fifteen/game/ui/game_page.dart';
import 'package:fifteen/main.dart';
import 'package:fifteen/math/board.dart';
import 'package:fifteen/math/level.dart';
import 'package:fifteen/debug/ui/shader_test/shader_test_page.dart';
import 'package:fifteen/shared/ui/preview_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DebugPage extends StatelessWidget {
  const DebugPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<FifteenAppState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("DEBUG (go away)"),
      ),
      body: GridView.count(
        crossAxisCount: 4,
        mainAxisSpacing: 5.0,
        crossAxisSpacing: 5.0,
        padding: const EdgeInsets.all(5.0),
        children: [
          ElevatedButton(
            onPressed: () => goToImageTest(context),
            child: const Text("Shader Test"),
          ),
          ElevatedButton(
            onPressed: () => goToBuilder(context, appState),
            child: const Text("Board Builder"),
          ),
          ...Level.allBoards.map(
            (level) => ElevatedButton(
              style: ElevatedButton.styleFrom(padding: EdgeInsets.zero),
              onPressed: () => play(context, appState, level),
              child: SizedBox.square(
                dimension: 75.0,
                child: PreviewWidget(
                  level: level,
                  locked: false,
                  showBackground: false,
                  showImage: false,
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
      MaterialPageRoute(builder: (context) => const ShaderTestPage()),
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
