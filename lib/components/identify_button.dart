import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nanoleaf_flutter/components/dialog/error_dialog.dart';
import 'package:nanoleaf_flutter/models/discovery_info.dart';
import 'package:nanoleaf_flutter/nanoleaf/device/device_base.dart';
import 'package:nanoleaf_flutter/nanoleaf/openapi/api_controller.dart';
import 'package:nanoleaf_flutter/nanoleaf/openapi/v1/get_discovery_info.dart';
import 'package:provider/provider.dart';

/// Button which can make devices blink.
class IdentifyButton extends StatelessWidget {
  final DeviceBase device;

  IdentifyButton({Key? key, required this.device}) : super(key: key);

  @override
  Widget build(BuildContext context) => Consumer<ApiController>(
      builder: (context, controller, child) => IconButton(
          icon: Icon(Icons.search),
          onPressed: () => _trySendIdentify(context, controller)));

  /// Sends the identify request to the [device] if the discovery info is
  /// available already. If not, the discovery info is fetched.
  void _trySendIdentify(BuildContext context, ApiController controller) {
    if (device.discoveryInfo == null) {
      controller
          .send(device, GetDiscoveryInfoRequest())
          .then((DiscoveryInfo value) => device.discoveryInfo = value)
          .then((_) => _sendIdentifyNow(context, controller));
    } else {
      _sendIdentifyNow(context, controller);
    }
  }

  /// Sends the identify based on the discovery info.
  ///
  /// This assumes that the discovery info is not null on the device.
  void _sendIdentifyNow(BuildContext context, ApiController controller) {
    controller
        .androidIdentify(device, device.discoveryInfo!.ipv4.port)
        .catchError((error) => showDialog(
            context: context,
            builder: (context) => ErrorDialog(
                title: Intl.message("Identify failed"),
                message:
                    Intl.message("Failed to send identify request to device!"),
                error: error)));
  }
}
