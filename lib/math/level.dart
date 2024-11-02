import 'package:dart_mappable/dart_mappable.dart';
import 'package:fifteen/board/domain/board.dart';

part 'level.mapper.dart';

@MappableClass()
class Level with LevelMappable {
  final Board board;
  final String image;

  Level({
    required this.board,
    required this.image,
  });

  static Level createNew() => Level(
        board: Board.createNew(),
        image: "assets/images/photos/desert.jpg",
      );
}
