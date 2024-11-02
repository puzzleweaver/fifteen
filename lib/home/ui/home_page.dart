import 'package:fifteen/debug/ui/debug_icon_button.dart';
import 'package:fifteen/game/ui/game_page.dart';
import 'package:fifteen/home/ui/home_page_header_icon.dart';
import 'package:fifteen/level/level_list_page.dart';
import 'package:fifteen/math/level.dart';
import 'package:fifteen/settings/ui/settings_icon_button.dart';
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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HomePageHeaderIcon(alpha: _alpha),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => GamePage(
                        level: Level.createNew(),
                      ),
                    ),
                  );
                },
                child: const Text("Play Next Puzzle"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const LevelListPage(),
                    ),
                  );
                },
                child: const Text("View All Puzzles"),
              ),
            ],
          ),
        ),
      );
    });
  }
}
