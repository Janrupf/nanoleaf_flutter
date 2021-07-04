import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:nanoleaf_flutter/components/identify_button.dart';
import 'package:nanoleaf_flutter/nanoleaf/device/discovery_device.dart';
import 'package:nanoleaf_flutter/nanoleaf/device_manager.dart';
import 'package:nanoleaf_flutter/views/add.dart';
import 'package:nanoleaf_flutter/views/base.dart';
import 'package:provider/provider.dart';

/// General view for adding devices.
class DiscoveredDevicesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => FullScreenView(
        title: Intl.message("Add devices"),
        child: Center(
            child: Column(
          children: [
            // Header
            Text(Intl.message("Discovered devices"),
                textAlign: TextAlign.right, style: TextStyle(fontSize: 40.0)),
            SizedBox(height: 30),
            Expanded(
              child: SizedBox(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 800),
                  child: Scrollbar(child: _DiscoveredDeviceList()),
                ),
              ),
            ),
            SizedBox(height: 30),
            Center(
                child: RaisedButton(
              child: Text("Add manually"),
              onPressed: () => showDialog(
                  context: context, builder: (context) => _AddManuallyDialog()),
            ))
          ],
        )),
      );
}

/// List of devices which have been discovered.
class _DiscoveredDeviceList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DiscoveredDeviceListState();
}

class _DiscoveredDeviceListState extends State<_DiscoveredDeviceList> {
  final List<DiscoveredDevice> discovered = [];

  @override
  Widget build(BuildContext context) => Consumer<DeviceManager>(
      builder: (context, deviceManager, child) =>
          StreamBuilder<DiscoveredDevice>(
              stream: deviceManager.discoveryStream(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  if (discovered.length < 1) {
                    return Center(child: CircularProgressIndicator());
                  }
                } else {
                  discovered.add(snapshot.data!);
                }

                return ListView.separated(
                    itemBuilder: (context, i) => ListTile(
                          title: Text(discovered[i].name),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IdentifyButton(device: discovered[i]),
                              VerticalDivider(),
                              IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () => Navigator.pushNamed(
                                    context, "/add-device",
                                    arguments: AddDeviceArguments(
                                        discovered[i].address,
                                        discovered[i].port,
                                        discovered[i].name,
                                        discovered[i].id)),
                              ),
                            ],
                          ),
                        ),
                    separatorBuilder: (context, i) => Divider(),
                    itemCount: discovered.length);
              }));
}

class _AddManuallyDialog extends StatefulWidget {
  @override
  _AddManuallyDialogState createState() => _AddManuallyDialogState();
}

class _AddManuallyDialogState extends State<_AddManuallyDialog> {
  final _formKey = GlobalKey<FormState>();
  final _ipController = TextEditingController();
  final _portController = TextEditingController(text: "16021");

  @override
  void dispose() {
    _ipController.dispose();
    _portController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
        title: Text(Intl.message("Add device")),
        content: Form(
          key: _formKey,
          child: Wrap(
            children: [
              TextFormField(
                controller: _ipController,
                decoration: InputDecoration(
                    icon: Icon(Icons.settings_ethernet),
                    hintText: Intl.message("The IP address of the device"),
                    labelText: Intl.message("IP address")),
                validator: (value) {
                  if (value == null) {
                    return Intl.message("Enter a valid IP address");
                  }

                  final address = InternetAddress.tryParse(value);
                  if (address == null) {
                    return Intl.message("Enter a valid IP address");
                  }

                  return null;
                },
              ),
              TextFormField(
                controller: _portController,
                decoration: InputDecoration(
                    icon: Icon(Icons.settings_input_component),
                    hintText: Intl.message("The device port, usually 16021"),
                    labelText: Intl.message("Port")),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (value) {
                  if (value == null) {
                    return Intl.message("Enter a number between 1 and 65535");
                  }

                  final parsed = int.tryParse(value);
                  if (parsed == null || parsed < 1 || parsed > 65535) {
                    return Intl.message("Enter a number between 1 and 65535");
                  }

                  return null;
                },
              )
            ],
          ),
        ),
        actions: [
          FlatButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(Intl.message("Cancel"))),
          FlatButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.pushReplacementNamed(context, "/add-device",
                      arguments: AddDeviceArguments(
                          InternetAddress(_ipController.value.text),
                          int.parse(_portController.value.text),
                          null,
                          null));
                }
              },
              child: Text(Intl.message("Add")))
        ],
      );
}
