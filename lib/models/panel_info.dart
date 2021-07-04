import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:nanoleaf_flutter/models/value_range.dart';
import 'package:pub_semver/pub_semver.dart';

part 'panel_info.g.dart';

abstract class PanelInfo implements Built<PanelInfo, PanelInfoBuilder> {
  static Serializer<PanelInfo> get serializer => _$panelInfoSerializer;

  /// The name of the panel
  String get name;

  /// The serial number of the panel, serialNo in the Json response
  @BuiltValueField(wireName: "serialNo")
  String get serialNumber;

  /// The manufacturer of the panel, will probably always be "Nanoleaf"
  String get manufacturer;

  /// The firmware version of the device
  Version get firmwareVersion;

  /// The hardware version/revision of the device
  Version get hardwareVersion;

  /// The device model, often "NL22"
  String get model;

  // dynamic get cloudHash;

  // dynamic get discovery;

  /// Device effects configuration
  DeviceEffects get effects;

  // dynamic get firmwareUpgrade;

  /// Layout information
  PanelLayout get panelLayout;

  /// Rhythm module information
  RhythmInfo get rhythm;

  // dynamic get schedules;

  /// The current panel state
  PanelState get state;

  PanelInfo._();

  factory PanelInfo([void Function(PanelInfoBuilder)? updates]) = _$PanelInfo;
}

abstract class DeviceEffects
    implements Built<DeviceEffects, DeviceEffectsBuilder> {
  static Serializer<DeviceEffects> get serializer => _$deviceEffectsSerializer;

  /// The currently selected effect
  String get select;

  /// All available effects
  BuiltList<String> get effectsList;

  DeviceEffects._();

  factory DeviceEffects([void Function(DeviceEffectsBuilder)? updates]) =
      _$DeviceEffects;
}

abstract class PanelLayout implements Built<PanelLayout, PanelLayoutBuilder> {
  static Serializer<PanelLayout> get serializer => _$panelLayoutSerializer;

  /// Saved device orientation
  IntValueRange get globalOrientation;

  /// The layout of the entire construct
  LayoutData get layout;

  PanelLayout._();

  factory PanelLayout([void Function(PanelLayoutBuilder)? updates]) =
      _$PanelLayout;
}

abstract class LayoutData implements Built<LayoutData, LayoutDataBuilder> {
  static Serializer<LayoutData> get serializer => _$layoutDataSerializer;

  /// Amount of connected panels
  int get numPanels;

  /// The length of each panel side
  @Deprecated("Can not represent the side lengths of multiple shapes")
  int get sideLength;

  /// The positioning of the entire construct
  BuiltList<ExtendedPositionData> get positionData;

  LayoutData._();

  factory LayoutData([void Function(LayoutDataBuilder)? updates]) =
      _$LayoutData;
}

abstract class PositionData
    implements Built<PositionData, PositionDataBuilder> {
  static Serializer<PositionData> get serializer => _$positionDataSerializer;

  /// X position of the panel
  int get x;

  /// Y position of the panel
  int get y;

  /// Orientation of the panel
  int get o;

  PositionData._();

  factory PositionData([void Function(PositionDataBuilder)? updates]) =
      _$PositionData;
}

abstract class ExtendedPositionData
    implements Built<ExtendedPositionData, ExtendedPositionDataBuilder> {
  static Serializer<ExtendedPositionData> get serializer =>
      _$extendedPositionDataSerializer;

  /// X position of the panel
  int get x;

  /// Y position of the panel
  int get y;

  /// Orientation of the panel
  int get o;

  /// The id of the panel
  int get panelId;

  /// The shape type of the panel
  ShapeType get shapeType;

  ExtendedPositionData._();

  factory ExtendedPositionData(
          [void Function(ExtendedPositionDataBuilder)? updates]) =
      _$ExtendedPositionData;
}

enum ShapeType {
  // Normal Nanoleafs
  triangle,
  rythm,
  square,
  controlSquareMaster,
  controlSquarePassive,

  // Shapes edition
  hexagonShapes,
  triangleShapes,
  miniTriangleShapes,
  controllerShapes
}

class ShapeTypeInfo {
  /// The id of the shape type
  final int id;

  /// The length of each shape side, or null, if not available
  final int? sideLength;

  /// Whether this panel is part of the shapes edition
  final bool shapesEdition;

  const ShapeTypeInfo(
      {required this.id, this.sideLength, this.shapesEdition = false});
}

extension ShapeTypeInfoExt on ShapeType {
  static const Map<ShapeType, ShapeTypeInfo> _values = {
    ShapeType.triangle: ShapeTypeInfo(id: 0, sideLength: 150),
    ShapeType.rythm: ShapeTypeInfo(id: 1),
    ShapeType.square: ShapeTypeInfo(id: 2, sideLength: 100),
    ShapeType.controlSquareMaster: ShapeTypeInfo(id: 3, sideLength: 100),
    ShapeType.controlSquarePassive: ShapeTypeInfo(id: 4, sideLength: 100),
    ShapeType.hexagonShapes:
        ShapeTypeInfo(id: 7, sideLength: 67, shapesEdition: true),
    ShapeType.triangleShapes:
        ShapeTypeInfo(id: 8, sideLength: 134, shapesEdition: true),
    ShapeType.miniTriangleShapes:
        ShapeTypeInfo(id: 9, sideLength: 67, shapesEdition: true),
    ShapeType.controllerShapes: ShapeTypeInfo(id: 12, shapesEdition: true)
  };

  /// Retrieves the shape type based on the id
  static ShapeType fromId(int id) {
    return _values.entries.firstWhere((entry) => entry.value.id == id).key;
  }

  /// Get the whole info structure of this shape type
  ShapeTypeInfo get info => _values[this]!;

  int get id => info.id;

  int? get sideLength => info.sideLength;

  bool get shapesEdition => info.shapesEdition;
}

abstract class RhythmInfo implements Built<RhythmInfo, RhythmInfoBuilder> {
  static Serializer<RhythmInfo> get serializer => _$rhythmInfoSerializer;

  /// Determines whether aux is available, may be null if rhythm is not
  /// connected or not active
  bool? get auxAvailable;

  /// Firmware version of the rhythm module, may be null if rhythm is not
  /// connected or not active
  Version? get firmwareVersion;

  /// Hardware version of the rhythm module, may be null if rhythm is not
  /// connected or not active
  Version? get hardwareVersion;

  /// Determines whether the rhythm module is active, may be null if rhythm is
  /// not connected or not active
  bool? get rhythmActive;

  /// Determines whether thy rhythm module is (physically) connected
  bool get rhythmConnected;

  /// The id of the rhythm module, may be null if rhythm is not connected or not
  /// active
  int? get rhythmId;

  /// The mode id of the rhythm module, unknown which id means which, may be
  /// null if rhythm is not connected or not active
  int? get rhythmMode;

  /// The position of the rhythm module, may be null if rhythm is not
  /// connected or not active
  PositionData? get rhythmPos;

  RhythmInfo._();

  factory RhythmInfo([void Function(RhythmInfoBuilder)? updates]) =
      _$RhythmInfo;
}

abstract class PanelState implements Built<PanelState, PanelStateBuilder> {
  static Serializer<PanelState> get serializer => _$panelStateSerializer;

  /// Determines the brightness of the panel
  IntValueRange get brightness;

  /// The current color display mode of the panel
  ColorMode get colorMode;

  /// The current color temperature setting if [colorMode] is
  /// [ColorMode.colorTemperature]
  @BuiltValueField(wireName: "ct")
  IntValueRange get colorTemperature;

  /// The current hue setting if [colorMode] is
  /// [ColorMode.hueSaturation]
  IntValueRange get hue;

  /// Power state information
  PowerState get on;

  /// The current color saturation setting if [colorMode] is
  /// [ColorMode.hueSaturation]
  @BuiltValueField(wireName: "sat")
  IntValueRange get saturation;

  PanelState._();

  factory PanelState([void Function(PanelStateBuilder)? updates]) =
      _$PanelState;
}

enum ColorMode {
  /// Static/dynamic effect
  effect,

  /// Hue/Saturation static lighting
  hueSaturation,

  /// Color temperature in Kelvin
  colorTemperature
}

extension ColorModeExt on ColorMode {
  static ColorMode? tryFromString(String mode) {
    switch (mode) {
      case "effect":
        return ColorMode.effect;

      case "hs":
        return ColorMode.hueSaturation;

      case "ct":
        return ColorMode.colorTemperature;
    }

    return null;
  }

  String toNanoleafValue() {
    switch (this) {
      case ColorMode.effect:
        return "effect";

      case ColorMode.hueSaturation:
        return "hs";

        case ColorMode.colorTemperature:
        return "ct";
    }
  }
}

abstract class PowerState implements Built<PowerState, PowerStateBuilder> {
  static Serializer<PowerState> get serializer => _$powerStateSerializer;

  /// Determines whether the panel is on
  bool get value;

  PowerState._();

  factory PowerState([void Function(PowerStateBuilder)? updates]) =
      _$PowerState;
}
