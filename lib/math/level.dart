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
    String? image,
    this.index,
  }) : image = "assets/images/photos/desert.jpg";

  static Level createNew() => Level(
        board: Board.createNew(),
      );

  bool hasNext() {
    return false;
  }
}
