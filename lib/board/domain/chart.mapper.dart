// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'chart.dart';

class ChartMapper extends ClassMapperBase<Chart> {
  ChartMapper._();

  static ChartMapper? _instance;
  static ChartMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ChartMapper._());
      QuadMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Chart';

  static int _$n(Chart v) => v.n;
  static const Field<Chart, int> _f$n = Field('n', _$n);
  static int _$m(Chart v) => v.m;
  static const Field<Chart, int> _f$m = Field('m', _$m);
  static Quad _$quad(Chart v) => v.quad;
  static const Field<Chart, Quad> _f$quad = Field('quad', _$quad);

  @override
  final MappableFields<Chart> fields = const {
    #n: _f$n,
    #m: _f$m,
    #quad: _f$quad,
  };

  static Chart _instantiate(DecodingData data) {
    return Chart(n: data.dec(_f$n), m: data.dec(_f$m), quad: data.dec(_f$quad));
  }

  @override
  final Function instantiate = _instantiate;

  static Chart fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Chart>(map);
  }

  static Chart fromJson(String json) {
    return ensureInitialized().decodeJson<Chart>(json);
  }
}

mixin ChartMappable {
  String toJson() {
    return ChartMapper.ensureInitialized().encodeJson<Chart>(this as Chart);
  }

  Map<String, dynamic> toMap() {
    return ChartMapper.ensureInitialized().encodeMap<Chart>(this as Chart);
  }

  ChartCopyWith<Chart, Chart, Chart> get copyWith =>
      _ChartCopyWithImpl(this as Chart, $identity, $identity);
  @override
  String toString() {
    return ChartMapper.ensureInitialized().stringifyValue(this as Chart);
  }

  @override
  bool operator ==(Object other) {
    return ChartMapper.ensureInitialized().equalsValue(this as Chart, other);
  }

  @override
  int get hashCode {
    return ChartMapper.ensureInitialized().hashValue(this as Chart);
  }
}

extension ChartValueCopy<$R, $Out> on ObjectCopyWith<$R, Chart, $Out> {
  ChartCopyWith<$R, Chart, $Out> get $asChart =>
      $base.as((v, t, t2) => _ChartCopyWithImpl(v, t, t2));
}

abstract class ChartCopyWith<$R, $In extends Chart, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  QuadCopyWith<$R, Quad, Quad> get quad;
  $R call({int? n, int? m, Quad? quad});
  ChartCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ChartCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Chart, $Out>
    implements ChartCopyWith<$R, Chart, $Out> {
  _ChartCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Chart> $mapper = ChartMapper.ensureInitialized();
  @override
  QuadCopyWith<$R, Quad, Quad> get quad =>
      $value.quad.copyWith.$chain((v) => call(quad: v));
  @override
  $R call({int? n, int? m, Quad? quad}) => $apply(FieldCopyWithData({
        if (n != null) #n: n,
        if (m != null) #m: m,
        if (quad != null) #quad: quad
      }));
  @override
  Chart $make(CopyWithData data) => Chart(
      n: data.get(#n, or: $value.n),
      m: data.get(#m, or: $value.m),
      quad: data.get(#quad, or: $value.quad));

  @override
  ChartCopyWith<$R2, Chart, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ChartCopyWithImpl($value, $cast, t);
}
