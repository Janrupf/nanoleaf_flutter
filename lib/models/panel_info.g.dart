// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'panel_info.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PanelInfo> _$panelInfoSerializer = new _$PanelInfoSerializer();
Serializer<DeviceEffects> _$deviceEffectsSerializer =
    new _$DeviceEffectsSerializer();
Serializer<PanelLayout> _$panelLayoutSerializer = new _$PanelLayoutSerializer();
Serializer<LayoutData> _$layoutDataSerializer = new _$LayoutDataSerializer();
Serializer<PositionData> _$positionDataSerializer =
    new _$PositionDataSerializer();
Serializer<ExtendedPositionData> _$extendedPositionDataSerializer =
    new _$ExtendedPositionDataSerializer();
Serializer<RhythmInfo> _$rhythmInfoSerializer = new _$RhythmInfoSerializer();
Serializer<PanelState> _$panelStateSerializer = new _$PanelStateSerializer();
Serializer<PowerState> _$powerStateSerializer = new _$PowerStateSerializer();

class _$PanelInfoSerializer implements StructuredSerializer<PanelInfo> {
  @override
  final Iterable<Type> types = const [PanelInfo, _$PanelInfo];
  @override
  final String wireName = 'PanelInfo';

  @override
  Iterable<Object?> serialize(Serializers serializers, PanelInfo object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'serialNo',
      serializers.serialize(object.serialNumber,
          specifiedType: const FullType(String)),
      'manufacturer',
      serializers.serialize(object.manufacturer,
          specifiedType: const FullType(String)),
      'firmwareVersion',
      serializers.serialize(object.firmwareVersion,
          specifiedType: const FullType(Version)),
      'hardwareVersion',
      serializers.serialize(object.hardwareVersion,
          specifiedType: const FullType(Version)),
      'model',
      serializers.serialize(object.model,
          specifiedType: const FullType(String)),
      'effects',
      serializers.serialize(object.effects,
          specifiedType: const FullType(DeviceEffects)),
      'panelLayout',
      serializers.serialize(object.panelLayout,
          specifiedType: const FullType(PanelLayout)),
      'rhythm',
      serializers.serialize(object.rhythm,
          specifiedType: const FullType(RhythmInfo)),
      'state',
      serializers.serialize(object.state,
          specifiedType: const FullType(PanelState)),
    ];

    return result;
  }

  @override
  PanelInfo deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PanelInfoBuilder();

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
        case 'serialNo':
          result.serialNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'manufacturer':
          result.manufacturer = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'firmwareVersion':
          result.firmwareVersion = serializers.deserialize(value,
              specifiedType: const FullType(Version)) as Version;
          break;
        case 'hardwareVersion':
          result.hardwareVersion = serializers.deserialize(value,
              specifiedType: const FullType(Version)) as Version;
          break;
        case 'model':
          result.model = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'effects':
          result.effects.replace(serializers.deserialize(value,
              specifiedType: const FullType(DeviceEffects))! as DeviceEffects);
          break;
        case 'panelLayout':
          result.panelLayout.replace(serializers.deserialize(value,
              specifiedType: const FullType(PanelLayout))! as PanelLayout);
          break;
        case 'rhythm':
          result.rhythm.replace(serializers.deserialize(value,
              specifiedType: const FullType(RhythmInfo))! as RhythmInfo);
          break;
        case 'state':
          result.state.replace(serializers.deserialize(value,
              specifiedType: const FullType(PanelState))! as PanelState);
          break;
      }
    }

    return result.build();
  }
}

class _$DeviceEffectsSerializer implements StructuredSerializer<DeviceEffects> {
  @override
  final Iterable<Type> types = const [DeviceEffects, _$DeviceEffects];
  @override
  final String wireName = 'DeviceEffects';

  @override
  Iterable<Object?> serialize(Serializers serializers, DeviceEffects object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'select',
      serializers.serialize(object.select,
          specifiedType: const FullType(String)),
      'effectsList',
      serializers.serialize(object.effectsList,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
    ];

    return result;
  }

  @override
  DeviceEffects deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DeviceEffectsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'select':
          result.select = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'effectsList':
          result.effectsList.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$PanelLayoutSerializer implements StructuredSerializer<PanelLayout> {
  @override
  final Iterable<Type> types = const [PanelLayout, _$PanelLayout];
  @override
  final String wireName = 'PanelLayout';

  @override
  Iterable<Object?> serialize(Serializers serializers, PanelLayout object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'globalOrientation',
      serializers.serialize(object.globalOrientation,
          specifiedType: const FullType(IntValueRange)),
      'layout',
      serializers.serialize(object.layout,
          specifiedType: const FullType(LayoutData)),
    ];

    return result;
  }

  @override
  PanelLayout deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PanelLayoutBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'globalOrientation':
          result.globalOrientation.replace(serializers.deserialize(value,
              specifiedType: const FullType(IntValueRange))! as IntValueRange);
          break;
        case 'layout':
          result.layout.replace(serializers.deserialize(value,
              specifiedType: const FullType(LayoutData))! as LayoutData);
          break;
      }
    }

    return result.build();
  }
}

class _$LayoutDataSerializer implements StructuredSerializer<LayoutData> {
  @override
  final Iterable<Type> types = const [LayoutData, _$LayoutData];
  @override
  final String wireName = 'LayoutData';

  @override
  Iterable<Object?> serialize(Serializers serializers, LayoutData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'numPanels',
      serializers.serialize(object.numPanels,
          specifiedType: const FullType(int)),
      'sideLength',
      serializers.serialize(object.sideLength,
          specifiedType: const FullType(int)),
      'positionData',
      serializers.serialize(object.positionData,
          specifiedType: const FullType(
              BuiltList, const [const FullType(ExtendedPositionData)])),
    ];

    return result;
  }

  @override
  LayoutData deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LayoutDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'numPanels':
          result.numPanels = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'sideLength':
          result.sideLength = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'positionData':
          result.positionData.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ExtendedPositionData)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$PositionDataSerializer implements StructuredSerializer<PositionData> {
  @override
  final Iterable<Type> types = const [PositionData, _$PositionData];
  @override
  final String wireName = 'PositionData';

  @override
  Iterable<Object?> serialize(Serializers serializers, PositionData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'x',
      serializers.serialize(object.x, specifiedType: const FullType(int)),
      'y',
      serializers.serialize(object.y, specifiedType: const FullType(int)),
      'o',
      serializers.serialize(object.o, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  PositionData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PositionDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'x':
          result.x = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'y':
          result.y = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'o':
          result.o = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$ExtendedPositionDataSerializer
    implements StructuredSerializer<ExtendedPositionData> {
  @override
  final Iterable<Type> types = const [
    ExtendedPositionData,
    _$ExtendedPositionData
  ];
  @override
  final String wireName = 'ExtendedPositionData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ExtendedPositionData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'x',
      serializers.serialize(object.x, specifiedType: const FullType(int)),
      'y',
      serializers.serialize(object.y, specifiedType: const FullType(int)),
      'o',
      serializers.serialize(object.o, specifiedType: const FullType(int)),
      'panelId',
      serializers.serialize(object.panelId, specifiedType: const FullType(int)),
      'shapeType',
      serializers.serialize(object.shapeType,
          specifiedType: const FullType(ShapeType)),
    ];

    return result;
  }

  @override
  ExtendedPositionData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ExtendedPositionDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'x':
          result.x = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'y':
          result.y = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'o':
          result.o = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'panelId':
          result.panelId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'shapeType':
          result.shapeType = serializers.deserialize(value,
              specifiedType: const FullType(ShapeType)) as ShapeType;
          break;
      }
    }

    return result.build();
  }
}

class _$RhythmInfoSerializer implements StructuredSerializer<RhythmInfo> {
  @override
  final Iterable<Type> types = const [RhythmInfo, _$RhythmInfo];
  @override
  final String wireName = 'RhythmInfo';

  @override
  Iterable<Object?> serialize(Serializers serializers, RhythmInfo object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'rhythmConnected',
      serializers.serialize(object.rhythmConnected,
          specifiedType: const FullType(bool)),
    ];
    Object? value;
    value = object.auxAvailable;
    if (value != null) {
      result
        ..add('auxAvailable')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.firmwareVersion;
    if (value != null) {
      result
        ..add('firmwareVersion')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(Version)));
    }
    value = object.hardwareVersion;
    if (value != null) {
      result
        ..add('hardwareVersion')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(Version)));
    }
    value = object.rhythmActive;
    if (value != null) {
      result
        ..add('rhythmActive')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.rhythmId;
    if (value != null) {
      result
        ..add('rhythmId')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.rhythmMode;
    if (value != null) {
      result
        ..add('rhythmMode')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.rhythmPos;
    if (value != null) {
      result
        ..add('rhythmPos')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(PositionData)));
    }
    return result;
  }

  @override
  RhythmInfo deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RhythmInfoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'auxAvailable':
          result.auxAvailable = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'firmwareVersion':
          result.firmwareVersion = serializers.deserialize(value,
              specifiedType: const FullType(Version)) as Version?;
          break;
        case 'hardwareVersion':
          result.hardwareVersion = serializers.deserialize(value,
              specifiedType: const FullType(Version)) as Version?;
          break;
        case 'rhythmActive':
          result.rhythmActive = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'rhythmConnected':
          result.rhythmConnected = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'rhythmId':
          result.rhythmId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'rhythmMode':
          result.rhythmMode = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'rhythmPos':
          result.rhythmPos.replace(serializers.deserialize(value,
              specifiedType: const FullType(PositionData))! as PositionData);
          break;
      }
    }

    return result.build();
  }
}

class _$PanelStateSerializer implements StructuredSerializer<PanelState> {
  @override
  final Iterable<Type> types = const [PanelState, _$PanelState];
  @override
  final String wireName = 'PanelState';

  @override
  Iterable<Object?> serialize(Serializers serializers, PanelState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'brightness',
      serializers.serialize(object.brightness,
          specifiedType: const FullType(IntValueRange)),
      'colorMode',
      serializers.serialize(object.colorMode,
          specifiedType: const FullType(ColorMode)),
      'ct',
      serializers.serialize(object.colorTemperature,
          specifiedType: const FullType(IntValueRange)),
      'hue',
      serializers.serialize(object.hue,
          specifiedType: const FullType(IntValueRange)),
      'on',
      serializers.serialize(object.on,
          specifiedType: const FullType(PowerState)),
      'sat',
      serializers.serialize(object.saturation,
          specifiedType: const FullType(IntValueRange)),
    ];

    return result;
  }

  @override
  PanelState deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PanelStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'brightness':
          result.brightness.replace(serializers.deserialize(value,
              specifiedType: const FullType(IntValueRange))! as IntValueRange);
          break;
        case 'colorMode':
          result.colorMode = serializers.deserialize(value,
              specifiedType: const FullType(ColorMode)) as ColorMode;
          break;
        case 'ct':
          result.colorTemperature.replace(serializers.deserialize(value,
              specifiedType: const FullType(IntValueRange))! as IntValueRange);
          break;
        case 'hue':
          result.hue.replace(serializers.deserialize(value,
              specifiedType: const FullType(IntValueRange))! as IntValueRange);
          break;
        case 'on':
          result.on.replace(serializers.deserialize(value,
              specifiedType: const FullType(PowerState))! as PowerState);
          break;
        case 'sat':
          result.saturation.replace(serializers.deserialize(value,
              specifiedType: const FullType(IntValueRange))! as IntValueRange);
          break;
      }
    }

    return result.build();
  }
}

class _$PowerStateSerializer implements StructuredSerializer<PowerState> {
  @override
  final Iterable<Type> types = const [PowerState, _$PowerState];
  @override
  final String wireName = 'PowerState';

  @override
  Iterable<Object?> serialize(Serializers serializers, PowerState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'value',
      serializers.serialize(object.value, specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  PowerState deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PowerStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'value':
          result.value = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$PanelInfo extends PanelInfo {
  @override
  final String name;
  @override
  final String serialNumber;
  @override
  final String manufacturer;
  @override
  final Version firmwareVersion;
  @override
  final Version hardwareVersion;
  @override
  final String model;
  @override
  final DeviceEffects effects;
  @override
  final PanelLayout panelLayout;
  @override
  final RhythmInfo rhythm;
  @override
  final PanelState state;

  factory _$PanelInfo([void Function(PanelInfoBuilder)? updates]) =>
      (new PanelInfoBuilder()..update(updates)).build();

  _$PanelInfo._(
      {required this.name,
      required this.serialNumber,
      required this.manufacturer,
      required this.firmwareVersion,
      required this.hardwareVersion,
      required this.model,
      required this.effects,
      required this.panelLayout,
      required this.rhythm,
      required this.state})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, 'PanelInfo', 'name');
    BuiltValueNullFieldError.checkNotNull(
        serialNumber, 'PanelInfo', 'serialNumber');
    BuiltValueNullFieldError.checkNotNull(
        manufacturer, 'PanelInfo', 'manufacturer');
    BuiltValueNullFieldError.checkNotNull(
        firmwareVersion, 'PanelInfo', 'firmwareVersion');
    BuiltValueNullFieldError.checkNotNull(
        hardwareVersion, 'PanelInfo', 'hardwareVersion');
    BuiltValueNullFieldError.checkNotNull(model, 'PanelInfo', 'model');
    BuiltValueNullFieldError.checkNotNull(effects, 'PanelInfo', 'effects');
    BuiltValueNullFieldError.checkNotNull(
        panelLayout, 'PanelInfo', 'panelLayout');
    BuiltValueNullFieldError.checkNotNull(rhythm, 'PanelInfo', 'rhythm');
    BuiltValueNullFieldError.checkNotNull(state, 'PanelInfo', 'state');
  }

  @override
  PanelInfo rebuild(void Function(PanelInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PanelInfoBuilder toBuilder() => new PanelInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PanelInfo &&
        name == other.name &&
        serialNumber == other.serialNumber &&
        manufacturer == other.manufacturer &&
        firmwareVersion == other.firmwareVersion &&
        hardwareVersion == other.hardwareVersion &&
        model == other.model &&
        effects == other.effects &&
        panelLayout == other.panelLayout &&
        rhythm == other.rhythm &&
        state == other.state;
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
                                    $jc($jc(0, name.hashCode),
                                        serialNumber.hashCode),
                                    manufacturer.hashCode),
                                firmwareVersion.hashCode),
                            hardwareVersion.hashCode),
                        model.hashCode),
                    effects.hashCode),
                panelLayout.hashCode),
            rhythm.hashCode),
        state.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PanelInfo')
          ..add('name', name)
          ..add('serialNumber', serialNumber)
          ..add('manufacturer', manufacturer)
          ..add('firmwareVersion', firmwareVersion)
          ..add('hardwareVersion', hardwareVersion)
          ..add('model', model)
          ..add('effects', effects)
          ..add('panelLayout', panelLayout)
          ..add('rhythm', rhythm)
          ..add('state', state))
        .toString();
  }
}

class PanelInfoBuilder implements Builder<PanelInfo, PanelInfoBuilder> {
  _$PanelInfo? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _serialNumber;
  String? get serialNumber => _$this._serialNumber;
  set serialNumber(String? serialNumber) => _$this._serialNumber = serialNumber;

  String? _manufacturer;
  String? get manufacturer => _$this._manufacturer;
  set manufacturer(String? manufacturer) => _$this._manufacturer = manufacturer;

  Version? _firmwareVersion;
  Version? get firmwareVersion => _$this._firmwareVersion;
  set firmwareVersion(Version? firmwareVersion) =>
      _$this._firmwareVersion = firmwareVersion;

  Version? _hardwareVersion;
  Version? get hardwareVersion => _$this._hardwareVersion;
  set hardwareVersion(Version? hardwareVersion) =>
      _$this._hardwareVersion = hardwareVersion;

  String? _model;
  String? get model => _$this._model;
  set model(String? model) => _$this._model = model;

  DeviceEffectsBuilder? _effects;
  DeviceEffectsBuilder get effects =>
      _$this._effects ??= new DeviceEffectsBuilder();
  set effects(DeviceEffectsBuilder? effects) => _$this._effects = effects;

  PanelLayoutBuilder? _panelLayout;
  PanelLayoutBuilder get panelLayout =>
      _$this._panelLayout ??= new PanelLayoutBuilder();
  set panelLayout(PanelLayoutBuilder? panelLayout) =>
      _$this._panelLayout = panelLayout;

  RhythmInfoBuilder? _rhythm;
  RhythmInfoBuilder get rhythm => _$this._rhythm ??= new RhythmInfoBuilder();
  set rhythm(RhythmInfoBuilder? rhythm) => _$this._rhythm = rhythm;

  PanelStateBuilder? _state;
  PanelStateBuilder get state => _$this._state ??= new PanelStateBuilder();
  set state(PanelStateBuilder? state) => _$this._state = state;

  PanelInfoBuilder();

  PanelInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _serialNumber = $v.serialNumber;
      _manufacturer = $v.manufacturer;
      _firmwareVersion = $v.firmwareVersion;
      _hardwareVersion = $v.hardwareVersion;
      _model = $v.model;
      _effects = $v.effects.toBuilder();
      _panelLayout = $v.panelLayout.toBuilder();
      _rhythm = $v.rhythm.toBuilder();
      _state = $v.state.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PanelInfo other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PanelInfo;
  }

  @override
  void update(void Function(PanelInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PanelInfo build() {
    _$PanelInfo _$result;
    try {
      _$result = _$v ??
          new _$PanelInfo._(
              name: BuiltValueNullFieldError.checkNotNull(
                  name, 'PanelInfo', 'name'),
              serialNumber: BuiltValueNullFieldError.checkNotNull(
                  serialNumber, 'PanelInfo', 'serialNumber'),
              manufacturer: BuiltValueNullFieldError.checkNotNull(
                  manufacturer, 'PanelInfo', 'manufacturer'),
              firmwareVersion: BuiltValueNullFieldError.checkNotNull(
                  firmwareVersion, 'PanelInfo', 'firmwareVersion'),
              hardwareVersion: BuiltValueNullFieldError.checkNotNull(
                  hardwareVersion, 'PanelInfo', 'hardwareVersion'),
              model: BuiltValueNullFieldError.checkNotNull(
                  model, 'PanelInfo', 'model'),
              effects: effects.build(),
              panelLayout: panelLayout.build(),
              rhythm: rhythm.build(),
              state: state.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'effects';
        effects.build();
        _$failedField = 'panelLayout';
        panelLayout.build();
        _$failedField = 'rhythm';
        rhythm.build();
        _$failedField = 'state';
        state.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'PanelInfo', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$DeviceEffects extends DeviceEffects {
  @override
  final String select;
  @override
  final BuiltList<String> effectsList;

  factory _$DeviceEffects([void Function(DeviceEffectsBuilder)? updates]) =>
      (new DeviceEffectsBuilder()..update(updates)).build();

  _$DeviceEffects._({required this.select, required this.effectsList})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(select, 'DeviceEffects', 'select');
    BuiltValueNullFieldError.checkNotNull(
        effectsList, 'DeviceEffects', 'effectsList');
  }

  @override
  DeviceEffects rebuild(void Function(DeviceEffectsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DeviceEffectsBuilder toBuilder() => new DeviceEffectsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DeviceEffects &&
        select == other.select &&
        effectsList == other.effectsList;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, select.hashCode), effectsList.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DeviceEffects')
          ..add('select', select)
          ..add('effectsList', effectsList))
        .toString();
  }
}

class DeviceEffectsBuilder
    implements Builder<DeviceEffects, DeviceEffectsBuilder> {
  _$DeviceEffects? _$v;

  String? _select;
  String? get select => _$this._select;
  set select(String? select) => _$this._select = select;

  ListBuilder<String>? _effectsList;
  ListBuilder<String> get effectsList =>
      _$this._effectsList ??= new ListBuilder<String>();
  set effectsList(ListBuilder<String>? effectsList) =>
      _$this._effectsList = effectsList;

  DeviceEffectsBuilder();

  DeviceEffectsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _select = $v.select;
      _effectsList = $v.effectsList.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DeviceEffects other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DeviceEffects;
  }

  @override
  void update(void Function(DeviceEffectsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DeviceEffects build() {
    _$DeviceEffects _$result;
    try {
      _$result = _$v ??
          new _$DeviceEffects._(
              select: BuiltValueNullFieldError.checkNotNull(
                  select, 'DeviceEffects', 'select'),
              effectsList: effectsList.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'effectsList';
        effectsList.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'DeviceEffects', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$PanelLayout extends PanelLayout {
  @override
  final IntValueRange globalOrientation;
  @override
  final LayoutData layout;

  factory _$PanelLayout([void Function(PanelLayoutBuilder)? updates]) =>
      (new PanelLayoutBuilder()..update(updates)).build();

  _$PanelLayout._({required this.globalOrientation, required this.layout})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        globalOrientation, 'PanelLayout', 'globalOrientation');
    BuiltValueNullFieldError.checkNotNull(layout, 'PanelLayout', 'layout');
  }

  @override
  PanelLayout rebuild(void Function(PanelLayoutBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PanelLayoutBuilder toBuilder() => new PanelLayoutBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PanelLayout &&
        globalOrientation == other.globalOrientation &&
        layout == other.layout;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, globalOrientation.hashCode), layout.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PanelLayout')
          ..add('globalOrientation', globalOrientation)
          ..add('layout', layout))
        .toString();
  }
}

class PanelLayoutBuilder implements Builder<PanelLayout, PanelLayoutBuilder> {
  _$PanelLayout? _$v;

  IntValueRangeBuilder? _globalOrientation;
  IntValueRangeBuilder get globalOrientation =>
      _$this._globalOrientation ??= new IntValueRangeBuilder();
  set globalOrientation(IntValueRangeBuilder? globalOrientation) =>
      _$this._globalOrientation = globalOrientation;

  LayoutDataBuilder? _layout;
  LayoutDataBuilder get layout => _$this._layout ??= new LayoutDataBuilder();
  set layout(LayoutDataBuilder? layout) => _$this._layout = layout;

  PanelLayoutBuilder();

  PanelLayoutBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _globalOrientation = $v.globalOrientation.toBuilder();
      _layout = $v.layout.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PanelLayout other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PanelLayout;
  }

  @override
  void update(void Function(PanelLayoutBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PanelLayout build() {
    _$PanelLayout _$result;
    try {
      _$result = _$v ??
          new _$PanelLayout._(
              globalOrientation: globalOrientation.build(),
              layout: layout.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'globalOrientation';
        globalOrientation.build();
        _$failedField = 'layout';
        layout.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'PanelLayout', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$LayoutData extends LayoutData {
  @override
  final int numPanels;
  @override
  final int sideLength;
  @override
  final BuiltList<ExtendedPositionData> positionData;

  factory _$LayoutData([void Function(LayoutDataBuilder)? updates]) =>
      (new LayoutDataBuilder()..update(updates)).build();

  _$LayoutData._(
      {required this.numPanels,
      required this.sideLength,
      required this.positionData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(numPanels, 'LayoutData', 'numPanels');
    BuiltValueNullFieldError.checkNotNull(
        sideLength, 'LayoutData', 'sideLength');
    BuiltValueNullFieldError.checkNotNull(
        positionData, 'LayoutData', 'positionData');
  }

  @override
  LayoutData rebuild(void Function(LayoutDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LayoutDataBuilder toBuilder() => new LayoutDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LayoutData &&
        numPanels == other.numPanels &&
        sideLength == other.sideLength &&
        positionData == other.positionData;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, numPanels.hashCode), sideLength.hashCode),
        positionData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LayoutData')
          ..add('numPanels', numPanels)
          ..add('sideLength', sideLength)
          ..add('positionData', positionData))
        .toString();
  }
}

class LayoutDataBuilder implements Builder<LayoutData, LayoutDataBuilder> {
  _$LayoutData? _$v;

  int? _numPanels;
  int? get numPanels => _$this._numPanels;
  set numPanels(int? numPanels) => _$this._numPanels = numPanels;

  int? _sideLength;
  int? get sideLength => _$this._sideLength;
  set sideLength(int? sideLength) => _$this._sideLength = sideLength;

  ListBuilder<ExtendedPositionData>? _positionData;
  ListBuilder<ExtendedPositionData> get positionData =>
      _$this._positionData ??= new ListBuilder<ExtendedPositionData>();
  set positionData(ListBuilder<ExtendedPositionData>? positionData) =>
      _$this._positionData = positionData;

  LayoutDataBuilder();

  LayoutDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _numPanels = $v.numPanels;
      _sideLength = $v.sideLength;
      _positionData = $v.positionData.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LayoutData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LayoutData;
  }

  @override
  void update(void Function(LayoutDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LayoutData build() {
    _$LayoutData _$result;
    try {
      _$result = _$v ??
          new _$LayoutData._(
              numPanels: BuiltValueNullFieldError.checkNotNull(
                  numPanels, 'LayoutData', 'numPanels'),
              sideLength: BuiltValueNullFieldError.checkNotNull(
                  sideLength, 'LayoutData', 'sideLength'),
              positionData: positionData.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'positionData';
        positionData.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'LayoutData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$PositionData extends PositionData {
  @override
  final int x;
  @override
  final int y;
  @override
  final int o;

  factory _$PositionData([void Function(PositionDataBuilder)? updates]) =>
      (new PositionDataBuilder()..update(updates)).build();

  _$PositionData._({required this.x, required this.y, required this.o})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(x, 'PositionData', 'x');
    BuiltValueNullFieldError.checkNotNull(y, 'PositionData', 'y');
    BuiltValueNullFieldError.checkNotNull(o, 'PositionData', 'o');
  }

  @override
  PositionData rebuild(void Function(PositionDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PositionDataBuilder toBuilder() => new PositionDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PositionData &&
        x == other.x &&
        y == other.y &&
        o == other.o;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, x.hashCode), y.hashCode), o.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PositionData')
          ..add('x', x)
          ..add('y', y)
          ..add('o', o))
        .toString();
  }
}

class PositionDataBuilder
    implements Builder<PositionData, PositionDataBuilder> {
  _$PositionData? _$v;

  int? _x;
  int? get x => _$this._x;
  set x(int? x) => _$this._x = x;

  int? _y;
  int? get y => _$this._y;
  set y(int? y) => _$this._y = y;

  int? _o;
  int? get o => _$this._o;
  set o(int? o) => _$this._o = o;

  PositionDataBuilder();

  PositionDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _x = $v.x;
      _y = $v.y;
      _o = $v.o;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PositionData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PositionData;
  }

  @override
  void update(void Function(PositionDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PositionData build() {
    final _$result = _$v ??
        new _$PositionData._(
            x: BuiltValueNullFieldError.checkNotNull(x, 'PositionData', 'x'),
            y: BuiltValueNullFieldError.checkNotNull(y, 'PositionData', 'y'),
            o: BuiltValueNullFieldError.checkNotNull(o, 'PositionData', 'o'));
    replace(_$result);
    return _$result;
  }
}

class _$ExtendedPositionData extends ExtendedPositionData {
  @override
  final int x;
  @override
  final int y;
  @override
  final int o;
  @override
  final int panelId;
  @override
  final ShapeType shapeType;

  factory _$ExtendedPositionData(
          [void Function(ExtendedPositionDataBuilder)? updates]) =>
      (new ExtendedPositionDataBuilder()..update(updates)).build();

  _$ExtendedPositionData._(
      {required this.x,
      required this.y,
      required this.o,
      required this.panelId,
      required this.shapeType})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(x, 'ExtendedPositionData', 'x');
    BuiltValueNullFieldError.checkNotNull(y, 'ExtendedPositionData', 'y');
    BuiltValueNullFieldError.checkNotNull(o, 'ExtendedPositionData', 'o');
    BuiltValueNullFieldError.checkNotNull(
        panelId, 'ExtendedPositionData', 'panelId');
    BuiltValueNullFieldError.checkNotNull(
        shapeType, 'ExtendedPositionData', 'shapeType');
  }

  @override
  ExtendedPositionData rebuild(
          void Function(ExtendedPositionDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ExtendedPositionDataBuilder toBuilder() =>
      new ExtendedPositionDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ExtendedPositionData &&
        x == other.x &&
        y == other.y &&
        o == other.o &&
        panelId == other.panelId &&
        shapeType == other.shapeType;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, x.hashCode), y.hashCode), o.hashCode),
            panelId.hashCode),
        shapeType.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ExtendedPositionData')
          ..add('x', x)
          ..add('y', y)
          ..add('o', o)
          ..add('panelId', panelId)
          ..add('shapeType', shapeType))
        .toString();
  }
}

class ExtendedPositionDataBuilder
    implements Builder<ExtendedPositionData, ExtendedPositionDataBuilder> {
  _$ExtendedPositionData? _$v;

  int? _x;
  int? get x => _$this._x;
  set x(int? x) => _$this._x = x;

  int? _y;
  int? get y => _$this._y;
  set y(int? y) => _$this._y = y;

  int? _o;
  int? get o => _$this._o;
  set o(int? o) => _$this._o = o;

  int? _panelId;
  int? get panelId => _$this._panelId;
  set panelId(int? panelId) => _$this._panelId = panelId;

  ShapeType? _shapeType;
  ShapeType? get shapeType => _$this._shapeType;
  set shapeType(ShapeType? shapeType) => _$this._shapeType = shapeType;

  ExtendedPositionDataBuilder();

  ExtendedPositionDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _x = $v.x;
      _y = $v.y;
      _o = $v.o;
      _panelId = $v.panelId;
      _shapeType = $v.shapeType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ExtendedPositionData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ExtendedPositionData;
  }

  @override
  void update(void Function(ExtendedPositionDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ExtendedPositionData build() {
    final _$result = _$v ??
        new _$ExtendedPositionData._(
            x: BuiltValueNullFieldError.checkNotNull(
                x, 'ExtendedPositionData', 'x'),
            y: BuiltValueNullFieldError.checkNotNull(
                y, 'ExtendedPositionData', 'y'),
            o: BuiltValueNullFieldError.checkNotNull(
                o, 'ExtendedPositionData', 'o'),
            panelId: BuiltValueNullFieldError.checkNotNull(
                panelId, 'ExtendedPositionData', 'panelId'),
            shapeType: BuiltValueNullFieldError.checkNotNull(
                shapeType, 'ExtendedPositionData', 'shapeType'));
    replace(_$result);
    return _$result;
  }
}

class _$RhythmInfo extends RhythmInfo {
  @override
  final bool? auxAvailable;
  @override
  final Version? firmwareVersion;
  @override
  final Version? hardwareVersion;
  @override
  final bool? rhythmActive;
  @override
  final bool rhythmConnected;
  @override
  final int? rhythmId;
  @override
  final int? rhythmMode;
  @override
  final PositionData? rhythmPos;

  factory _$RhythmInfo([void Function(RhythmInfoBuilder)? updates]) =>
      (new RhythmInfoBuilder()..update(updates)).build();

  _$RhythmInfo._(
      {this.auxAvailable,
      this.firmwareVersion,
      this.hardwareVersion,
      this.rhythmActive,
      required this.rhythmConnected,
      this.rhythmId,
      this.rhythmMode,
      this.rhythmPos})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        rhythmConnected, 'RhythmInfo', 'rhythmConnected');
  }

  @override
  RhythmInfo rebuild(void Function(RhythmInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RhythmInfoBuilder toBuilder() => new RhythmInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RhythmInfo &&
        auxAvailable == other.auxAvailable &&
        firmwareVersion == other.firmwareVersion &&
        hardwareVersion == other.hardwareVersion &&
        rhythmActive == other.rhythmActive &&
        rhythmConnected == other.rhythmConnected &&
        rhythmId == other.rhythmId &&
        rhythmMode == other.rhythmMode &&
        rhythmPos == other.rhythmPos;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc(0, auxAvailable.hashCode),
                                firmwareVersion.hashCode),
                            hardwareVersion.hashCode),
                        rhythmActive.hashCode),
                    rhythmConnected.hashCode),
                rhythmId.hashCode),
            rhythmMode.hashCode),
        rhythmPos.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('RhythmInfo')
          ..add('auxAvailable', auxAvailable)
          ..add('firmwareVersion', firmwareVersion)
          ..add('hardwareVersion', hardwareVersion)
          ..add('rhythmActive', rhythmActive)
          ..add('rhythmConnected', rhythmConnected)
          ..add('rhythmId', rhythmId)
          ..add('rhythmMode', rhythmMode)
          ..add('rhythmPos', rhythmPos))
        .toString();
  }
}

class RhythmInfoBuilder implements Builder<RhythmInfo, RhythmInfoBuilder> {
  _$RhythmInfo? _$v;

  bool? _auxAvailable;
  bool? get auxAvailable => _$this._auxAvailable;
  set auxAvailable(bool? auxAvailable) => _$this._auxAvailable = auxAvailable;

  Version? _firmwareVersion;
  Version? get firmwareVersion => _$this._firmwareVersion;
  set firmwareVersion(Version? firmwareVersion) =>
      _$this._firmwareVersion = firmwareVersion;

  Version? _hardwareVersion;
  Version? get hardwareVersion => _$this._hardwareVersion;
  set hardwareVersion(Version? hardwareVersion) =>
      _$this._hardwareVersion = hardwareVersion;

  bool? _rhythmActive;
  bool? get rhythmActive => _$this._rhythmActive;
  set rhythmActive(bool? rhythmActive) => _$this._rhythmActive = rhythmActive;

  bool? _rhythmConnected;
  bool? get rhythmConnected => _$this._rhythmConnected;
  set rhythmConnected(bool? rhythmConnected) =>
      _$this._rhythmConnected = rhythmConnected;

  int? _rhythmId;
  int? get rhythmId => _$this._rhythmId;
  set rhythmId(int? rhythmId) => _$this._rhythmId = rhythmId;

  int? _rhythmMode;
  int? get rhythmMode => _$this._rhythmMode;
  set rhythmMode(int? rhythmMode) => _$this._rhythmMode = rhythmMode;

  PositionDataBuilder? _rhythmPos;
  PositionDataBuilder get rhythmPos =>
      _$this._rhythmPos ??= new PositionDataBuilder();
  set rhythmPos(PositionDataBuilder? rhythmPos) =>
      _$this._rhythmPos = rhythmPos;

  RhythmInfoBuilder();

  RhythmInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _auxAvailable = $v.auxAvailable;
      _firmwareVersion = $v.firmwareVersion;
      _hardwareVersion = $v.hardwareVersion;
      _rhythmActive = $v.rhythmActive;
      _rhythmConnected = $v.rhythmConnected;
      _rhythmId = $v.rhythmId;
      _rhythmMode = $v.rhythmMode;
      _rhythmPos = $v.rhythmPos?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RhythmInfo other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RhythmInfo;
  }

  @override
  void update(void Function(RhythmInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$RhythmInfo build() {
    _$RhythmInfo _$result;
    try {
      _$result = _$v ??
          new _$RhythmInfo._(
              auxAvailable: auxAvailable,
              firmwareVersion: firmwareVersion,
              hardwareVersion: hardwareVersion,
              rhythmActive: rhythmActive,
              rhythmConnected: BuiltValueNullFieldError.checkNotNull(
                  rhythmConnected, 'RhythmInfo', 'rhythmConnected'),
              rhythmId: rhythmId,
              rhythmMode: rhythmMode,
              rhythmPos: _rhythmPos?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'rhythmPos';
        _rhythmPos?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'RhythmInfo', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$PanelState extends PanelState {
  @override
  final IntValueRange brightness;
  @override
  final ColorMode colorMode;
  @override
  final IntValueRange colorTemperature;
  @override
  final IntValueRange hue;
  @override
  final PowerState on;
  @override
  final IntValueRange saturation;

  factory _$PanelState([void Function(PanelStateBuilder)? updates]) =>
      (new PanelStateBuilder()..update(updates)).build();

  _$PanelState._(
      {required this.brightness,
      required this.colorMode,
      required this.colorTemperature,
      required this.hue,
      required this.on,
      required this.saturation})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        brightness, 'PanelState', 'brightness');
    BuiltValueNullFieldError.checkNotNull(colorMode, 'PanelState', 'colorMode');
    BuiltValueNullFieldError.checkNotNull(
        colorTemperature, 'PanelState', 'colorTemperature');
    BuiltValueNullFieldError.checkNotNull(hue, 'PanelState', 'hue');
    BuiltValueNullFieldError.checkNotNull(on, 'PanelState', 'on');
    BuiltValueNullFieldError.checkNotNull(
        saturation, 'PanelState', 'saturation');
  }

  @override
  PanelState rebuild(void Function(PanelStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PanelStateBuilder toBuilder() => new PanelStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PanelState &&
        brightness == other.brightness &&
        colorMode == other.colorMode &&
        colorTemperature == other.colorTemperature &&
        hue == other.hue &&
        on == other.on &&
        saturation == other.saturation;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, brightness.hashCode), colorMode.hashCode),
                    colorTemperature.hashCode),
                hue.hashCode),
            on.hashCode),
        saturation.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PanelState')
          ..add('brightness', brightness)
          ..add('colorMode', colorMode)
          ..add('colorTemperature', colorTemperature)
          ..add('hue', hue)
          ..add('on', on)
          ..add('saturation', saturation))
        .toString();
  }
}

class PanelStateBuilder implements Builder<PanelState, PanelStateBuilder> {
  _$PanelState? _$v;

  IntValueRangeBuilder? _brightness;
  IntValueRangeBuilder get brightness =>
      _$this._brightness ??= new IntValueRangeBuilder();
  set brightness(IntValueRangeBuilder? brightness) =>
      _$this._brightness = brightness;

  ColorMode? _colorMode;
  ColorMode? get colorMode => _$this._colorMode;
  set colorMode(ColorMode? colorMode) => _$this._colorMode = colorMode;

  IntValueRangeBuilder? _colorTemperature;
  IntValueRangeBuilder get colorTemperature =>
      _$this._colorTemperature ??= new IntValueRangeBuilder();
  set colorTemperature(IntValueRangeBuilder? colorTemperature) =>
      _$this._colorTemperature = colorTemperature;

  IntValueRangeBuilder? _hue;
  IntValueRangeBuilder get hue => _$this._hue ??= new IntValueRangeBuilder();
  set hue(IntValueRangeBuilder? hue) => _$this._hue = hue;

  PowerStateBuilder? _on;
  PowerStateBuilder get on => _$this._on ??= new PowerStateBuilder();
  set on(PowerStateBuilder? on) => _$this._on = on;

  IntValueRangeBuilder? _saturation;
  IntValueRangeBuilder get saturation =>
      _$this._saturation ??= new IntValueRangeBuilder();
  set saturation(IntValueRangeBuilder? saturation) =>
      _$this._saturation = saturation;

  PanelStateBuilder();

  PanelStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _brightness = $v.brightness.toBuilder();
      _colorMode = $v.colorMode;
      _colorTemperature = $v.colorTemperature.toBuilder();
      _hue = $v.hue.toBuilder();
      _on = $v.on.toBuilder();
      _saturation = $v.saturation.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PanelState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PanelState;
  }

  @override
  void update(void Function(PanelStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PanelState build() {
    _$PanelState _$result;
    try {
      _$result = _$v ??
          new _$PanelState._(
              brightness: brightness.build(),
              colorMode: BuiltValueNullFieldError.checkNotNull(
                  colorMode, 'PanelState', 'colorMode'),
              colorTemperature: colorTemperature.build(),
              hue: hue.build(),
              on: on.build(),
              saturation: saturation.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'brightness';
        brightness.build();

        _$failedField = 'colorTemperature';
        colorTemperature.build();
        _$failedField = 'hue';
        hue.build();
        _$failedField = 'on';
        on.build();
        _$failedField = 'saturation';
        saturation.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'PanelState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$PowerState extends PowerState {
  @override
  final bool value;

  factory _$PowerState([void Function(PowerStateBuilder)? updates]) =>
      (new PowerStateBuilder()..update(updates)).build();

  _$PowerState._({required this.value}) : super._() {
    BuiltValueNullFieldError.checkNotNull(value, 'PowerState', 'value');
  }

  @override
  PowerState rebuild(void Function(PowerStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PowerStateBuilder toBuilder() => new PowerStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PowerState && value == other.value;
  }

  @override
  int get hashCode {
    return $jf($jc(0, value.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PowerState')..add('value', value))
        .toString();
  }
}

class PowerStateBuilder implements Builder<PowerState, PowerStateBuilder> {
  _$PowerState? _$v;

  bool? _value;
  bool? get value => _$this._value;
  set value(bool? value) => _$this._value = value;

  PowerStateBuilder();

  PowerStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PowerState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PowerState;
  }

  @override
  void update(void Function(PowerStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PowerState build() {
    final _$result = _$v ??
        new _$PowerState._(
            value: BuiltValueNullFieldError.checkNotNull(
                value, 'PowerState', 'value'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
