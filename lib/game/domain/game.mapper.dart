// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'game.dart';

class GameMapper extends ClassMapperBase<Game> {
  GameMapper._();

  static GameMapper? _instance;
  static GameMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GameMapper._());
      IntPointMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Game';

  static int _$boardSize(Game v) => v.boardSize;
  static const Field<Game, int> _f$boardSize = Field('boardSize', _$boardSize);
  static List<int> _$permutation(Game v) => v.permutation;
  static const Field<Game, List<int>> _f$permutation =
      Field('permutation', _$permutation);
  static List<IntPoint> _$rotation(Game v) => v.rotation;
  static const Field<Game, List<IntPoint>> _f$rotation =
      Field('rotation', _$rotation);
  static int _$moveCount(Game v) => v.moveCount;
  static const Field<Game, int> _f$moveCount = Field('moveCount', _$moveCount);

  @override
  final MappableFields<Game> fields = const {
    #boardSize: _f$boardSize,
    #permutation: _f$permutation,
    #rotation: _f$rotation,
    #moveCount: _f$moveCount,
  };

  static Game _instantiate(DecodingData data) {
    return Game(
        boardSize: data.dec(_f$boardSize),
        permutation: data.dec(_f$permutation),
        rotation: data.dec(_f$rotation),
        moveCount: data.dec(_f$moveCount));
  }

  @override
  final Function instantiate = _instantiate;

  static Game fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Game>(map);
  }

  static Game fromJson(String json) {
    return ensureInitialized().decodeJson<Game>(json);
  }
}

mixin GameMappable {
  String toJson() {
    return GameMapper.ensureInitialized().encodeJson<Game>(this as Game);
  }

  Map<String, dynamic> toMap() {
    return GameMapper.ensureInitialized().encodeMap<Game>(this as Game);
  }

  GameCopyWith<Game, Game, Game> get copyWith =>
      _GameCopyWithImpl(this as Game, $identity, $identity);
  @override
  String toString() {
    return GameMapper.ensureInitialized().stringifyValue(this as Game);
  }

  @override
  bool operator ==(Object other) {
    return GameMapper.ensureInitialized().equalsValue(this as Game, other);
  }

  @override
  int get hashCode {
    return GameMapper.ensureInitialized().hashValue(this as Game);
  }
}

extension GameValueCopy<$R, $Out> on ObjectCopyWith<$R, Game, $Out> {
  GameCopyWith<$R, Game, $Out> get $asGame =>
      $base.as((v, t, t2) => _GameCopyWithImpl(v, t, t2));
}

abstract class GameCopyWith<$R, $In extends Game, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get permutation;
  ListCopyWith<$R, IntPoint, IntPointCopyWith<$R, IntPoint, IntPoint>>
      get rotation;
  $R call(
      {int? boardSize,
      List<int>? permutation,
      List<IntPoint>? rotation,
      int? moveCount});
  GameCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _GameCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Game, $Out>
    implements GameCopyWith<$R, Game, $Out> {
  _GameCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Game> $mapper = GameMapper.ensureInitialized();
  @override
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get permutation =>
      ListCopyWith(
          $value.permutation,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(permutation: v));
  @override
  ListCopyWith<$R, IntPoint, IntPointCopyWith<$R, IntPoint, IntPoint>>
      get rotation => ListCopyWith($value.rotation,
          (v, t) => v.copyWith.$chain(t), (v) => call(rotation: v));
  @override
  $R call(
          {int? boardSize,
          List<int>? permutation,
          List<IntPoint>? rotation,
          int? moveCount}) =>
      $apply(FieldCopyWithData({
        if (boardSize != null) #boardSize: boardSize,
        if (permutation != null) #permutation: permutation,
        if (rotation != null) #rotation: rotation,
        if (moveCount != null) #moveCount: moveCount
      }));
  @override
  Game $make(CopyWithData data) => Game(
      boardSize: data.get(#boardSize, or: $value.boardSize),
      permutation: data.get(#permutation, or: $value.permutation),
      rotation: data.get(#rotation, or: $value.rotation),
      moveCount: data.get(#moveCount, or: $value.moveCount));

  @override
  GameCopyWith<$R2, Game, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _GameCopyWithImpl($value, $cast, t);
}
