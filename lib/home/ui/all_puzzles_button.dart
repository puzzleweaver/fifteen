import 'package:fifteen/level/level_list_page.dart';
import 'package:flutter/material.dart';

class AllPuzzlesButton extends StatelessWidget {
  const AllPuzzlesButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const LevelListPage(),
          ),
        );
      },
      child: const Text("View All Puzzles"),
    );
  }
}
