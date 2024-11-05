import 'dart:developer';

import 'package:fifteen/board/domain/board.dart';
import 'package:fifteen/board/ui/builder/board_builder_widget.dart';
import 'package:fifteen/board/ui/builder/history_widget.dart';
import 'package:flutter/material.dart';

class BoardBuilderPage extends StatefulWidget {
  final Board initialBoard;

  const BoardBuilderPage({
    super.key,
    required this.initialBoard,
  });

  @override
  State<StatefulWidget> createState() => BoardBuilderPageState();
}

class BoardBuilderHistoryItem {
  final Board board;
  final String description;
  BoardBuilderHistoryItem(this.board, this.description);
}

class BoardBuilderPageState extends State<BoardBuilderPage> {
  Board board = Board.createNew();
  List<BoardBuilderHistoryItem> history = [];
  bool unsavedChanges = false;

  @override
  void initState() {
    board = widget.initialBoard;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Board Bewilder"),
        actions: [
          IconButton(
            icon: const Icon(Icons.undo),
            onPressed: history.isEmpty ? null : undo,
          ),
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: unsavedChanges ? submit : null,
          ),
        ],
      ),
      body: Column(
        children: [
          HistoryWidget(
            length: history.length,
            index: history.length - 1,
            getChild: (index) => Text("($index) ${history[index].description}"),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              primary: true,
              child: BoardBuilderWidget(
                board: board,
                setBoard: (newBoard, description) => set(
                  context,
                  newBoard,
                  description,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void set(BuildContext context, Board newBoard, String message) {
    setState(() {
      history.add(
        BoardBuilderHistoryItem(newBoard, message),
      );
      board = newBoard;
      unsavedChanges = true;
    });
  }

  void undo() {
    assert(history.isNotEmpty);
    if (history.isEmpty) return;
    setState(() {
      history.removeLast();
      board = history.lastOrNull?.board ?? widget.initialBoard;
      unsavedChanges = history.isNotEmpty;
    });
  }

  void submit() {
    log(
      board.toJson(),
    );
  }
}
