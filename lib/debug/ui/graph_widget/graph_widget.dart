import 'package:fifteen/board/domain/board.dart';
import 'package:fifteen/debug/ui/graph_widget/graph_widget_painter.dart';
import 'package:fifteen/shared/ui/custom_canvas.dart';
import 'package:flutter/material.dart';

class GraphWidget extends StatelessWidget {
  final Board board;

  const GraphWidget({super.key, required this.board});

  @override
  Widget build(BuildContext context) {
    return FifteenCanvas(
      imagePath: "assets/images/photos/desert.jpg",
      getPainter: (shader, image) => GraphWidgetPainter(
        shader: shader,
        image: image,
        board: board,
      ),
    );
  }
}
