import 'package:fifteen/game_widget.dart';
import 'package:fifteen/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlayPage extends StatelessWidget {
  const PlayPage();

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var theme = Theme.of(context);

    var (n, m) = appState.boardDim;
    return SafeArea(
      top: true,
      child: Scaffold(
        body: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("$n x $m"),
              Expanded(
                child: GameWidget(
                    board: appState.board,
                    boardDim: appState.boardDim,
                    onTap: appState.tap),
              ),
              Wrap(
                spacing: 5.0,
                runSpacing: 5.0,
                children: [
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all(theme.colorScheme.primary),
                      foregroundColor:
                          WidgetStateProperty.all(theme.colorScheme.onPrimary),
                    ),
                    onPressed: () => {appState.shufflePlay()},
                    child: Text("suffle"),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all(theme.colorScheme.primary),
                      foregroundColor:
                          WidgetStateProperty.all(theme.colorScheme.onPrimary),
                    ),
                    onPressed: () => {appState.solve()},
                    child: Text("salf"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
