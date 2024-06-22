import 'dart:async';
import 'dart:ui';
import 'dart:ui' as ui;

import 'package:fifteen/shader_test_ui/image_test_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ImageTestPage extends StatefulWidget {
  const ImageTestPage({
    super.key,
    required this.shaderPath,
    required this.imagePath,
  });

  final String shaderPath;
  final String imagePath;

  @override
  State<ImageTestPage> createState() => _ImageTestPageState();
}

class _ImageTestPageState extends State<ImageTestPage> {
  late Timer timer;
  double delta = 0;
  FragmentShader? shader;
  ui.Image? image;
  bool quadTo = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadShader();
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Quad Shader Test Page"),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_forward),
            onPressed: () => setState(() => quadTo = !quadTo),
          )
        ],
      ),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: _body(),
      ),
    );
  }

  Widget _body() {
    if (shader == null) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return CustomPaint(
          painter: ImageTestPainter(
        shader: shader!,
        time: delta,
        image: image,
        quadTo: quadTo,
      ));
    }
  }

  Future<void> _loadShader() async {
    final imageData = await rootBundle.load(widget.imagePath);
    image = await decodeImageFromList(imageData.buffer.asUint8List());

    final program = await FragmentProgram.fromAsset(widget.shaderPath);
    shader = program.fragmentShader();
    setState(() {
      //trigger a repaint
    });

    timer = Timer.periodic(const Duration(milliseconds: 16), (timer) {
      if (!mounted) return;
      setState(() {
        delta += 1 / 60;
      });
    });
  }
}
