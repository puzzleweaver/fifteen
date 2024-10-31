// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'level.dart';

class LevelMapper extends ClassMapperBase<Level> {
  LevelMapper._();

  static LevelMapper? _instance;
  static LevelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LevelMapper._());
      BoardMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Level';

  static Board _$board(Level v) => v.board;
  static const Field<Level, Board> _f$board = Field('board', _$board);
  static String _$image(Level v) => v.image;
  static const Field<Level, String> _f$image =
      Field('image', _$image, opt: true);
  static int? _$index(Level v) => v.index;
  static const Field<Level, int> _f$index = Field('index', _$index, opt: true);

  @override
  final MappableFields<Level> fields = const {
    #board: _f$board,
    #image: _f$image,
    #index: _f$index,
  };

  static Level _instantiate(DecodingData data) {
    return Level(
        board: data.dec(_f$board),
        image: data.dec(_f$image),
        index: data.dec(_f$index));
  }

  @override
  final Function instantiate = _instantiate;

  static Level fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Level>(map);
  }

  static Level fromJson(String json) {
    return ensureInitialized().decodeJson<Level>(json);
  }
}

mixin LevelMappable {
  String toJson() {
    return LevelMapper.ensureInitialized().encodeJson<Level>(this as Level);
  }

  Map<String, dynamic> toMap() {
    return LevelMapper.ensureInitialized().encodeMap<Level>(this as Level);
  }

  LevelCopyWith<Level, Level, Level> get copyWith =>
      _LevelCopyWithImpl(this as Level, $identity, $identity);
  @override
  String toString() {
    return LevelMapper.ensureInitialized().stringifyValue(this as Level);
  }

  @override
  bool operator ==(Object other) {
    return LevelMapper.ensureInitialized().equalsValue(this as Level, other);
  }

  @override
  int get hashCode {
    return LevelMapper.ensureInitialized().hashValue(this as Level);
  }
}

extension LevelValueCopy<$R, $Out> on ObjectCopyWith<$R, Level, $Out> {
  LevelCopyWith<$R, Level, $Out> get $asLevel =>
      $base.as((v, t, t2) => _LevelCopyWithImpl(v, t, t2));
}

abstract class LevelCopyWith<$R, $In extends Level, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  BoardCopyWith<$R, Board, Board> get board;
  $R call({Board? board, String? image, int? index});
  LevelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _LevelCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Level, $Out>
    implements LevelCopyWith<$R, Level, $Out> {
  _LevelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Level> $mapper = LevelMapper.ensureInitialized();
  @override
  BoardCopyWith<$R, Board, Board> get board =>
      $value.board.copyWith.$chain((v) => call(board: v));
  @override
  $R call({Board? board, Object? image = $none, Object? index = $none}) =>
      $apply(FieldCopyWithData({
        if (board != null) #board: board,
        if (image != $none) #image: image,
        if (index != $none) #index: index
      }));
  @override
  Level $make(CopyWithData data) => Level(
      board: data.get(#board, or: $value.board),
      image: data.get(#image, or: $value.image),
      index: data.get(#index, or: $value.index));

  @override
  LevelCopyWith<$R2, Level, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _LevelCopyWithImpl($value, $cast, t);
}
