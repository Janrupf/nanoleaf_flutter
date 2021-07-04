import 'dart:io';

import 'package:nanoleaf_flutter/nanoleaf/device/device_base.dart';
import 'package:nanoleaf_flutter/nanoleaf/device/device_id.dart';

/// Represents a device which has been discovered using one of the discovery
/// mechanism.
class DiscoveredDevice extends DeviceBase {
  /// The device id, used for unique identification
  final NanoleafId id;

  /// The name of the device
  final String name;

  DiscoveredDevice(this.id, this.name, InternetAddress address, int port)
      : super(address, port);
}
