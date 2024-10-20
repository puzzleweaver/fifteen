import 'dart:async';
import 'dart:ui';
import 'dart:ui' as ui;

import 'package:fifteen/debug/ui/shader_test/shader_test_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ShaderTestPage extends StatefulWidget {
  final String shaderPath = "shaders/image_quad.frag";
  final String imagePath = "assets/images/img4.png";

  ShaderTestPage();

  @override
  State<ShaderTestPage> createState() => _ShaderTestPageState();
}

class _ShaderTestPageState extends State<ShaderTestPage> {
  late Timer timer;
  double delta = 0;
  FragmentShader? shader;
  ui.Image? image;
  bool quadTo = false, boardy = false;

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
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Quad Shader Test Page"),
        actions: [
          IconButton(
            icon: Icon(quadTo ? Icons.arrow_downward : Icons.arrow_upward),
            onPressed: () => setState(() => quadTo = !quadTo),
          ),
          IconButton(
            icon: Icon(boardy ? Icons.square : Icons.waves),
            onPressed: () => setState(() => boardy = !boardy),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 8,
            child: Center(child: _body()),
          ),
          Expanded(
            flex: 3,
            child: Image.asset(widget.imagePath),
          ),
        ],
      ),
    );
  }

  Widget _body() {
    if (shader == null) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return AspectRatio(
        aspectRatio: 1.0,
        child: CustomPaint(
          painter: ShaderTestPainter(
            shader: shader!,
            time: delta,
            image: image,
            quadTo: quadTo,
            boardy: boardy,
          ),
        ),
      );
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
