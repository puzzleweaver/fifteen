import 'dart:developer';

import 'package:fifteen/level/ui/level_builder_tabs.dart';
import 'package:fifteen/main.dart';
import 'package:fifteen/math/level.dart';
import 'package:fifteen/shared/ui/history_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LevelBuilderPage extends StatefulWidget {
  final Level initialLevel;

  const LevelBuilderPage({super.key, required this.initialLevel});

  @override
  State<StatefulWidget> createState() => LevelBuilderPageState();
}

class GameBuilderHistoryItem {
  final Level level;
  final String description;
  GameBuilderHistoryItem(this.level, this.description);
}

class LevelBuilderPageState extends State<LevelBuilderPage> {
  int currentIndex = 0;
  Level level = Level.createNew();
  List<GameBuilderHistoryItem> history = [];
  bool unsavedChanges = false;

  @override
  void initState() {
    level = widget.initialLevel;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LevelBuilderTabs.title(currentIndex)),
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
      bottomNavigationBar: BottomNavigationBar(
        useLegacyColorScheme: false,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        items: LevelBuilderTabs.items,
        onTap: (newTab) => setState(() => currentIndex = newTab),
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
              child: LevelBuilderTabs.tab(
                current: level,
                set: (level, message) => set(level, message, context),
                index: currentIndex,
                context: context,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void set(Level newLevel, String message, BuildContext context) {
    if (newLevel == level) return;
    setState(() {
      history = [...history, GameBuilderHistoryItem(level, message)];
      level = newLevel;
      unsavedChanges = true;
    });
    Provider.of<FifteenAppState>(context, listen: false).setLevel(level);
  }

  void undo() {
    if (history.isEmpty) return;
    setState(() {
      level = history.last.level;
      history = [for (int i = 0; i < history.length - 1; i++) history[i]];
      unsavedChanges = history.isNotEmpty;
    });
    Provider.of<FifteenAppState>(context, listen: false).setLevel(level);
  }

  void submit() {
    log(
      level.board.toJson(),
    );
  }
}
