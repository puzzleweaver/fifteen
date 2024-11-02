import 'package:dart_mappable/dart_mappable.dart';
import 'package:fifteen/board/domain/board.dart';

part 'level.mapper.dart';

@MappableClass()
class Level with LevelMappable {
  final Board board;
  final String image;
  final int? index; // if null, no next button after solving the level

  Level({
    required this.board,
    required this.image,
    this.index,
  });

  static Level createNew() => Level(
        board: Board.createNew(),
        image: "assets/images/photos/desert.jpg",
      );

  bool hasNext() {
    return false;
  }
}
