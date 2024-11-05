import 'dart:math';

import 'package:flutter/material.dart';

class HomePageHeaderIcon extends StatelessWidget {
  final double alpha;

  const HomePageHeaderIcon({super.key, required this.alpha});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double minor = min(size.width, size.height);
    // major = max(size.width, size.height);

    return SizedBox.square(
      dimension: minor * 0.66,
      child: Image.asset(
        "assets/images/header.png",
        fit: BoxFit.fill,
        opacity: AlwaysStoppedAnimation(1.0 - alpha),
      ),
    );
  }
}
