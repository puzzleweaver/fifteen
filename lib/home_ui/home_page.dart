import 'dart:math';

import 'package:fifteen/builder_ui/builder_page.dart';
import 'package:fifteen/main.dart';
import 'package:fifteen/math/board.dart';
import 'package:fifteen/game_ui/game_page.dart';
import 'package:fifteen/math/board_list.dart';
import 'package:fifteen/settings_ui/settings_page.dart';
import 'package:fifteen/shader_test_ui/image_test_page.dart';
import 'package:fifteen/shared_ui/game_preview_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController controller = ScrollController();
  double alpha = 0.0;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        alpha = controller.position.pixels / 300;
        alpha = clampDouble(0, alpha, 1);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    var imgs = [
      "assets/images/img3.png",
      "assets/images/img4.png",
    ];
    Random r = Random(10000);
    var gameButtons = BoardList.all.map(
      (board) => getButton(board, imgs[r.nextInt(imgs.length)], appState),
    );

    var testButtons = [
      ElevatedButton(
        onPressed: goToImageTest,
        child: Text("Shader Test"),
      ),
      ElevatedButton(
        onPressed: () => goToBuilder(appState),
        child: Text("Board Builder"),
      ),
    ];

    return LayoutBuilder(builder: (context, constraints) {
      return SafeArea(
        top: true,
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            actions: [
              IconButton(
                icon: Icon(Icons.menu),
                onPressed: goToSettings,
              ),
            ],
            leading: AnimatedOpacity(
              opacity: alpha,
              duration: Durations.short1,
              child: IconButton(
                icon: Icon(Icons.expand_less),
                onPressed: () => controller.animateTo(
                  0.0,
                  duration: Durations.long1,
                  curve: Curves.easeInOut,
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            controller: controller,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/icon.png",
                    height: 300,
                    width: 300,
                    fit: BoxFit.fill,
                    opacity: AlwaysStoppedAnimation(1.0 - alpha),
                  ),
                  Wrap(
                    runSpacing: 5.0,
                    spacing: 5.0,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      ...gameButtons,
                      ...gameButtons,
                      ...testButtons,
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget getButton(Board board, String imgAsset, MyAppState appState) {
    return ElevatedButton(
      onPressed: () => goToGame(board, imgAsset, appState),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(8.0),
      ),
      // child: Text(label),
      child: GamePreviewWidget(
        imageAsset: imgAsset,
        board: board,
        dimension: getDim(context),
      ),
    );
  }

  double getDim(BuildContext context) {
    final box = MediaQuery.of(context);
    return min(box.size.width, box.size.height) / 4;
  }

  void goToImageTest() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return ImageTestPage(
            imagePath: "assets/images/img2.png",
            shaderPath: "shaders/image_quad.frag",
          );
        },
      ),
    );
  }

  void goToSettings() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SettingsPage()),
    );
  }

  void goToBuilder(MyAppState appState) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          appState.init(Board.createNew());
          return BuilderPage(
            appState: appState,
          );
        },
      ),
    );
  }

  void goToGame(Board board, String imgAsset, MyAppState appState) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          appState.init(board);
          return GamePage(
            imagePath: imgAsset,
            shaderPath: "shaders/image_quad.frag",
            appState: appState,
          );
        },
      ),
    );
  }

  void resetScroll() {}
}
