import 'dart:math';

import 'package:fifteen/play_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selectedIndex = 0;

  Widget getButton(var size) {
    return TextButton(
        onPressed: () => {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return PlayPage(n: size.$1, m: size.$2);
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
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
          body: Center(
        child: Wrap(
          children: [
            for (var size in sizes) getButton(size),
          ],
        ),
      ));
    });
  }
}
