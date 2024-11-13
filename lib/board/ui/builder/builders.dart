import 'package:flutter/material.dart';

class Builders {
  static Widget button(IconData icon, void Function()? onPressed) {
    return IconButton(
      style: IconButton.styleFrom(backgroundColor: Colors.grey.shade300),
      onPressed: onPressed,
      icon: Icon(icon),
    );
  }
}
