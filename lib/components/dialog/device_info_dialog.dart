import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nanoleaf_flutter/models/panel_info.dart';

/// Dialog showing information about a device
class DeviceInfoDialog extends StatelessWidget {
  final PanelInfo panelInfo;

  const DeviceInfoDialog({Key? key, required this.panelInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) => AlertDialog(
        title: Text(Intl.message("Device information")),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              _tile(Icons.dvr, Intl.message("Model"), panelInfo.model),
              _tile(Icons.construction, Intl.message("Manufacturer"),
                  panelInfo.manufacturer),
              _tile(Icons.memory, Intl.message("Firmware version"),
                  panelInfo.firmwareVersion),
              _tile(Icons.nfc, Intl.message("Hardware version"),
                  panelInfo.hardwareVersion)
            ],
          ),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(Intl.message("Close")))
        ],
      );

  Widget _tile(IconData icon, String title, Object value) => Card(
        child: ListTile(
          leading: Icon(icon),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,  style: TextStyle(fontSize: 20)),
              Text(value.toString(),  style: TextStyle(fontSize: 16))
            ],
          ),
        ),
      );
}
