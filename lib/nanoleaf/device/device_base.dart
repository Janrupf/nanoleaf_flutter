import 'dart:io';

import 'package:nanoleaf_flutter/models/discovery_info.dart';

/// Base class for all device instances.
class DeviceBase {
  /// Discovery info, only available if determined yet.
  DiscoveryInfo? discoveryInfo;

  /// The address the device can be contacted at
  final InternetAddress address;

  /// The OpenAPI port of the device
  final int port;

  DeviceBase(this.address, this.port);
}