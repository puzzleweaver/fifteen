import 'package:fifteen/debug/ui/debug_page_board_button.dart';
import 'package:fifteen/level/ui/level_builder_page.dart';
import 'package:fifteen/main.dart';
import 'package:fifteen/math/level.dart';
import 'package:fifteen/shared/data/assets.dart';
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
                (asset) => DebugPageBoardButton(asset: asset),
              )
            ],
          ),
        ),
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
