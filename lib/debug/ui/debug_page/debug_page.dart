import 'package:fifteen/board/domain/board.dart';
import 'package:fifteen/debug/ui/debug_page/debug_page_board_button.dart';
import 'package:fifteen/board/ui/builder/board_builder_page.dart';
import 'package:fifteen/app/data/assets.dart';
import 'package:flutter/material.dart';

class DebugPage extends StatelessWidget {
  const DebugPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                onPressed: () => goToBuilder(context),
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

  void goToBuilder(BuildContext context) {
    Board board = Board.createNew();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BoardBuilderPage(initialBoard: board),
      ),
    );
  }
}
