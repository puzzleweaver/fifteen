import 'package:fifteen/app/ui/loading_widget.dart';
import 'package:fifteen/board/data/boards.dart';
import 'package:fifteen/board/data/file_boards.dart';
import 'package:fifteen/board/domain/board.dart';
import 'package:fifteen/debug/ui/debug_page/debug_page_board_button.dart';
import 'package:fifteen/board/ui/builder/board_builder_page.dart';
import 'package:flutter/material.dart';

class DebugPage extends StatelessWidget {
  const DebugPage({super.key});

  @override
  Widget build(BuildContext context) {
    int count = 1;

    Boards boards = FileBoards(context);

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
          child: Column(
            children: [
              Wrap(
                children: [
                  ElevatedButton(
                    onPressed: () => goToBuilder(context),
                    child: const Text("Board Builder"),
                  ),
                ],
              ),
              FutureBuilder(
                future: boards.sequence(),
                builder: (context, snapshot) {
                  List<Board>? boards = snapshot.data;
                  if (boards == null) return const LoadingWidget();
                  return Wrap(
                    runSpacing: 5,
                    spacing: 5,
                    children: [
                      for (Board board in boards)
                        DebugPageBoardButton(board: board),
                    ],
                  );
                },
              ),
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
