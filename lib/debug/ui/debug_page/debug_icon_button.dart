import 'package:fifteen/debug/ui/debug_page/debug_page.dart';
import 'package:flutter/material.dart';

class DebugIconButton extends StatelessWidget {
  const DebugIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.build),
      color: const Color(0x11000000),
      onPressed: () => goToDebug(context),
    );
  }

  void goToDebug(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const DebugPage()),
    );
  }
}
