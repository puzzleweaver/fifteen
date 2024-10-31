// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'double_point.dart';

class DoublePointMapper extends ClassMapperBase<DoublePoint> {
  DoublePointMapper._();

  static DoublePointMapper? _instance;
  static DoublePointMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DoublePointMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'DoublePoint';

  static double _$x(DoublePoint v) => v.x;
  static const Field<DoublePoint, double> _f$x = Field('x', _$x);
  static double _$y(DoublePoint v) => v.y;
  static const Field<DoublePoint, double> _f$y = Field('y', _$y);

  @override
  final MappableFields<DoublePoint> fields = const {
    #x: _f$x,
    #y: _f$y,
  };

  static DoublePoint _instantiate(DecodingData data) {
    return DoublePoint(data.dec(_f$x), data.dec(_f$y));
  }

  @override
  final Function instantiate = _instantiate;

  static DoublePoint fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<DoublePoint>(map);
  }

  static DoublePoint fromJson(String json) {
    return ensureInitialized().decodeJson<DoublePoint>(json);
  }
}

mixin DoublePointMappable {
  String toJson() {
    return DoublePointMapper.ensureInitialized()
        .encodeJson<DoublePoint>(this as DoublePoint);
  }

  Map<String, dynamic> toMap() {
    return DoublePointMapper.ensureInitialized()
        .encodeMap<DoublePoint>(this as DoublePoint);
  }

  DoublePointCopyWith<DoublePoint, DoublePoint, DoublePoint> get copyWith =>
      _DoublePointCopyWithImpl(this as DoublePoint, $identity, $identity);
  @override
  String toString() {
    return DoublePointMapper.ensureInitialized()
        .stringifyValue(this as DoublePoint);
  }

  @override
  bool operator ==(Object other) {
    return DoublePointMapper.ensureInitialized()
        .equalsValue(this as DoublePoint, other);
  }

  @override
  int get hashCode {
    return DoublePointMapper.ensureInitialized().hashValue(this as DoublePoint);
  }
}

extension DoublePointValueCopy<$R, $Out>
    on ObjectCopyWith<$R, DoublePoint, $Out> {
  DoublePointCopyWith<$R, DoublePoint, $Out> get $asDoublePoint =>
      $base.as((v, t, t2) => _DoublePointCopyWithImpl(v, t, t2));
}

abstract class DoublePointCopyWith<$R, $In extends DoublePoint, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({double? x, double? y});
  DoublePointCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _DoublePointCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, DoublePoint, $Out>
    implements DoublePointCopyWith<$R, DoublePoint, $Out> {
  _DoublePointCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<DoublePoint> $mapper =
      DoublePointMapper.ensureInitialized();
  @override
  $R call({double? x, double? y}) =>
      $apply(FieldCopyWithData({if (x != null) #x: x, if (y != null) #y: y}));
  @override
  DoublePoint $make(CopyWithData data) =>
      DoublePoint(data.get(#x, or: $value.x), data.get(#y, or: $value.y));

  @override
  DoublePointCopyWith<$R2, DoublePoint, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _DoublePointCopyWithImpl($value, $cast, t);
}
