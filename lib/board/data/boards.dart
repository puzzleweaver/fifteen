import 'package:fifteen/app/data/assets.dart';
import 'package:fifteen/board/domain/board.dart';
import 'package:flutter/material.dart';

class Boards {
  static AssetBundle getBundle(BuildContext context) =>
      DefaultAssetBundle.of(context);

  static Future<Board> readFromFile(AssetBundle bundle, String boardAsset) {
    return bundle
        .loadString(boardAsset)
        .then((contents) => Board.fromJson(contents));
  }

  static Future<Board> getOneByAsset(BuildContext context, String boardAsset) {
    return readFromFile(
      getBundle(context),
      boardAsset,
    );
  }

  static Future<List<Board>> getAll(BuildContext context) {
    AssetBundle bundle = getBundle(context);
    Future<List<Board>> ret = Future(() => []);
    for (String asset in Assets.boards) {
      ret = ret.then((previousBoards) {
        return readFromFile(bundle, asset)
            .then(
              (board) => [...previousBoards, board],
            )
            .catchError((error) => previousBoards);
      });
    }
    return ret;
  }

  static Future<Map<String, Board>> getAllByName(BuildContext context) {
    return getAll(context).then((boards) {
      return {
        for (Board board in boards) board.name: board,
      };
    });
  }

  static Future<Map<String, Board>> getAllById(BuildContext context) {
    return getAll(context).then((boards) {
      return {
        for (Board board in boards) board.id: board,
      };
    });
  }

  static Future<List<Board>> getSequence(BuildContext context) =>
      getAll(context);
}
