import 'package:flutter/material.dart';

class BorderBox extends StatelessWidget {
  final Widget child;

  const BorderBox(this.child, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
      child: child,
    );
  }
}
