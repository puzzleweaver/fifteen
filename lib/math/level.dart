import 'dart:math';

import 'package:fifteen/math/board.dart';
import 'package:fifteen/math/board_list.dart';

class Level {
  static final List<Board> _boards = [
    BoardList.classic3,
    BoardList.classic4,
    BoardList.cube2,
    BoardList.star4,
    BoardList.cube3,
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
    BoardList.starbox4,
    BoardList.paths4,
    BoardList.split4,
  ];
  static final List<Level> adventure = [
    for (int i = 0; i < _boards.length; i++)
      Level(
        board: _boards[i],
        index: i,
      )
  ];
  static final List<Level> allBoards = [
    for (int i = 0; i < BoardList.all.length; i++)
      Level(board: BoardList.all[i])
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

  static String randomImage() {
    const images = [
      "assets/images/img1.png",
      "assets/images/img2.png",
      "assets/images/img3.png",
      "assets/images/img4.png",
    ];
    return images[Random().nextInt(images.length)];
  }

  static int randomBackground() {
    return Random().nextInt(6);
  }

  bool hasNext() {
    return index != null && index != adventure.length - 1;
  }

  Level get next => adventure[index! + 1];
}
