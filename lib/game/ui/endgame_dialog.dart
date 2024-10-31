import 'package:fifteen/game/ui/game_page.dart';
import 'package:fifteen/main.dart';
import 'package:fifteen/math/level.dart';
import 'package:fifteen/shared/ui/interstitial.dart';
import 'package:fifteen/shared/ui/preview_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EndgameDialog extends StatelessWidget {
  final Level level;
  final bool hasNext;
  final String time;
  final bool timerEnabled;

  const EndgameDialog({
    super.key,
    required this.level,
    required this.hasNext,
    required this.time,
    required this.timerEnabled,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("You Solved This Board!"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PreviewWidget(
            level: level,
            locked: false,
          ),
          if (timerEnabled) Text("Your time was $time."),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () => onHome(context),
          child: const Text("Home"),
        ),
        ElevatedButton(
          onPressed: () => onAgain(context),
          child: const Text("Again"),
        ),
        if (hasNext)
          ElevatedButton(
            onPressed: () => onNext(context),
            child: const Text("Next"),
          ),
      ],
    );
  }

  void onHome(BuildContext context) {
    Navigator.pop(context); // dismiss "you win" dialog
    Navigator.pop(context); // dismiss game page
    Interstitial.show();
  }

  void onAgain(BuildContext context) {
    FifteenAppState appState = Provider.of(context);
    Navigator.pop(context);
    Navigator.pop(context);
    Interstitial.show();
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

  void onNext(BuildContext context) {
    FifteenAppState appState = Provider.of(context);
    Navigator.pop(context);
    Navigator.pop(context);
    Interstitial.show();
    assert(level.hasNext());
    Level next = level.next;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          appState.setLevel(next);
          return GamePage(
            level: next,
            appState: appState,
          );
        },
      ),
    );
  }
}
