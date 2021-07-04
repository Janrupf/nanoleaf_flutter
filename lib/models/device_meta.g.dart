// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_meta.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DeviceMeta> _$deviceMetaSerializer = new _$DeviceMetaSerializer();

class _$DeviceMetaSerializer implements StructuredSerializer<DeviceMeta> {
  @override
  final Iterable<Type> types = const [DeviceMeta, _$DeviceMeta];
  @override
  final String wireName = 'DeviceMeta';

  @override
  Iterable<Object?> serialize(Serializers serializers, DeviceMeta object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id,
          specifiedType: const FullType(NanoleafId)),
      'address',
      serializers.serialize(object.address,
          specifiedType: const FullType(InternetAddress)),
      'port',
      serializers.serialize(object.port, specifiedType: const FullType(int)),
      'token',
      serializers.serialize(object.token,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  DeviceMeta deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DeviceMetaBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(NanoleafId)) as NanoleafId;
          break;
        case 'address':
          result.address = serializers.deserialize(value,
                  specifiedType: const FullType(InternetAddress))
              as InternetAddress;
          break;
        case 'port':
          result.port = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'token':
          result.token = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$DeviceMeta extends DeviceMeta {
  @override
  final String name;
  @override
  final NanoleafId id;
  @override
  final InternetAddress address;
  @override
  final int port;
  @override
  final String token;

  factory _$DeviceMeta([void Function(DeviceMetaBuilder)? updates]) =>
      (new DeviceMetaBuilder()..update(updates)).build();

  _$DeviceMeta._(
      {required this.name,
      required this.id,
      required this.address,
      required this.port,
      required this.token})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, 'DeviceMeta', 'name');
    BuiltValueNullFieldError.checkNotNull(id, 'DeviceMeta', 'id');
    BuiltValueNullFieldError.checkNotNull(address, 'DeviceMeta', 'address');
    BuiltValueNullFieldError.checkNotNull(port, 'DeviceMeta', 'port');
    BuiltValueNullFieldError.checkNotNull(token, 'DeviceMeta', 'token');
  }

  @override
  DeviceMeta rebuild(void Function(DeviceMetaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DeviceMetaBuilder toBuilder() => new DeviceMetaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DeviceMeta &&
        name == other.name &&
        id == other.id &&
        address == other.address &&
        port == other.port &&
        token == other.token;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, name.hashCode), id.hashCode), address.hashCode),
            port.hashCode),
        token.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DeviceMeta')
          ..add('name', name)
          ..add('id', id)
          ..add('address', address)
          ..add('port', port)
          ..add('token', token))
        .toString();
  }
}

class DeviceMetaBuilder implements Builder<DeviceMeta, DeviceMetaBuilder> {
  _$DeviceMeta? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  NanoleafId? _id;
  NanoleafId? get id => _$this._id;
  set id(NanoleafId? id) => _$this._id = id;

  InternetAddress? _address;
  InternetAddress? get address => _$this._address;
  set address(InternetAddress? address) => _$this._address = address;

  int? _port;
  int? get port => _$this._port;
  set port(int? port) => _$this._port = port;

  String? _token;
  String? get token => _$this._token;
  set token(String? token) => _$this._token = token;

  DeviceMetaBuilder();

  DeviceMetaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _id = $v.id;
      _address = $v.address;
      _port = $v.port;
      _token = $v.token;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DeviceMeta other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DeviceMeta;
  }

  @override
  void update(void Function(DeviceMetaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DeviceMeta build() {
    final _$result = _$v ??
        new _$DeviceMeta._(
            name: BuiltValueNullFieldError.checkNotNull(
                name, 'DeviceMeta', 'name'),
            id: BuiltValueNullFieldError.checkNotNull(id, 'DeviceMeta', 'id'),
            address: BuiltValueNullFieldError.checkNotNull(
                address, 'DeviceMeta', 'address'),
            port: BuiltValueNullFieldError.checkNotNull(
                port, 'DeviceMeta', 'port'),
            token: BuiltValueNullFieldError.checkNotNull(
                token, 'DeviceMeta', 'token'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
