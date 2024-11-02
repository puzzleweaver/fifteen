import 'package:flutter/material.dart';

class ConfirmationDialog extends StatelessWidget {
  final void Function() onConfirm;

  const ConfirmationDialog({super.key, required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Are You Sure?"),
      content: const Text("This might take a while to undo."),
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("NEVER"),
        ),
        ElevatedButton(
          onPressed: onConfirm,
          child: const Text("OK"),
        ),
      ],
    );
  }
}
