import 'package:fifteen/game/ui/game_page.dart';
import 'package:fifteen/level/ui/level_builder_page.dart';
import 'package:fifteen/main.dart';
import 'package:fifteen/board/domain/board.dart';
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
      body: Wrap(
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
              child: Column(
                children: [
                  SizedBox.square(
                    dimension: 75.0,
                    child: PreviewWidget(
                      level: level,
                      locked: false,
                      showImage: false,
                    ),
                  ),
                  Text("${level.board.subquads.length}")
                ],
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
          return LevelBuilderPage(
            initialLevel: Level.createNew(),
          );
        },
      ),
    );
  }
}
