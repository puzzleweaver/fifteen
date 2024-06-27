import 'dart:math';

import 'package:fifteen/builder_ui/builder_page.dart';
import 'package:fifteen/main.dart';
import 'package:fifteen/math/board.dart';
import 'package:fifteen/game_ui/game_page.dart';
import 'package:fifteen/math/level.dart';
import 'package:fifteen/settings_ui/settings_page.dart';
import 'package:fifteen/shader_test_ui/image_test_page.dart';
import 'package:fifteen/shared_ui/banner_ad_widget.dart';
import 'package:fifteen/shared_ui/game_preview_widget.dart';
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
        alpha = alpha.clamp(0, 1);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<FifteenAppState>();

    var gameButtons = Level.adventure.map((lvl) => getButton(lvl, appState));

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
      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          actions: [
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () => goToSettings(appState),
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
                SafeArea(
                  bottom: false,
                  child: Image.asset(
                    "assets/images/icon.png",
                    height: 300,
                    width: 300,
                    fit: BoxFit.fill,
                    opacity: AlwaysStoppedAnimation(1.0 - alpha),
                  ),
                ),
                Wrap(
                  runSpacing: 5.0,
                  spacing: 5.0,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    ...gameButtons,
                    ...testButtons,
                  ],
                ),
                SafeArea(child: BannerAdWidget(3, padded: true)),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget getButton(Level level, FifteenAppState appState) {
    return ElevatedButton(
      onPressed: () => goToGame(level, appState),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(8.0),
      ),
      // child: Text(label),
      child: PreviewWidget(
        level: level,
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

  void goToSettings(FifteenAppState appState) {
    appState.rerollAds();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SettingsPage()),
    );
  }

  void goToBuilder(FifteenAppState appState) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          appState.setBoard(Board.createNew());
          return BuilderPage(
            appState: appState,
          );
        },
      ),
    );
  }

  void goToGame(Level level, FifteenAppState appState) {
    appState.rerollAds();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          appState.setBoard(level.board);
          return GamePage(
            level: level,
            appState: appState,
          );
        },
      ),
    );
  }

  void resetScroll() {}
}
