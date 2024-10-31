// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'side.dart';

class SideMapper extends ClassMapperBase<Side> {
  SideMapper._();

  static SideMapper? _instance;
  static SideMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SideMapper._());
      CoordMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Side';

  static Coord _$c1(Side v) => v.c1;
  static const Field<Side, Coord> _f$c1 = Field('c1', _$c1);
  static Coord _$c2(Side v) => v.c2;
  static const Field<Side, Coord> _f$c2 = Field('c2', _$c2);

  @override
  final MappableFields<Side> fields = const {
    #c1: _f$c1,
    #c2: _f$c2,
  };

  static Side _instantiate(DecodingData data) {
    return Side(data.dec(_f$c1), data.dec(_f$c2));
  }

  @override
  final Function instantiate = _instantiate;

  static Side fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Side>(map);
  }

  static Side fromJson(String json) {
    return ensureInitialized().decodeJson<Side>(json);
  }
}

mixin SideMappable {
  String toJson() {
    return SideMapper.ensureInitialized().encodeJson<Side>(this as Side);
  }

  Map<String, dynamic> toMap() {
    return SideMapper.ensureInitialized().encodeMap<Side>(this as Side);
  }

  SideCopyWith<Side, Side, Side> get copyWith =>
      _SideCopyWithImpl(this as Side, $identity, $identity);
  @override
  String toString() {
    return SideMapper.ensureInitialized().stringifyValue(this as Side);
  }

  @override
  bool operator ==(Object other) {
    return SideMapper.ensureInitialized().equalsValue(this as Side, other);
  }

  @override
  int get hashCode {
    return SideMapper.ensureInitialized().hashValue(this as Side);
  }
}

extension SideValueCopy<$R, $Out> on ObjectCopyWith<$R, Side, $Out> {
  SideCopyWith<$R, Side, $Out> get $asSide =>
      $base.as((v, t, t2) => _SideCopyWithImpl(v, t, t2));
}

abstract class SideCopyWith<$R, $In extends Side, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  CoordCopyWith<$R, Coord, Coord> get c1;
  CoordCopyWith<$R, Coord, Coord> get c2;
  $R call({Coord? c1, Coord? c2});
  SideCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _SideCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Side, $Out>
    implements SideCopyWith<$R, Side, $Out> {
  _SideCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Side> $mapper = SideMapper.ensureInitialized();
  @override
  CoordCopyWith<$R, Coord, Coord> get c1 =>
      $value.c1.copyWith.$chain((v) => call(c1: v));
  @override
  CoordCopyWith<$R, Coord, Coord> get c2 =>
      $value.c2.copyWith.$chain((v) => call(c2: v));
  @override
  $R call({Coord? c1, Coord? c2}) => $apply(
      FieldCopyWithData({if (c1 != null) #c1: c1, if (c2 != null) #c2: c2}));
  @override
  Side $make(CopyWithData data) =>
      Side(data.get(#c1, or: $value.c1), data.get(#c2, or: $value.c2));

  @override
  SideCopyWith<$R2, Side, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _SideCopyWithImpl($value, $cast, t);
}
