import 'package:fifteen/math/level.dart';
import 'package:fifteen/shared/ui/preview_widget_painter.dart';
import 'package:fifteen/shared/ui/custom_canvas.dart';
import 'package:flutter/material.dart';

class PreviewWidget extends StatelessWidget {
  final Level level;
  final bool locked;
  final bool showImage;

  const PreviewWidget({
    super.key,
    required this.level,
    required this.locked,
    this.showImage = true,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: Stack(
        fit: StackFit.expand,
        children: [
          if (showImage)
            Image.asset(
              level.image,
              fit: BoxFit.fill,
            ),
          FifteenCanvas(
            getPainter: (shader, image) => PreviewWidgetPainter(
              board: level.board,
              locked: locked,
              shader: shader,
              image: image,
            ),
            imagePath: 'assets/images/photos/desert.jpg',
          ),
        ],
      ),
    );
  }
}
