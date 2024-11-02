import 'package:flutter/material.dart';

class HomePageHeaderIcon extends StatelessWidget {
  final double alpha;

  const HomePageHeaderIcon({super.key, required this.alpha});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(
        left: size.width / 6,
        right: size.width / 6,
        top: size.height / 16,
        bottom: size.height / 16,
      ),
      child: SizedBox.square(
        child: Image.asset(
          "assets/images/header.png",
          fit: BoxFit.fill,
          opacity: AlwaysStoppedAnimation(1.0 - alpha),
        ),
      ),
    );
  }
}
