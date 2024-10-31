// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'constraint.dart';

class ConstraintSetMapper extends ClassMapperBase<ConstraintSet> {
  ConstraintSetMapper._();

  static ConstraintSetMapper? _instance;
  static ConstraintSetMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ConstraintSetMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ConstraintSet';

  static List<CoincidentBoardConstraint> _$coincidents(ConstraintSet v) =>
      v.coincidents;
  static const Field<ConstraintSet, List<CoincidentBoardConstraint>>
      _f$coincidents = Field('coincidents', _$coincidents);
  static List<EquidistantBoardConstraint> _$equidistants(ConstraintSet v) =>
      v.equidistants;
  static const Field<ConstraintSet, List<EquidistantBoardConstraint>>
      _f$equidistants = Field('equidistants', _$equidistants);

  @override
  final MappableFields<ConstraintSet> fields = const {
    #coincidents: _f$coincidents,
    #equidistants: _f$equidistants,
  };

  static ConstraintSet _instantiate(DecodingData data) {
    return ConstraintSet(
        coincidents: data.dec(_f$coincidents),
        equidistants: data.dec(_f$equidistants));
  }

  @override
  final Function instantiate = _instantiate;

  static ConstraintSet fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ConstraintSet>(map);
  }

  static ConstraintSet fromJson(String json) {
    return ensureInitialized().decodeJson<ConstraintSet>(json);
  }
}

mixin ConstraintSetMappable {
  String toJson() {
    return ConstraintSetMapper.ensureInitialized()
        .encodeJson<ConstraintSet>(this as ConstraintSet);
  }

  Map<String, dynamic> toMap() {
    return ConstraintSetMapper.ensureInitialized()
        .encodeMap<ConstraintSet>(this as ConstraintSet);
  }

  ConstraintSetCopyWith<ConstraintSet, ConstraintSet, ConstraintSet>
      get copyWith => _ConstraintSetCopyWithImpl(
          this as ConstraintSet, $identity, $identity);
  @override
  String toString() {
    return ConstraintSetMapper.ensureInitialized()
        .stringifyValue(this as ConstraintSet);
  }

  @override
  bool operator ==(Object other) {
    return ConstraintSetMapper.ensureInitialized()
        .equalsValue(this as ConstraintSet, other);
  }

  @override
  int get hashCode {
    return ConstraintSetMapper.ensureInitialized()
        .hashValue(this as ConstraintSet);
  }
}

extension ConstraintSetValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ConstraintSet, $Out> {
  ConstraintSetCopyWith<$R, ConstraintSet, $Out> get $asConstraintSet =>
      $base.as((v, t, t2) => _ConstraintSetCopyWithImpl(v, t, t2));
}

abstract class ConstraintSetCopyWith<$R, $In extends ConstraintSet, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
      $R,
      CoincidentBoardConstraint,
      ObjectCopyWith<$R, CoincidentBoardConstraint,
          CoincidentBoardConstraint>> get coincidents;
  ListCopyWith<
      $R,
      EquidistantBoardConstraint,
      ObjectCopyWith<$R, EquidistantBoardConstraint,
          EquidistantBoardConstraint>> get equidistants;
  $R call(
      {List<CoincidentBoardConstraint>? coincidents,
      List<EquidistantBoardConstraint>? equidistants});
  ConstraintSetCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ConstraintSetCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ConstraintSet, $Out>
    implements ConstraintSetCopyWith<$R, ConstraintSet, $Out> {
  _ConstraintSetCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ConstraintSet> $mapper =
      ConstraintSetMapper.ensureInitialized();
  @override
  ListCopyWith<
      $R,
      CoincidentBoardConstraint,
      ObjectCopyWith<$R, CoincidentBoardConstraint,
          CoincidentBoardConstraint>> get coincidents => ListCopyWith(
      $value.coincidents,
      (v, t) => ObjectCopyWith(v, $identity, t),
      (v) => call(coincidents: v));
  @override
  ListCopyWith<
      $R,
      EquidistantBoardConstraint,
      ObjectCopyWith<$R, EquidistantBoardConstraint,
          EquidistantBoardConstraint>> get equidistants => ListCopyWith(
      $value.equidistants,
      (v, t) => ObjectCopyWith(v, $identity, t),
      (v) => call(equidistants: v));
  @override
  $R call(
          {List<CoincidentBoardConstraint>? coincidents,
          List<EquidistantBoardConstraint>? equidistants}) =>
      $apply(FieldCopyWithData({
        if (coincidents != null) #coincidents: coincidents,
        if (equidistants != null) #equidistants: equidistants
      }));
  @override
  ConstraintSet $make(CopyWithData data) => ConstraintSet(
      coincidents: data.get(#coincidents, or: $value.coincidents),
      equidistants: data.get(#equidistants, or: $value.equidistants));

  @override
  ConstraintSetCopyWith<$R2, ConstraintSet, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ConstraintSetCopyWithImpl($value, $cast, t);
}
