import 'dart:io';

import 'package:nanoleaf_flutter/models/device_meta.dart';
import 'package:nanoleaf_flutter/nanoleaf/device/device_base.dart';
import 'package:nanoleaf_flutter/nanoleaf/device/device_id.dart';

/// A device which has been paired already and can be interacted with.
class PairedDevice extends DeviceBase {
  /// A user supplied name of the device
  final String name;

  /// The ID of the device
  final NanoleafId id;

  /// The token the device can be accessed with
  final String token;

  /// Constructs a new device from scratch and sets all the required information.
  PairedDevice(
      {required InternetAddress address,
      required int port,
      required this.name,
      required this.id,
      required this.token})
      : super(address, port);

  /// Constructs a device from previously saved meta.
  PairedDevice.fromMeta(DeviceMeta meta)
      : name = meta.name,
        id = meta.id,
        token = meta.token,
        super(meta.address, meta.port);

  /// Exports the device to a meta format which can be saved.
  DeviceMeta toMeta() => DeviceMeta((meta) => meta
    ..address = address
    ..port = port
    ..name = name
    ..id = id
    ..token = token);
}
