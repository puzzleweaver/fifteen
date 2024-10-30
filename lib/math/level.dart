import 'dart:math';

import 'package:fifteen/math/board.dart';
import 'package:fifteen/math/board_list.dart';

class Level {
  static final List<Board> _boardSequence = [
    BoardList.classic3,
    BoardList.classic4,
    BoardList.cube2,
    BoardList.star4,
    BoardList.cube2x3,
    BoardList.star5,
    BoardList.star6,
    BoardList.eyes2,
    BoardList.eye2,
    BoardList.starbox3,
    BoardList.cube15,
    BoardList.triangles3,
    BoardList.eye1,
    BoardList.eye4,
    BoardList.star66,
    BoardList.cube3x3,
    BoardList.starbox4,
    BoardList.paths4,
    BoardList.split4,
  ];
  static final List<Level> adventure = [
    for (int i = 0; i < _boardSequence.length; i++)
      Level(
        board: _boardSequence[i],
        index: i,
        image: _images[i % _images.length],
      ),
  ];
  static final List<Level> allBoards = [
    for (int i = 0; i < BoardList.all.length; i++)
      Level(board: BoardList.all[i]),
  ];

  final Board board;
  final String image;
  final int background;
  final int? index; // if null, no next button after solving the level

  Level({
    required this.board,
    String? image,
    int? background,
    this.index,
  })  : image = image ?? randomImage(),
        background = background ?? randomBackground();

  static final _images = [
    "assets/images/photos/avenue.jpg",
    "assets/images/photos/beach.jpg",
    "assets/images/photos/beach2.jpg",
    "assets/images/photos/bee.jpg",
    "assets/images/photos/dahlia.jpg",
    "assets/images/photos/dahlia2.jpg",
    "assets/images/photos/desert.jpg",
    "assets/images/photos/drop.jpg",
    "assets/images/photos/eurasian-squirrel.jpg",
    "assets/images/photos/field.jpg",
    "assets/images/photos/mean-leash.jpg",
    "assets/images/photos/milky-way.jpg",
    "assets/images/photos/moon.jpg",
    "assets/images/photos/mountains.jpg",
    "assets/images/photos/nature.jpg",
    "assets/images/photos/plaid.jpg",
    "assets/images/photos/straw-flower.jpg",
    "assets/images/photos/wave.jpg",
  ];
  static String randomImage() {
    return _images[Random().nextInt(_images.length)];
  }

  static int randomBackground() {
    return Random().nextInt(6);
  }

  bool hasNext() {
    return index != null && index != adventure.length - 1;
  }

  Level get next => adventure[index! + 1];
}
