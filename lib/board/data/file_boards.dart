import 'package:fifteen/app/data/assets.dart';
import 'package:fifteen/board/data/boards.dart';
import 'package:fifteen/board/domain/board.dart';
import 'package:flutter/material.dart';

class FileBoards extends Boards {
  final AssetBundle bundle;

  FileBoards(BuildContext context) : bundle = DefaultAssetBundle.of(context);

  Future<Board> readOne(String boardAsset) => bundle
      .loadString(boardAsset)
      .then((contents) => Board.fromJson(contents));

  Future<List<Board>> readAll() {
    Future<List<Board>> ret = Future(() => []);
    for (String asset in Assets.boards) {
      ret = ret.then((previousBoards) {
        return readOne(asset)
            .then(
              (board) => [...previousBoards, board],
            )
            .catchError((error) => previousBoards);
      });
    }
    return ret;
  }

  @override
  Future<List<Board>> sequence() => readAll();
}
