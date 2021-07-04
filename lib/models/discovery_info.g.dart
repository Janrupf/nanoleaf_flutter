// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discovery_info.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DiscoveryInfo> _$discoveryInfoSerializer =
    new _$DiscoveryInfoSerializer();

class _$DiscoveryInfoSerializer implements StructuredSerializer<DiscoveryInfo> {
  @override
  final Iterable<Type> types = const [DiscoveryInfo, _$DiscoveryInfo];
  @override
  final String wireName = 'DiscoveryInfo';

  @override
  Iterable<Object?> serialize(Serializers serializers, DiscoveryInfo object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ipv4',
      serializers.serialize(object.ipv4,
          specifiedType: const FullType(AddressWithPort)),
      'ipv6',
      serializers.serialize(object.ipv6,
          specifiedType: const FullType(AddressWithPort)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'md',
      serializers.serialize(object.model,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id,
          specifiedType: const FullType(NanoleafId)),
      'c#',
      serializers.serialize(object.cSharp, specifiedType: const FullType(int)),
      's#',
      serializers.serialize(object.getsSharp,
          specifiedType: const FullType(int)),
      'ff',
      serializers.serialize(object.ff, specifiedType: const FullType(int)),
      'sf',
      serializers.serialize(object.sf, specifiedType: const FullType(int)),
      'ci',
      serializers.serialize(object.ci, specifiedType: const FullType(int)),
      'srcvers',
      serializers.serialize(object.firmwareVersion,
          specifiedType: const FullType(Version)),
      'sh',
      serializers.serialize(object.sh, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  DiscoveryInfo deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DiscoveryInfoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ipv4':
          result.ipv4.replace(serializers.deserialize(value,
                  specifiedType: const FullType(AddressWithPort))!
              as AddressWithPort);
          break;
        case 'ipv6':
          result.ipv6.replace(serializers.deserialize(value,
                  specifiedType: const FullType(AddressWithPort))!
              as AddressWithPort);
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'md':
          result.model = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(NanoleafId)) as NanoleafId;
          break;
        case 'c#':
          result.cSharp = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 's#':
          result.getsSharp = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'ff':
          result.ff = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'sf':
          result.sf = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'ci':
          result.ci = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'srcvers':
          result.firmwareVersion = serializers.deserialize(value,
              specifiedType: const FullType(Version)) as Version;
          break;
        case 'sh':
          result.sh = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$DiscoveryInfo extends DiscoveryInfo {
  @override
  final AddressWithPort ipv4;
  @override
  final AddressWithPort ipv6;
  @override
  final String name;
  @override
  final String model;
  @override
  final NanoleafId id;
  @override
  final int cSharp;
  @override
  final int getsSharp;
  @override
  final int ff;
  @override
  final int sf;
  @override
  final int ci;
  @override
  final Version firmwareVersion;
  @override
  final String sh;

  factory _$DiscoveryInfo([void Function(DiscoveryInfoBuilder)? updates]) =>
      (new DiscoveryInfoBuilder()..update(updates)).build();

  _$DiscoveryInfo._(
      {required this.ipv4,
      required this.ipv6,
      required this.name,
      required this.model,
      required this.id,
      required this.cSharp,
      required this.getsSharp,
      required this.ff,
      required this.sf,
      required this.ci,
      required this.firmwareVersion,
      required this.sh})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(ipv4, 'DiscoveryInfo', 'ipv4');
    BuiltValueNullFieldError.checkNotNull(ipv6, 'DiscoveryInfo', 'ipv6');
    BuiltValueNullFieldError.checkNotNull(name, 'DiscoveryInfo', 'name');
    BuiltValueNullFieldError.checkNotNull(model, 'DiscoveryInfo', 'model');
    BuiltValueNullFieldError.checkNotNull(id, 'DiscoveryInfo', 'id');
    BuiltValueNullFieldError.checkNotNull(cSharp, 'DiscoveryInfo', 'cSharp');
    BuiltValueNullFieldError.checkNotNull(
        getsSharp, 'DiscoveryInfo', 'getsSharp');
    BuiltValueNullFieldError.checkNotNull(ff, 'DiscoveryInfo', 'ff');
    BuiltValueNullFieldError.checkNotNull(sf, 'DiscoveryInfo', 'sf');
    BuiltValueNullFieldError.checkNotNull(ci, 'DiscoveryInfo', 'ci');
    BuiltValueNullFieldError.checkNotNull(
        firmwareVersion, 'DiscoveryInfo', 'firmwareVersion');
    BuiltValueNullFieldError.checkNotNull(sh, 'DiscoveryInfo', 'sh');
  }

  @override
  DiscoveryInfo rebuild(void Function(DiscoveryInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DiscoveryInfoBuilder toBuilder() => new DiscoveryInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DiscoveryInfo &&
        ipv4 == other.ipv4 &&
        ipv6 == other.ipv6 &&
        name == other.name &&
        model == other.model &&
        id == other.id &&
        cSharp == other.cSharp &&
        getsSharp == other.getsSharp &&
        ff == other.ff &&
        sf == other.sf &&
        ci == other.ci &&
        firmwareVersion == other.firmwareVersion &&
        sh == other.sh;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc($jc(0, ipv4.hashCode),
                                                ipv6.hashCode),
                                            name.hashCode),
                                        model.hashCode),
                                    id.hashCode),
                                cSharp.hashCode),
                            getsSharp.hashCode),
                        ff.hashCode),
                    sf.hashCode),
                ci.hashCode),
            firmwareVersion.hashCode),
        sh.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DiscoveryInfo')
          ..add('ipv4', ipv4)
          ..add('ipv6', ipv6)
          ..add('name', name)
          ..add('model', model)
          ..add('id', id)
          ..add('cSharp', cSharp)
          ..add('getsSharp', getsSharp)
          ..add('ff', ff)
          ..add('sf', sf)
          ..add('ci', ci)
          ..add('firmwareVersion', firmwareVersion)
          ..add('sh', sh))
        .toString();
  }
}

class DiscoveryInfoBuilder
    implements Builder<DiscoveryInfo, DiscoveryInfoBuilder> {
  _$DiscoveryInfo? _$v;

  AddressWithPortBuilder? _ipv4;
  AddressWithPortBuilder get ipv4 =>
      _$this._ipv4 ??= new AddressWithPortBuilder();
  set ipv4(AddressWithPortBuilder? ipv4) => _$this._ipv4 = ipv4;

  AddressWithPortBuilder? _ipv6;
  AddressWithPortBuilder get ipv6 =>
      _$this._ipv6 ??= new AddressWithPortBuilder();
  set ipv6(AddressWithPortBuilder? ipv6) => _$this._ipv6 = ipv6;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _model;
  String? get model => _$this._model;
  set model(String? model) => _$this._model = model;

  NanoleafId? _id;
  NanoleafId? get id => _$this._id;
  set id(NanoleafId? id) => _$this._id = id;

  int? _cSharp;
  int? get cSharp => _$this._cSharp;
  set cSharp(int? cSharp) => _$this._cSharp = cSharp;

  int? _getsSharp;
  int? get getsSharp => _$this._getsSharp;
  set getsSharp(int? getsSharp) => _$this._getsSharp = getsSharp;

  int? _ff;
  int? get ff => _$this._ff;
  set ff(int? ff) => _$this._ff = ff;

  int? _sf;
  int? get sf => _$this._sf;
  set sf(int? sf) => _$this._sf = sf;

  int? _ci;
  int? get ci => _$this._ci;
  set ci(int? ci) => _$this._ci = ci;

  Version? _firmwareVersion;
  Version? get firmwareVersion => _$this._firmwareVersion;
  set firmwareVersion(Version? firmwareVersion) =>
      _$this._firmwareVersion = firmwareVersion;

  String? _sh;
  String? get sh => _$this._sh;
  set sh(String? sh) => _$this._sh = sh;

  DiscoveryInfoBuilder();

  DiscoveryInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ipv4 = $v.ipv4.toBuilder();
      _ipv6 = $v.ipv6.toBuilder();
      _name = $v.name;
      _model = $v.model;
      _id = $v.id;
      _cSharp = $v.cSharp;
      _getsSharp = $v.getsSharp;
      _ff = $v.ff;
      _sf = $v.sf;
      _ci = $v.ci;
      _firmwareVersion = $v.firmwareVersion;
      _sh = $v.sh;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DiscoveryInfo other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DiscoveryInfo;
  }

  @override
  void update(void Function(DiscoveryInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DiscoveryInfo build() {
    _$DiscoveryInfo _$result;
    try {
      _$result = _$v ??
          new _$DiscoveryInfo._(
              ipv4: ipv4.build(),
              ipv6: ipv6.build(),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, 'DiscoveryInfo', 'name'),
              model: BuiltValueNullFieldError.checkNotNull(
                  model, 'DiscoveryInfo', 'model'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, 'DiscoveryInfo', 'id'),
              cSharp: BuiltValueNullFieldError.checkNotNull(
                  cSharp, 'DiscoveryInfo', 'cSharp'),
              getsSharp: BuiltValueNullFieldError.checkNotNull(
                  getsSharp, 'DiscoveryInfo', 'getsSharp'),
              ff: BuiltValueNullFieldError.checkNotNull(
                  ff, 'DiscoveryInfo', 'ff'),
              sf: BuiltValueNullFieldError.checkNotNull(
                  sf, 'DiscoveryInfo', 'sf'),
              ci: BuiltValueNullFieldError.checkNotNull(
                  ci, 'DiscoveryInfo', 'ci'),
              firmwareVersion: BuiltValueNullFieldError.checkNotNull(
                  firmwareVersion, 'DiscoveryInfo', 'firmwareVersion'),
              sh: BuiltValueNullFieldError.checkNotNull(
                  sh, 'DiscoveryInfo', 'sh'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ipv4';
        ipv4.build();
        _$failedField = 'ipv6';
        ipv6.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'DiscoveryInfo', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
