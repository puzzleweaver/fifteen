import 'dart:math';

import 'package:fifteen/math/board.dart';
import 'package:fifteen/math/board_list.dart';

class Level {
  static final List<Level> adventure = [
    for (int i = 0; i < BoardList.all.length; i++)
      Level(
        board: BoardList.all[i],
        index: i,
      )
  ];

  final Board board;
  final String image;
  final int background;
  final int? _index; // if null, no next button after solving the level

  Level({
    required this.board,
    String? image,
    int? background,
    int? index,
  })  : image = image ?? randomImage(),
        background = background ?? randomBackground(),
        _index = index;

  static String randomImage() {
    const images = [
      "assets/images/img3.png",
      "assets/images/img4.png",
    ];
    return images[Random().nextInt(images.length)];
  }

  static int randomBackground() {
    return Random().nextInt(7);
  }

  bool hasNext() {
    return _index != null && _index != adventure.length - 1;
  }

  Level get next => adventure[_index! + 1];
}
