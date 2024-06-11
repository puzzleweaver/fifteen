import 'dart:math';

import 'package:fifteen/shader_tests/general_shader_page.dart';
import 'package:fifteen/main.dart';
import 'package:fifteen/play_page.dart';
import 'package:fifteen/shader_tests/image_shader_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selectedIndex = 0;

  Widget getButton(var size, MyAppState appState) {
    final theme = Theme.of(context);
    return TextButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(theme.colorScheme.primary),
          foregroundColor: WidgetStateProperty.all(theme.colorScheme.onPrimary),
        ),
        onPressed: () => {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                appState.setPlayDim(size);
                return PlayPage();
              }))
            },
        child: Text("${size.$1}x${size.$2}"));
  }

  final sizes = [
    for (var i = 0; i < 49; i++)
      (Random().nextInt(10) + 2, Random().nextInt(10) + 2),
  ];

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    final theme = Theme.of(context);

    return LayoutBuilder(builder: (context, constraints) {
      return SafeArea(
        top: true,
        child: Scaffold(
          body: Center(
            child: Wrap(
              runSpacing: 5.0,
              spacing: 5.0,
              children: [
                for (var size in sizes) getButton(size, appState),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all(theme.colorScheme.primary),
                    foregroundColor:
                        WidgetStateProperty.all(theme.colorScheme.onPrimary),
                  ),
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return GeneralShaderPage(
                            shaderPath: "shaders/test_fractal.frag",
                          );
                        },
                      ),
                    )
                  },
                  child: Text("Shader"),
                ),
                TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all(theme.colorScheme.primary),
                      foregroundColor:
                          WidgetStateProperty.all(theme.colorScheme.onPrimary),
                    ),
                    onPressed: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return ImageShaderPage(
                                  imagePath: "assets/images/img.png",
                                  shaderPath: "shaders/image_blur.frag",
                                );
                              },
                            ),
                          ),
                        },
                    child: Text("Shader w/ Image"))
              ],
            ),
          ),
        ),
      );
    });
  }
}
