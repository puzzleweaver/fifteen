// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'connection.dart';

class ConnectionMapper extends ClassMapperBase<Connection> {
  ConnectionMapper._();

  static ConnectionMapper? _instance;
  static ConnectionMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ConnectionMapper._());
      IntPointMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Connection';

  static int _$fromA(Connection v) => v.fromA;
  static const Field<Connection, int> _f$fromA = Field('fromA', _$fromA);
  static int _$toA(Connection v) => v.toA;
  static const Field<Connection, int> _f$toA = Field('toA', _$toA);
  static IntPoint _$_rot(Connection v) => v._rot;
  static const Field<Connection, IntPoint> _f$_rot =
      Field('_rot', _$_rot, key: 'rot');
  static IntPoint _$_trans(Connection v) => v._trans;
  static const Field<Connection, IntPoint> _f$_trans =
      Field('_trans', _$_trans, key: 'trans');

  @override
  final MappableFields<Connection> fields = const {
    #fromA: _f$fromA,
    #toA: _f$toA,
    #_rot: _f$_rot,
    #_trans: _f$_trans,
  };

  static Connection _instantiate(DecodingData data) {
    return Connection(
        fromA: data.dec(_f$fromA),
        toA: data.dec(_f$toA),
        rot: data.dec(_f$_rot),
        trans: data.dec(_f$_trans));
  }

  @override
  final Function instantiate = _instantiate;

  static Connection fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Connection>(map);
  }

  static Connection fromJson(String json) {
    return ensureInitialized().decodeJson<Connection>(json);
  }
}

mixin ConnectionMappable {
  String toJson() {
    return ConnectionMapper.ensureInitialized()
        .encodeJson<Connection>(this as Connection);
  }

  Map<String, dynamic> toMap() {
    return ConnectionMapper.ensureInitialized()
        .encodeMap<Connection>(this as Connection);
  }

  ConnectionCopyWith<Connection, Connection, Connection> get copyWith =>
      _ConnectionCopyWithImpl(this as Connection, $identity, $identity);
  @override
  String toString() {
    return ConnectionMapper.ensureInitialized()
        .stringifyValue(this as Connection);
  }

  @override
  bool operator ==(Object other) {
    return ConnectionMapper.ensureInitialized()
        .equalsValue(this as Connection, other);
  }

  @override
  int get hashCode {
    return ConnectionMapper.ensureInitialized().hashValue(this as Connection);
  }
}

extension ConnectionValueCopy<$R, $Out>
    on ObjectCopyWith<$R, Connection, $Out> {
  ConnectionCopyWith<$R, Connection, $Out> get $asConnection =>
      $base.as((v, t, t2) => _ConnectionCopyWithImpl(v, t, t2));
}

abstract class ConnectionCopyWith<$R, $In extends Connection, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  IntPointCopyWith<$R, IntPoint, IntPoint> get _rot;
  IntPointCopyWith<$R, IntPoint, IntPoint> get _trans;
  $R call({int? fromA, int? toA, IntPoint? rot, IntPoint? trans});
  ConnectionCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ConnectionCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Connection, $Out>
    implements ConnectionCopyWith<$R, Connection, $Out> {
  _ConnectionCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Connection> $mapper =
      ConnectionMapper.ensureInitialized();
  @override
  IntPointCopyWith<$R, IntPoint, IntPoint> get _rot =>
      $value._rot.copyWith.$chain((v) => call(rot: v));
  @override
  IntPointCopyWith<$R, IntPoint, IntPoint> get _trans =>
      $value._trans.copyWith.$chain((v) => call(trans: v));
  @override
  $R call({int? fromA, int? toA, IntPoint? rot, IntPoint? trans}) =>
      $apply(FieldCopyWithData({
        if (fromA != null) #fromA: fromA,
        if (toA != null) #toA: toA,
        if (rot != null) #rot: rot,
        if (trans != null) #trans: trans
      }));
  @override
  Connection $make(CopyWithData data) => Connection(
      fromA: data.get(#fromA, or: $value.fromA),
      toA: data.get(#toA, or: $value.toA),
      rot: data.get(#rot, or: $value._rot),
      trans: data.get(#trans, or: $value._trans));

  @override
  ConnectionCopyWith<$R2, Connection, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ConnectionCopyWithImpl($value, $cast, t);
}
