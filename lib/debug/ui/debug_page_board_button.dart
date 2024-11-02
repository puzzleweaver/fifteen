import 'package:fifteen/board/domain/board.dart';
import 'package:fifteen/game/ui/game_page.dart';
import 'package:fifteen/main.dart';
import 'package:fifteen/math/level.dart';
import 'package:fifteen/shared/ui/json_widget.dart';
import 'package:fifteen/shared/ui/preview_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DebugPageBoardButton extends StatelessWidget {
  final String asset;

  const DebugPageBoardButton({super.key, required this.asset});

  @override
  Widget build(BuildContext context) {
    return JsonWidget(
      asset: asset,
      getObject: (contents) => Level(
        board: Board.fromJson(contents),
        image: "assets/images/photos/animal.jpg",
      ),
      builder: (context, level) => ElevatedButton(
        style: ElevatedButton.styleFrom(padding: EdgeInsets.zero),
        onPressed: () => goToGamePage(context, level),
        child: Column(
          children: [
            SizedBox.square(
              dimension: 50.0,
              child: PreviewWidget(
                level: level,
                locked: false,
                showImage: false,
              ),
            ),
            Text(asset.split("/")[2].replaceAll(".json", "")),
          ],
        ),
      ),
    );
  }

  void goToGamePage(BuildContext context, Level level) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          Provider.of<FifteenAppState>(context, listen: false).setLevel(level);
          return GamePage(
            level: level,
          );
        },
      ),
    );
  }
}
