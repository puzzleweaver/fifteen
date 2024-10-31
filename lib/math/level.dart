import 'dart:math';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:fifteen/board/domain/board.dart';
import 'package:fifteen/board/domain/board_list.dart';

part 'level.mapper.dart';

@MappableClass()
class Level with LevelMappable {
  static final List<Board> _boardSequence = [
    for (int i = 0; i < 20; i++) ...BoardList.all,
  ];
  static final List<Level> adventure = [
    for (int i = 0; i < _boardSequence.length; i++)
      Level(
        board: _boardSequence[i],
        index: i,
        image: images[i % images.length],
      ),
  ];
  static final List<Level> allBoards = [
    for (int i = 0; i < BoardList.all.length; i++)
      Level(board: BoardList.all[i]),
  ];

  final Board board;
  final String image;
  final int? index; // if null, no next button after solving the level

  Level({
    required this.board,
    String? image,
    this.index,
  }) : image = image ?? randomImage();

  static final images = [
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
    return images[Random().nextInt(images.length)];
  }

  static int randomBackground() {
    return Random().nextInt(6);
  }

  static Level createNew() => Level(
        board: Board.createNew(),
      );

  bool hasNext() {
    return index != null && index != adventure.length - 1;
  }

  Level get next => adventure[index! + 1];
}
