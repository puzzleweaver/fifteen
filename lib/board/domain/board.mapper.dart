// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'board.dart';

class BoardMapper extends ClassMapperBase<Board> {
  BoardMapper._();

  static BoardMapper? _instance;
  static BoardMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BoardMapper._());
      ChartMapper.ensureInitialized();
      ConnectionMapper.ensureInitialized();
      ConstraintSetMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Board';

  static String _$id(Board v) => v.id;
  static const Field<Board, String> _f$id = Field('id', _$id);
  static String _$name(Board v) => v.name;
  static const Field<Board, String> _f$name = Field('name', _$name);
  static List<Chart> _$charts(Board v) => v.charts;
  static const Field<Board, List<Chart>> _f$charts = Field('charts', _$charts);
  static List<Connection> _$connections(Board v) => v.connections;
  static const Field<Board, List<Connection>> _f$connections =
      Field('connections', _$connections);
  static ConstraintSet _$constraints(Board v) => v.constraints;
  static const Field<Board, ConstraintSet> _f$constraints =
      Field('constraints', _$constraints);

  @override
  final MappableFields<Board> fields = const {
    #id: _f$id,
    #name: _f$name,
    #charts: _f$charts,
    #connections: _f$connections,
    #constraints: _f$constraints,
  };

  static Board _instantiate(DecodingData data) {
    return Board(
        id: data.dec(_f$id),
        name: data.dec(_f$name),
        charts: data.dec(_f$charts),
        connections: data.dec(_f$connections),
        constraints: data.dec(_f$constraints));
  }

  @override
  final Function instantiate = _instantiate;

  static Board fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Board>(map);
  }

  static Board fromJson(String json) {
    return ensureInitialized().decodeJson<Board>(json);
  }
}

mixin BoardMappable {
  String toJson() {
    return BoardMapper.ensureInitialized().encodeJson<Board>(this as Board);
  }

  Map<String, dynamic> toMap() {
    return BoardMapper.ensureInitialized().encodeMap<Board>(this as Board);
  }

  BoardCopyWith<Board, Board, Board> get copyWith =>
      _BoardCopyWithImpl(this as Board, $identity, $identity);
  @override
  String toString() {
    return BoardMapper.ensureInitialized().stringifyValue(this as Board);
  }

  @override
  bool operator ==(Object other) {
    return BoardMapper.ensureInitialized().equalsValue(this as Board, other);
  }

  @override
  int get hashCode {
    return BoardMapper.ensureInitialized().hashValue(this as Board);
  }
}

extension BoardValueCopy<$R, $Out> on ObjectCopyWith<$R, Board, $Out> {
  BoardCopyWith<$R, Board, $Out> get $asBoard =>
      $base.as((v, t, t2) => _BoardCopyWithImpl(v, t, t2));
}

abstract class BoardCopyWith<$R, $In extends Board, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, Chart, ChartCopyWith<$R, Chart, Chart>> get charts;
  ListCopyWith<$R, Connection, ConnectionCopyWith<$R, Connection, Connection>>
      get connections;
  ConstraintSetCopyWith<$R, ConstraintSet, ConstraintSet> get constraints;
  $R call(
      {String? id,
      String? name,
      List<Chart>? charts,
      List<Connection>? connections,
      ConstraintSet? constraints});
  BoardCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _BoardCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Board, $Out>
    implements BoardCopyWith<$R, Board, $Out> {
  _BoardCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Board> $mapper = BoardMapper.ensureInitialized();
  @override
  ListCopyWith<$R, Chart, ChartCopyWith<$R, Chart, Chart>> get charts =>
      ListCopyWith($value.charts, (v, t) => v.copyWith.$chain(t),
          (v) => call(charts: v));
  @override
  ListCopyWith<$R, Connection, ConnectionCopyWith<$R, Connection, Connection>>
      get connections => ListCopyWith($value.connections,
          (v, t) => v.copyWith.$chain(t), (v) => call(connections: v));
  @override
  ConstraintSetCopyWith<$R, ConstraintSet, ConstraintSet> get constraints =>
      $value.constraints.copyWith.$chain((v) => call(constraints: v));
  @override
  $R call(
          {String? id,
          String? name,
          List<Chart>? charts,
          List<Connection>? connections,
          ConstraintSet? constraints}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (name != null) #name: name,
        if (charts != null) #charts: charts,
        if (connections != null) #connections: connections,
        if (constraints != null) #constraints: constraints
      }));
  @override
  Board $make(CopyWithData data) => Board(
      id: data.get(#id, or: $value.id),
      name: data.get(#name, or: $value.name),
      charts: data.get(#charts, or: $value.charts),
      connections: data.get(#connections, or: $value.connections),
      constraints: data.get(#constraints, or: $value.constraints));

  @override
  BoardCopyWith<$R2, Board, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _BoardCopyWithImpl($value, $cast, t);
}
