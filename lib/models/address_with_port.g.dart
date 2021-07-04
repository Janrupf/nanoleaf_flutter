// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_with_port.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AddressWithPort extends AddressWithPort {
  @override
  final InternetAddress address;
  @override
  final int port;

  factory _$AddressWithPort([void Function(AddressWithPortBuilder)? updates]) =>
      (new AddressWithPortBuilder()..update(updates)).build();

  _$AddressWithPort._({required this.address, required this.port}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        address, 'AddressWithPort', 'address');
    BuiltValueNullFieldError.checkNotNull(port, 'AddressWithPort', 'port');
  }

  @override
  AddressWithPort rebuild(void Function(AddressWithPortBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddressWithPortBuilder toBuilder() =>
      new AddressWithPortBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddressWithPort &&
        address == other.address &&
        port == other.port;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, address.hashCode), port.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AddressWithPort')
          ..add('address', address)
          ..add('port', port))
        .toString();
  }
}

class AddressWithPortBuilder
    implements Builder<AddressWithPort, AddressWithPortBuilder> {
  _$AddressWithPort? _$v;

  InternetAddress? _address;
  InternetAddress? get address => _$this._address;
  set address(InternetAddress? address) => _$this._address = address;

  int? _port;
  int? get port => _$this._port;
  set port(int? port) => _$this._port = port;

  AddressWithPortBuilder();

  AddressWithPortBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _address = $v.address;
      _port = $v.port;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AddressWithPort other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AddressWithPort;
  }

  @override
  void update(void Function(AddressWithPortBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AddressWithPort build() {
    final _$result = _$v ??
        new _$AddressWithPort._(
            address: BuiltValueNullFieldError.checkNotNull(
                address, 'AddressWithPort', 'address'),
            port: BuiltValueNullFieldError.checkNotNull(
                port, 'AddressWithPort', 'port'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
