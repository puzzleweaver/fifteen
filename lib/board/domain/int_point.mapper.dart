// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'int_point.dart';

class IntPointMapper extends ClassMapperBase<IntPoint> {
  IntPointMapper._();

  static IntPointMapper? _instance;
  static IntPointMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = IntPointMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'IntPoint';

  static int _$x(IntPoint v) => v.x;
  static const Field<IntPoint, int> _f$x = Field('x', _$x);
  static int _$y(IntPoint v) => v.y;
  static const Field<IntPoint, int> _f$y = Field('y', _$y);

  @override
  final MappableFields<IntPoint> fields = const {
    #x: _f$x,
    #y: _f$y,
  };

  static IntPoint _instantiate(DecodingData data) {
    return IntPoint(data.dec(_f$x), data.dec(_f$y));
  }

  @override
  final Function instantiate = _instantiate;

  static IntPoint fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<IntPoint>(map);
  }

  static IntPoint fromJson(String json) {
    return ensureInitialized().decodeJson<IntPoint>(json);
  }
}

mixin IntPointMappable {
  String toJson() {
    return IntPointMapper.ensureInitialized()
        .encodeJson<IntPoint>(this as IntPoint);
  }

  Map<String, dynamic> toMap() {
    return IntPointMapper.ensureInitialized()
        .encodeMap<IntPoint>(this as IntPoint);
  }

  IntPointCopyWith<IntPoint, IntPoint, IntPoint> get copyWith =>
      _IntPointCopyWithImpl(this as IntPoint, $identity, $identity);
  @override
  String toString() {
    return IntPointMapper.ensureInitialized().stringifyValue(this as IntPoint);
  }

  @override
  bool operator ==(Object other) {
    return IntPointMapper.ensureInitialized()
        .equalsValue(this as IntPoint, other);
  }

  @override
  int get hashCode {
    return IntPointMapper.ensureInitialized().hashValue(this as IntPoint);
  }
}

extension IntPointValueCopy<$R, $Out> on ObjectCopyWith<$R, IntPoint, $Out> {
  IntPointCopyWith<$R, IntPoint, $Out> get $asIntPoint =>
      $base.as((v, t, t2) => _IntPointCopyWithImpl(v, t, t2));
}

abstract class IntPointCopyWith<$R, $In extends IntPoint, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? x, int? y});
  IntPointCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _IntPointCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, IntPoint, $Out>
    implements IntPointCopyWith<$R, IntPoint, $Out> {
  _IntPointCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<IntPoint> $mapper =
      IntPointMapper.ensureInitialized();
  @override
  $R call({int? x, int? y}) =>
      $apply(FieldCopyWithData({if (x != null) #x: x, if (y != null) #y: y}));
  @override
  IntPoint $make(CopyWithData data) =>
      IntPoint(data.get(#x, or: $value.x), data.get(#y, or: $value.y));

  @override
  IntPointCopyWith<$R2, IntPoint, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _IntPointCopyWithImpl($value, $cast, t);
}
