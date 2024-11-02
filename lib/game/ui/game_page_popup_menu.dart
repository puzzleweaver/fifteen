import 'package:fifteen/level/ui/level_builder_page.dart';
import 'package:fifteen/math/level.dart';
import 'package:fifteen/settings/ui/settings_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class GamePagePopupMenu extends StatelessWidget {
  final void Function() shuffle;
  final void Function() solve;
  const GamePagePopupMenu({
    super.key,
    required this.shuffle,
    required this.solve,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (selected) => handleMore(context, selected),
      itemBuilder: (BuildContext context) {
        return {
          'Shuffle',
          if (kDebugMode) 'Solve',
          if (kDebugMode) 'Build',
          'Settings',
        }
            .map(
              (String choice) => PopupMenuItem<String>(
                value: choice,
                child: Text(choice),
              ),
            )
            .toList();
      },
    );
  }

  void handleMore(BuildContext context, String label) {
    switch (label) {
      case 'Shuffle':
        shuffle();
      case 'Settings':
        goToSettings(context);
      case 'Solve':
        solve();
      case 'Build':
        goToBuilder(context);
    }
  }

  void goToSettings(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SettingsPage()),
    );
  }

  void goToBuilder(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LevelBuilderPage(
          initialLevel: Level.createNew(),
        ),
      ),
    );
  }
}
