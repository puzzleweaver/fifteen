import 'package:fifteen/app/data/assets.dart';
import 'package:fifteen/board/data/boards.dart';
import 'package:fifteen/board/domain/board.dart';
import 'package:flutter/material.dart';

class FileBoards extends Boards {
  final AssetBundle bundle;

  List<Board>? cachedSequence;

  FileBoards(BuildContext context) : bundle = DefaultAssetBundle.of(context);

  Future<Board> readOne(String boardAsset) => bundle
      .loadString(boardAsset)
      .then((contents) => Board.fromJson(contents));

  Future<List<Board>> readSequence(List<String> assets) {
    if (cachedSequence != null) return Future.value(cachedSequence);
    Future<List<Board>> ret = Future(() => []);
    for (String asset in assets) {
      ret = ret.then((previousSequence) {
        return readOne(asset)
            .then(
              (board) => [...previousSequence, board],
            )
            .catchError((error) => previousSequence);
      });
    }
    return ret.then((sequence) {
      cachedSequence = sequence;
      return sequence;
    });
  }

  @override
  Future<List<Board>> sequence() => readSequence(Assets.boards);
}
