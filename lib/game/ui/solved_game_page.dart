import 'package:fifteen/game/ui/game_page.dart';
import 'package:fifteen/main.dart';
import 'package:fifteen/math/level.dart';
import 'package:fifteen/shared/ui/interstitial_ad_widget.dart';
import 'package:fifteen/shared/ui/preview_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SolvedGamePage extends StatelessWidget {
  final Level level;
  final bool hasNext;
  final String time;
  final bool timerEnabled;

  const SolvedGamePage({
    super.key,
    required this.level,
    required this.hasNext,
    required this.time,
    required this.timerEnabled,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("You Solved This Board!"),
            Padding(
              padding: EdgeInsets.only(
                left: size.width * 0.2,
                right: size.width * 0.2,
              ),
              child: PreviewWidget(
                level: level,
                locked: false,
              ),
            ),
            if (timerEnabled) Text("Your time was $time."),
            Wrap(
              spacing: 5,
              runSpacing: 5,
              children: [
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
            ),
          ],
        ),
      ),
    );
  }

  void onHome(BuildContext context) {
    Navigator.pop(context);
    InterstitialAdWidget.show();
  }

  void onAgain(BuildContext context) {
    FifteenAppState appState = Provider.of<FifteenAppState>(
      context,
      listen: false,
    );
    InterstitialAdWidget.show();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) {
          appState.setLevel(level);
          return GamePage(level: level);
        },
      ),
    );
  }

  void onNext(BuildContext context) {
    FifteenAppState appState = Provider.of(context);
    InterstitialAdWidget.show();
    Level next = Level.createNew();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          appState.setLevel(next);
          return GamePage(level: next);
        },
      ),
    );
  }
}
