import 'dart:math';

import 'package:flutter/material.dart';

class GameWidget extends StatelessWidget {
  final List<int> board;
  final Function(int, int) onTap;
  final (int, int) boardDim;
  const GameWidget(
      {Key? key,
      required this.board,
      required this.onTap,
      required this.boardDim})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (tapDetails) => onWidgetTap(tapDetails, getSize(context)),
      child: CustomPaint(
          painter: GamePainter(board: board, boardDim: boardDim, onTap: onTap),
          child: Container()),
    );
  }

  Size getSize(BuildContext context) {
    final box = context.findRenderObject() as RenderBox;
    return box.size;
  }

  void onWidgetTap(TapDownDetails tapDetails, Size size) {
    var pos = tapDetails.localPosition;

    var n = boardDim.$1, m = boardDim.$2;

    var dim = min(size.height * 0.9, size.width * 0.9);
    var corner = Offset(size.width, size.height) / 2 - Offset(dim, dim) / 2;
    var normalizedPos = (pos - corner).scale(1.0 * n, 1.0 * m) /
        dim; // tap, transformed so the board is [0, n] x [0, m]
    int xIndex = normalizedPos.dx.floor();
    int yIndex = normalizedPos.dy.floor();

    if (xIndex >= 0 && xIndex < n && yIndex >= 0 && yIndex < m) {
      onTap(xIndex, yIndex);
    }
  }
}

class GamePainter extends CustomPainter {
  final List<int> board;
  final Function(int, int) onTap;
  final (int, int) boardDim;
  GamePainter({
    required this.board,
    required this.boardDim,
    required this.onTap,
  }) : super();

  static const zoom = 0.9;
  static const gap = 1;

  var rectColor = [
    Colors.purple,
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.amber
  ][Random().nextInt(5)];

  void drawText(Canvas canvas, double x, double y, final int i) {
    const textStyle = TextStyle(
      color: Colors.black,
      fontSize: 30,
    );
    const textSpan = TextSpan(
      text: "1",
      style: textStyle,
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: 1000,
    );
    final xCenter = x - textPainter.width / 2;
    final yCenter = y - textPainter.height / 2;
    final offset = Offset(xCenter, yCenter);
    textPainter.paint(canvas, offset);
  }

  @override
  void paint(Canvas canvas, Size size) {
    var n = boardDim.$1, m = boardDim.$2;

    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..color = Colors.blue,
    );

    var dim = min(size.height * 0.9, size.width * 0.9);
    canvas.drawRect(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2),
        width: dim,
        height: dim,
      ),
      Paint()..color = Colors.green,
    );

    for (int i = 0; i < n; i++) {
      for (int j = 0; j < m; j++) {
        var num = board[i + j * n];
        if (num != 0) {
          canvas.drawRect(
            Rect.fromLTWH(
                size.width / 2 - dim / 2 + dim * i / n + gap,
                size.height / 2 - dim / 2 + dim * j / m + gap,
                dim / n - 2 * gap,
                dim / m - 2 * gap),
            Paint()
              ..color =
                  Color.fromARGB(255, 0, 0, (255.0 * num / (n * m)).toInt()),
          );
        }
      }
    }

    canvas.clipRect(Offset.zero & size);
  }

  @override
  bool shouldRepaint(covariant GamePainter oldDelegate) {
    return true;
  }
}
