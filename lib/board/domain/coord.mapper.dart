// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'coord.dart';

class CoordMapper extends ClassMapperBase<Coord> {
  CoordMapper._();

  static CoordMapper? _instance;
  static CoordMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CoordMapper._());
      IntPointMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Coord';

  static int _$a(Coord v) => v.a;
  static const Field<Coord, int> _f$a = Field('a', _$a);
  static IntPoint _$hk(Coord v) => v.hk;
  static const Field<Coord, IntPoint> _f$hk = Field('hk', _$hk);

  @override
  final MappableFields<Coord> fields = const {
    #a: _f$a,
    #hk: _f$hk,
  };

  static Coord _instantiate(DecodingData data) {
    return Coord(data.dec(_f$a), data.dec(_f$hk));
  }

  @override
  final Function instantiate = _instantiate;

  static Coord fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Coord>(map);
  }

  static Coord fromJson(String json) {
    return ensureInitialized().decodeJson<Coord>(json);
  }
}

mixin CoordMappable {
  String toJson() {
    return CoordMapper.ensureInitialized().encodeJson<Coord>(this as Coord);
  }

  Map<String, dynamic> toMap() {
    return CoordMapper.ensureInitialized().encodeMap<Coord>(this as Coord);
  }

  CoordCopyWith<Coord, Coord, Coord> get copyWith =>
      _CoordCopyWithImpl(this as Coord, $identity, $identity);
  @override
  String toString() {
    return CoordMapper.ensureInitialized().stringifyValue(this as Coord);
  }

  @override
  bool operator ==(Object other) {
    return CoordMapper.ensureInitialized().equalsValue(this as Coord, other);
  }

  @override
  int get hashCode {
    return CoordMapper.ensureInitialized().hashValue(this as Coord);
  }
}

extension CoordValueCopy<$R, $Out> on ObjectCopyWith<$R, Coord, $Out> {
  CoordCopyWith<$R, Coord, $Out> get $asCoord =>
      $base.as((v, t, t2) => _CoordCopyWithImpl(v, t, t2));
}

abstract class CoordCopyWith<$R, $In extends Coord, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  IntPointCopyWith<$R, IntPoint, IntPoint> get hk;
  $R call({int? a, IntPoint? hk});
  CoordCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CoordCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Coord, $Out>
    implements CoordCopyWith<$R, Coord, $Out> {
  _CoordCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Coord> $mapper = CoordMapper.ensureInitialized();
  @override
  IntPointCopyWith<$R, IntPoint, IntPoint> get hk =>
      $value.hk.copyWith.$chain((v) => call(hk: v));
  @override
  $R call({int? a, IntPoint? hk}) => $apply(
      FieldCopyWithData({if (a != null) #a: a, if (hk != null) #hk: hk}));
  @override
  Coord $make(CopyWithData data) =>
      Coord(data.get(#a, or: $value.a), data.get(#hk, or: $value.hk));

  @override
  CoordCopyWith<$R2, Coord, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _CoordCopyWithImpl($value, $cast, t);
}
