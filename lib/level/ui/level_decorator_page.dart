import 'package:fifteen/math/level.dart';
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
    return Wrap(
      children: [
        for (String imagePath in Level.images)
          ElevatedButton(
            onPressed: level.image == imagePath
                ? null
                : () => setLevel(
                      level.copyWith(
                        image: imagePath,
                      ),
                      "Updated Image",
                    ),
            child: Image.asset(
              imagePath,
              width: 50,
            ),
          ),
      ],
    );
  }
}
