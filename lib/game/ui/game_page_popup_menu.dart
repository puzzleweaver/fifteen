import 'package:fifteen/settings/ui/settings_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class GamePagePopupMenu extends StatelessWidget {
  final void Function() shuffle;
  final void Function() solve;
  final void Function() boardBuild;
  const GamePagePopupMenu({
    super.key,
    required this.shuffle,
    required this.solve,
    required this.boardBuild,
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
        boardBuild();
    }
  }

  void goToSettings(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SettingsPage()),
    );
  }
}
