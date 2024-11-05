import 'package:fifteen/math/level.dart';
import 'package:fifteen/shared/ui/preview_widget.dart';
import 'package:flutter/material.dart';

class GamePreviewButton extends StatelessWidget {
  final Level level;
  final void Function(bool previewing) setPreviewing;

  const GamePreviewButton({
    super.key,
    required this.setPreviewing,
    required this.level,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) => setPreviewing(true),
      onTapUp: (details) => setPreviewing(false),
      onTapCancel: () => setPreviewing(false),
      child: PreviewWidget(
        level: level,
        locked: false,
      ),
      // child: ElevatedButton(
      //   onPressed: () => {},
      //   child: const Text("View Solution"),
      // ),
    );
  }
}
