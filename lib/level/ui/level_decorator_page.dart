import 'package:fifteen/math/level.dart';
import 'package:fifteen/shared/data/assets.dart';
import 'package:flutter/material.dart';

class LevelDecoratorPage extends StatelessWidget {
  final Level level;
  final void Function(Level newLevel, String description) setLevel;

  const LevelDecoratorPage({
    super.key,
    required this.setLevel,
    required this.level,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Wrap(
        direction: Axis.horizontal,
        spacing: 5,
        runSpacing: 5,
        children: [
          for (String imagePath in Assets.images)
            ElevatedButton(
              style: ElevatedButton.styleFrom(padding: EdgeInsets.zero),
              onPressed: level.image == imagePath
                  ? null
                  : () => setLevel(
                        level.copyWith(
                          image: imagePath,
                        ),
                        "Updated Image",
                      ),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Image.asset(
                  imagePath,
                  width: 100,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
