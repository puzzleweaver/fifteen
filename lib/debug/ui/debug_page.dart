import 'package:fifteen/board/domain/board.dart';
import 'package:fifteen/game/ui/game_page.dart';
import 'package:fifteen/level/ui/level_builder_page.dart';
import 'package:fifteen/main.dart';
import 'package:fifteen/math/level.dart';
import 'package:fifteen/shared/data/assets.dart';
import 'package:fifteen/shared/ui/json_widget.dart';
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Wrap(
            spacing: 5,
            runSpacing: 5,
            children: [
              ElevatedButton(
                onPressed: () => goToBuilder(context, appState),
                child: const Text("Board Builder"),
              ),
              ...Assets.boards.map(
                (board) => levelButton(context, board),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget levelButton(BuildContext context, String asset) {
    return JsonWidget(
      asset: asset,
      getObject: (contents) => Level(
        board: Board.fromJson(contents),
      ),
      builder: (context, level) => ElevatedButton(
        style: ElevatedButton.styleFrom(padding: EdgeInsets.zero),
        onPressed: () =>
            play(context, Provider.of(context, listen: false), level),
        child: Column(
          children: [
            SizedBox.square(
              dimension: 50.0,
              child: PreviewWidget(
                level: level,
                locked: false,
                showImage: false,
              ),
            ),
            Text(asset.split("/")[2].replaceAll(".json", "")),
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
          appState.setLevel(level);
          return GamePage(
            level: level,
            appState: appState,
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
          appState.setLevel(Level.createNew());
          return LevelBuilderPage(
            initialLevel: Level.createNew(),
          );
        },
      ),
    );
  }
}
