import 'dart:math';

import 'package:fifteen/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlayPage extends StatelessWidget {
  final int n, m;

  const PlayPage({super.key, required this.n, required this.m});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("$n x $m"),
          Expanded(
            child: GameWidget(n: n, m: m),
          ),
        ],
      ),
    );
  }
}

class GameWidget extends StatelessWidget {
  final int n, m;

  const GameWidget({Key? key, required this.n, required this.m})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return CustomPaint(
        painter: GamePainter(n: n, m: m),
        child: GestureDetector(
          onTapDown: (_) => appState.setSolved((n, m)),
          onTapUp: (_) => print('up'),
          child: Container(),
        )
        // For painting on foreground
        // foregroundPainter: DemoPainter(),
        );
  }
}

class GamePainter extends CustomPainter {
  final int n, m;
  GamePainter({required this.n, required this.m}) : super();

  var rectColor = [
    Colors.purple,
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.amber
  ][Random().nextInt(5)];

  double pgonx(int i, int n) {
    return cos(6.282 * i / n) * 50;
  }

  double pgony(int i, int n) {
    return sin(6.282 * i / n) * 50;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var rect = Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2),
        width: size.width,
        height: size.height);

    canvas.drawRect(rect, Paint()..color = Colors.blue);

    canvas.drawRect(
      rect,
      Paint()
        ..strokeWidth = 10
        ..color = Colors.red
        ..style = PaintingStyle.stroke,
    );

    for (var i = 0; i < n; i++) {
      canvas.drawLine(Offset(100 + pgonx(i, n), 100 + pgony(i, n)),
          Offset(100 + pgonx(i + 1, n), 100 + pgony(i + 1, n)), Paint());
    }
    for (var i = 0; i < m; i++) {
      canvas.drawLine(Offset(300 + pgonx(i, m), 400 + pgony(i, m)),
          Offset(300 + pgonx(i + 1, m), 400 + pgony(i + 1, m)), Paint());
    }

    canvas.clipRect(Offset.zero & size);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
