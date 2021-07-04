import 'dart:io';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:nanoleaf_flutter/nanoleaf/device/device_id.dart';

part 'device_meta.g.dart';

/// Represents the persistent data saved to disk by the application for loading
/// devices after a restart.
abstract class DeviceMeta implements Built<DeviceMeta, DeviceMetaBuilder> {
  static Serializer<DeviceMeta> get serializer => _$deviceMetaSerializer;

  /// User given name of the device
  String get name;

  /// Device id
  NanoleafId get id;

  /// Address of the device
  InternetAddress get address;

  /// OpenAPI port of the device
  int get port;

  /// The token the device can be accessed with
  String get token;

  DeviceMeta._();

  factory DeviceMeta([void Function(DeviceMetaBuilder)? updates]) =
      _$DeviceMeta;
}
