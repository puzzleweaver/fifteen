// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'quad.dart';

class QuadMapper extends ClassMapperBase<Quad> {
  QuadMapper._();

  static QuadMapper? _instance;
  static QuadMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = QuadMapper._());
      DoublePointMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Quad';

  static DoublePoint _$p1(Quad v) => v.p1;
  static const Field<Quad, DoublePoint> _f$p1 = Field('p1', _$p1);
  static DoublePoint _$p2(Quad v) => v.p2;
  static const Field<Quad, DoublePoint> _f$p2 = Field('p2', _$p2);
  static DoublePoint _$p3(Quad v) => v.p3;
  static const Field<Quad, DoublePoint> _f$p3 = Field('p3', _$p3);
  static DoublePoint _$p4(Quad v) => v.p4;
  static const Field<Quad, DoublePoint> _f$p4 = Field('p4', _$p4);

  @override
  final MappableFields<Quad> fields = const {
    #p1: _f$p1,
    #p2: _f$p2,
    #p3: _f$p3,
    #p4: _f$p4,
  };

  static Quad _instantiate(DecodingData data) {
    return Quad(
        data.dec(_f$p1), data.dec(_f$p2), data.dec(_f$p3), data.dec(_f$p4));
  }

  @override
  final Function instantiate = _instantiate;

  static Quad fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Quad>(map);
  }

  static Quad fromJson(String json) {
    return ensureInitialized().decodeJson<Quad>(json);
  }
}

mixin QuadMappable {
  String toJson() {
    return QuadMapper.ensureInitialized().encodeJson<Quad>(this as Quad);
  }

  Map<String, dynamic> toMap() {
    return QuadMapper.ensureInitialized().encodeMap<Quad>(this as Quad);
  }

  QuadCopyWith<Quad, Quad, Quad> get copyWith =>
      _QuadCopyWithImpl(this as Quad, $identity, $identity);
  @override
  String toString() {
    return QuadMapper.ensureInitialized().stringifyValue(this as Quad);
  }

  @override
  bool operator ==(Object other) {
    return QuadMapper.ensureInitialized().equalsValue(this as Quad, other);
  }

  @override
  int get hashCode {
    return QuadMapper.ensureInitialized().hashValue(this as Quad);
  }
}

extension QuadValueCopy<$R, $Out> on ObjectCopyWith<$R, Quad, $Out> {
  QuadCopyWith<$R, Quad, $Out> get $asQuad =>
      $base.as((v, t, t2) => _QuadCopyWithImpl(v, t, t2));
}

abstract class QuadCopyWith<$R, $In extends Quad, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  DoublePointCopyWith<$R, DoublePoint, DoublePoint> get p1;
  DoublePointCopyWith<$R, DoublePoint, DoublePoint> get p2;
  DoublePointCopyWith<$R, DoublePoint, DoublePoint> get p3;
  DoublePointCopyWith<$R, DoublePoint, DoublePoint> get p4;
  $R call({DoublePoint? p1, DoublePoint? p2, DoublePoint? p3, DoublePoint? p4});
  QuadCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _QuadCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Quad, $Out>
    implements QuadCopyWith<$R, Quad, $Out> {
  _QuadCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Quad> $mapper = QuadMapper.ensureInitialized();
  @override
  DoublePointCopyWith<$R, DoublePoint, DoublePoint> get p1 =>
      $value.p1.copyWith.$chain((v) => call(p1: v));
  @override
  DoublePointCopyWith<$R, DoublePoint, DoublePoint> get p2 =>
      $value.p2.copyWith.$chain((v) => call(p2: v));
  @override
  DoublePointCopyWith<$R, DoublePoint, DoublePoint> get p3 =>
      $value.p3.copyWith.$chain((v) => call(p3: v));
  @override
  DoublePointCopyWith<$R, DoublePoint, DoublePoint> get p4 =>
      $value.p4.copyWith.$chain((v) => call(p4: v));
  @override
  $R call(
          {DoublePoint? p1,
          DoublePoint? p2,
          DoublePoint? p3,
          DoublePoint? p4}) =>
      $apply(FieldCopyWithData({
        if (p1 != null) #p1: p1,
        if (p2 != null) #p2: p2,
        if (p3 != null) #p3: p3,
        if (p4 != null) #p4: p4
      }));
  @override
  Quad $make(CopyWithData data) => Quad(
      data.get(#p1, or: $value.p1),
      data.get(#p2, or: $value.p2),
      data.get(#p3, or: $value.p3),
      data.get(#p4, or: $value.p4));

  @override
  QuadCopyWith<$R2, Quad, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _QuadCopyWithImpl($value, $cast, t);
}
