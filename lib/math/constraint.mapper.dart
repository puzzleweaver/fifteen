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
      CoincidentBoardConstraintMapper.ensureInitialized();
      EquidistantBoardConstraintMapper.ensureInitialized();
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
      CoincidentBoardConstraintCopyWith<$R, CoincidentBoardConstraint,
          CoincidentBoardConstraint>> get coincidents;
  ListCopyWith<
      $R,
      EquidistantBoardConstraint,
      EquidistantBoardConstraintCopyWith<$R, EquidistantBoardConstraint,
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
      CoincidentBoardConstraintCopyWith<$R, CoincidentBoardConstraint,
          CoincidentBoardConstraint>> get coincidents => ListCopyWith(
      $value.coincidents,
      (v, t) => v.copyWith.$chain(t),
      (v) => call(coincidents: v));
  @override
  ListCopyWith<
      $R,
      EquidistantBoardConstraint,
      EquidistantBoardConstraintCopyWith<$R, EquidistantBoardConstraint,
          EquidistantBoardConstraint>> get equidistants => ListCopyWith(
      $value.equidistants,
      (v, t) => v.copyWith.$chain(t),
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

class CoincidentBoardConstraintMapper
    extends ClassMapperBase<CoincidentBoardConstraint> {
  CoincidentBoardConstraintMapper._();

  static CoincidentBoardConstraintMapper? _instance;
  static CoincidentBoardConstraintMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = CoincidentBoardConstraintMapper._());
      CoordMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'CoincidentBoardConstraint';

  static Set<Coord> _$coords(CoincidentBoardConstraint v) => v.coords;
  static const Field<CoincidentBoardConstraint, Set<Coord>> _f$coords =
      Field('coords', _$coords, opt: true);

  @override
  final MappableFields<CoincidentBoardConstraint> fields = const {
    #coords: _f$coords,
  };

  static CoincidentBoardConstraint _instantiate(DecodingData data) {
    return CoincidentBoardConstraint(coords: data.dec(_f$coords));
  }

  @override
  final Function instantiate = _instantiate;

  static CoincidentBoardConstraint fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CoincidentBoardConstraint>(map);
  }

  static CoincidentBoardConstraint fromJson(String json) {
    return ensureInitialized().decodeJson<CoincidentBoardConstraint>(json);
  }
}

mixin CoincidentBoardConstraintMappable {
  String toJson() {
    return CoincidentBoardConstraintMapper.ensureInitialized()
        .encodeJson<CoincidentBoardConstraint>(
            this as CoincidentBoardConstraint);
  }

  Map<String, dynamic> toMap() {
    return CoincidentBoardConstraintMapper.ensureInitialized()
        .encodeMap<CoincidentBoardConstraint>(
            this as CoincidentBoardConstraint);
  }

  CoincidentBoardConstraintCopyWith<CoincidentBoardConstraint,
          CoincidentBoardConstraint, CoincidentBoardConstraint>
      get copyWith => _CoincidentBoardConstraintCopyWithImpl(
          this as CoincidentBoardConstraint, $identity, $identity);
  @override
  String toString() {
    return CoincidentBoardConstraintMapper.ensureInitialized()
        .stringifyValue(this as CoincidentBoardConstraint);
  }

  @override
  bool operator ==(Object other) {
    return CoincidentBoardConstraintMapper.ensureInitialized()
        .equalsValue(this as CoincidentBoardConstraint, other);
  }

  @override
  int get hashCode {
    return CoincidentBoardConstraintMapper.ensureInitialized()
        .hashValue(this as CoincidentBoardConstraint);
  }
}

extension CoincidentBoardConstraintValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CoincidentBoardConstraint, $Out> {
  CoincidentBoardConstraintCopyWith<$R, CoincidentBoardConstraint, $Out>
      get $asCoincidentBoardConstraint => $base
          .as((v, t, t2) => _CoincidentBoardConstraintCopyWithImpl(v, t, t2));
}

abstract class CoincidentBoardConstraintCopyWith<
    $R,
    $In extends CoincidentBoardConstraint,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({Set<Coord>? coords});
  CoincidentBoardConstraintCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _CoincidentBoardConstraintCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CoincidentBoardConstraint, $Out>
    implements
        CoincidentBoardConstraintCopyWith<$R, CoincidentBoardConstraint, $Out> {
  _CoincidentBoardConstraintCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CoincidentBoardConstraint> $mapper =
      CoincidentBoardConstraintMapper.ensureInitialized();
  @override
  $R call({Object? coords = $none}) =>
      $apply(FieldCopyWithData({if (coords != $none) #coords: coords}));
  @override
  CoincidentBoardConstraint $make(CopyWithData data) =>
      CoincidentBoardConstraint(coords: data.get(#coords, or: $value.coords));

  @override
  CoincidentBoardConstraintCopyWith<$R2, CoincidentBoardConstraint, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _CoincidentBoardConstraintCopyWithImpl($value, $cast, t);
}

class EquidistantBoardConstraintMapper
    extends ClassMapperBase<EquidistantBoardConstraint> {
  EquidistantBoardConstraintMapper._();

  static EquidistantBoardConstraintMapper? _instance;
  static EquidistantBoardConstraintMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = EquidistantBoardConstraintMapper._());
      SideMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'EquidistantBoardConstraint';

  static Set<Side> _$sides(EquidistantBoardConstraint v) => v.sides;
  static const Field<EquidistantBoardConstraint, Set<Side>> _f$sides =
      Field('sides', _$sides);

  @override
  final MappableFields<EquidistantBoardConstraint> fields = const {
    #sides: _f$sides,
  };

  static EquidistantBoardConstraint _instantiate(DecodingData data) {
    return EquidistantBoardConstraint(sides: data.dec(_f$sides));
  }

  @override
  final Function instantiate = _instantiate;

  static EquidistantBoardConstraint fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<EquidistantBoardConstraint>(map);
  }

  static EquidistantBoardConstraint fromJson(String json) {
    return ensureInitialized().decodeJson<EquidistantBoardConstraint>(json);
  }
}

mixin EquidistantBoardConstraintMappable {
  String toJson() {
    return EquidistantBoardConstraintMapper.ensureInitialized()
        .encodeJson<EquidistantBoardConstraint>(
            this as EquidistantBoardConstraint);
  }

  Map<String, dynamic> toMap() {
    return EquidistantBoardConstraintMapper.ensureInitialized()
        .encodeMap<EquidistantBoardConstraint>(
            this as EquidistantBoardConstraint);
  }

  EquidistantBoardConstraintCopyWith<EquidistantBoardConstraint,
          EquidistantBoardConstraint, EquidistantBoardConstraint>
      get copyWith => _EquidistantBoardConstraintCopyWithImpl(
          this as EquidistantBoardConstraint, $identity, $identity);
  @override
  String toString() {
    return EquidistantBoardConstraintMapper.ensureInitialized()
        .stringifyValue(this as EquidistantBoardConstraint);
  }

  @override
  bool operator ==(Object other) {
    return EquidistantBoardConstraintMapper.ensureInitialized()
        .equalsValue(this as EquidistantBoardConstraint, other);
  }

  @override
  int get hashCode {
    return EquidistantBoardConstraintMapper.ensureInitialized()
        .hashValue(this as EquidistantBoardConstraint);
  }
}

extension EquidistantBoardConstraintValueCopy<$R, $Out>
    on ObjectCopyWith<$R, EquidistantBoardConstraint, $Out> {
  EquidistantBoardConstraintCopyWith<$R, EquidistantBoardConstraint, $Out>
      get $asEquidistantBoardConstraint => $base
          .as((v, t, t2) => _EquidistantBoardConstraintCopyWithImpl(v, t, t2));
}

abstract class EquidistantBoardConstraintCopyWith<
    $R,
    $In extends EquidistantBoardConstraint,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({Set<Side>? sides});
  EquidistantBoardConstraintCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _EquidistantBoardConstraintCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, EquidistantBoardConstraint, $Out>
    implements
        EquidistantBoardConstraintCopyWith<$R, EquidistantBoardConstraint,
            $Out> {
  _EquidistantBoardConstraintCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<EquidistantBoardConstraint> $mapper =
      EquidistantBoardConstraintMapper.ensureInitialized();
  @override
  $R call({Set<Side>? sides}) =>
      $apply(FieldCopyWithData({if (sides != null) #sides: sides}));
  @override
  EquidistantBoardConstraint $make(CopyWithData data) =>
      EquidistantBoardConstraint(sides: data.get(#sides, or: $value.sides));

  @override
  EquidistantBoardConstraintCopyWith<$R2, EquidistantBoardConstraint, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _EquidistantBoardConstraintCopyWithImpl($value, $cast, t);
}
