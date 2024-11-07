import 'package:fifteen/board/domain/board.dart';
import 'package:fifteen/game/ui/game_page.dart';
import 'package:fifteen/app/ui/ads/interstitial_ad_widget.dart';
import 'package:fifteen/app/ui/preferences_widget.dart';
import 'package:fifteen/home/ui/next_puzzle_button.dart';
import 'package:fifteen/level/ui/level_widget/level_widget.dart';
import 'package:fifteen/app/ui/time_display.dart';
import 'package:flutter/material.dart';

class SolvedGamePage extends StatelessWidget {
  final Board board;
  final String imageAsset;
  final Duration time;

  const SolvedGamePage({
    super.key,
    required this.board,
    required this.imageAsset,
    required this.time,
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
              child: LevelWidget(
                board: board,
                imageAsset: imageAsset,
                locked: false,
              ),
            ),
            PreferencesWidget(
              builder: (context, preferences) {
                if (!preferences.timerEnabled) return Container();
                return TimeDisplay(
                  time: time,
                  builder: (context, timeString) => Text(
                    "Your time was $timeString.",
                  ),
                );
              },
            ),
            Wrap(
              spacing: size.width * 0.1,
              runSpacing: 5,
              children: [
                ElevatedButton(
                  onPressed: () => onBack(context),
                  child: const Text("Back"),
                ),
                ElevatedButton(
                  onPressed: () => onAgain(context),
                  child: const Text("Again"),
                ),
                const NextPuzzleButton(
                  pushReplace: true,
                  child: Text("Next"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void onBack(BuildContext context) {
    Navigator.pop(context);
    InterstitialAdWidget.show();
  }

  void onAgain(BuildContext context) {
    InterstitialAdWidget.show();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => GamePage(
          board: board,
          imageAsset: imageAsset,
        ),
      ),
    );
  }
}
