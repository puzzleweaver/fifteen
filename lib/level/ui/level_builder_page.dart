import 'dart:developer';

import 'package:fifteen/level/ui/level_builder_tabs.dart';
import 'package:fifteen/math/level.dart';
import 'package:fifteen/shared/ui/history_widget.dart';
import 'package:flutter/material.dart';

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
        backgroundColor: const Color.fromARGB(255, 255, 0, 255),
        unselectedItemColor: Colors.white,
        selectedItemColor: const Color(0x44000000),
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
          SingleChildScrollView(
            primary: true,
            child: LevelBuilderTabs.tab(
              current: level,
              set: set,
              index: currentIndex,
              context: context,
            ),
          ),
        ],
      ),
    );
  }

  void set(Level newLevel, String message) {
    if (newLevel == level) return;
    setState(() {
      history = [...history, GameBuilderHistoryItem(level, message)];
      level = newLevel;
      unsavedChanges = true;
    });
  }

  void undo() {
    if (history.isEmpty) return;
    setState(() {
      level = history.last.level;
      history = [for (int i = 0; i < history.length - 1; i++) history[i]];
      unsavedChanges = history.isNotEmpty;
    });
  }

  void submit() {
    log(
      level.toJson(),
    );
  }
}
