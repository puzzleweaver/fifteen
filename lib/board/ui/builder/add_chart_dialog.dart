import 'package:flutter/material.dart';

class AddChartDialog extends StatelessWidget {
  final void Function(int n, int m) onSubmit;

  const AddChartDialog({super.key, required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Add Chart"),
      content: SingleChildScrollView(
        child: Wrap(
          children: [
            for (int i = 1; i <= 8; i++)
              for (int j = i; j <= 8; j++)
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    backgroundColor: i == j ? Colors.amber : null,
                  ),
                  onPressed: () {
                    onSubmit(i, j);
                    Navigator.pop(context);
                  },
                  child: Text("${i}x$j"),
                ),
          ],
        ),
      ),
    );
  }
}
