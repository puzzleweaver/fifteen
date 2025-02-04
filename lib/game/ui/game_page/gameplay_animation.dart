import 'package:flutter/material.dart';

/// Trigger changing causes the animation to start over.
class GameplayAnimation extends StatefulWidget {
  final Widget Function(BuildContext context, double value) builder;
  final AnimationController controller;
  const GameplayAnimation({
    super.key,
    required this.builder,
    required this.controller,
  });

  @override
  State<StatefulWidget> createState() => GameplayAnimationState();
}

class GameplayAnimationState extends State<GameplayAnimation> {
  late Animation<double>? animation;

  @override
  void initState() {
    super.initState();
    animation = Tween<double>(begin: 0, end: 1).animate(widget.controller)
      ..addListener(
        () => setState(() {}),
      );
  }

  @override
  Widget build(BuildContext context) {
    final animation = this.animation;
    if (animation == null) return widget.builder(context, 0);
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) => widget.builder(context, animation.value),
    );
  }
}
