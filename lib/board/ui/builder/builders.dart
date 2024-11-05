import 'package:flutter/material.dart';

class Builders {
  static Widget button(IconData icon, void Function()? onPressed) {
    return IconButton(
      style: IconButton.styleFrom(backgroundColor: Colors.grey.shade300),
      onPressed: onPressed,
      icon: Icon(icon),
    );
  }

  static Widget container({
    required Widget body,
    required List<Widget> actions,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        body,
        Wrap(
          spacing: 5.0,
          runSpacing: 5.0,
          children: actions,
        ),
      ],
    );
  }
}
