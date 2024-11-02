import 'dart:math';

import 'package:fifteen/debug/ui/debug_icon_button.dart';
import 'package:fifteen/home/ui/home_page_game_button.dart';
import 'package:fifteen/home/ui/home_page_header_icon.dart';
import 'package:fifteen/settings/ui/settings_icon_button.dart';
import 'package:fifteen/shared/data/assets.dart';
import 'package:fifteen/shared/ui/banner_ad_widget.dart';
import 'package:fifteen/shared/ui/preferences_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _controller = ScrollController();
  double _alpha = 0.0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _alpha = _controller.position.pixels / 300;
        _alpha = _alpha.clamp(0, 1);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    int levelCount = min(Assets.images.length, Assets.boards.length);

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          actions: const [
            if (kDebugMode) DebugIconButton(),
            SettingsIconButton(),
          ],
        ),
        body: PreferencesWidget(
          builder: (context, preferences) => SingleChildScrollView(
            controller: _controller,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  HomePageHeaderIcon(alpha: _alpha),
                  GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    padding: const EdgeInsets.all(5.0),
                    mainAxisSpacing: 5.0,
                    crossAxisSpacing: 5.0,
                    children: [
                      for (int i = 0; i < levelCount; i++)
                        HomePageGameButton(
                          isLocked: Random().nextBool(),
                          isSolved: Random().nextBool(),
                          imageAsset: Assets.images[i],
                          boardAsset: Assets.boards[i],
                        ),
                    ],
                  ),
                  SafeArea(
                    child: BannerAdWidget(3, padded: true),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
