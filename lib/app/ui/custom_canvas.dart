import 'dart:ui';
import 'dart:ui' as ui;

import 'package:fifteen/board/domain/double_point.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class FifteenPainter extends CustomPainter {
  final FragmentShader shader;
  final ui.Image image;

  const FifteenPainter({
    required this.shader,
    required this.image,
  });
}

class FifteenCanvas extends StatefulWidget {
  final String shaderPath = "shaders/image_quad.frag";
  final String imagePath;

  final void Function(DoublePoint pos)? onTap;
  final FifteenPainter Function(FragmentShader shader, ui.Image image)
      getPainter;

  const FifteenCanvas({
    required this.getPainter,
    required this.imagePath,
    this.onTap,
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _PositionWidgetState();
}

class _PositionWidgetState extends State<FifteenCanvas> {
  FragmentShader? _shader;
  ui.Image? _image;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadShader();
    });
    super.initState();
  }

  Future<void> _loadShader() async {
    final imageData = await rootBundle.load(widget.imagePath);
    _image = await decodeImageFromList(imageData.buffer.asUint8List());

    final program = await FragmentProgram.fromAsset(widget.shaderPath);
    _shader = program.fragmentShader();

    // trigger repainting
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) => AspectRatio(
        aspectRatio: 1.0,
        child: _content(),
      );

  Widget _content() {
    if (_shader == null || _image == null) {
      return const CircularProgressIndicator();
    }

    final body = ClipRRect(
      child: CustomPaint(
        painter: widget.getPainter(_shader!, _image!),
      ),
    );

    return widget.onTap == null
        ? body
        : GestureDetector(
            onTapDown: (tapDetails) => onWidgetTap(tapDetails, context),
            child: body,
          );
  }

  void onWidgetTap(TapDownDetails tapDetails, BuildContext context) {
    final size = context.size ?? const Size(1.0, 1.0);
    var pos = DoublePoint.fromOffset(tapDetails.localPosition);
    pos = DoublePoint(pos.x / size.width, pos.y / size.height);
    widget.onTap?.call(pos);
  }
}
