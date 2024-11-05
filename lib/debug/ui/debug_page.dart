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

    int count = 1;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("DEBUG"),
            ...[
              Colors.green,
              Colors.black,
              Colors.red,
              Colors.yellow,
              Colors.purple,
              Colors.orange,
            ].map(
              (color) => Text("${count++}", style: TextStyle(color: color)),
            ),
          ],
        ),
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
              for (int i = 0; i < Assets.boards.length; i++) ...[
                DebugPageBoardButton(asset: Assets.boards[i]),
                Text("$i"),
              ],
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
