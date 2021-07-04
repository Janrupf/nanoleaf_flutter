import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nanoleaf_flutter/components/dialog/delete_device_dialog.dart';
import 'package:nanoleaf_flutter/components/identify_button.dart';
import 'package:nanoleaf_flutter/nanoleaf/device/paired_device.dart';
import 'package:nanoleaf_flutter/nanoleaf/openapi/api_controller.dart';
import 'package:nanoleaf_flutter/pages/page.dart';
import 'package:nanoleaf_flutter/util/list_change_notifier.dart';
import 'package:nanoleaf_flutter/views/edit_device.dart';
import 'package:provider/provider.dart';

class DevicesPage extends ApplicationPage {
  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(Intl.message("Your devices"),
                textAlign: TextAlign.right, style: TextStyle(fontSize: 40.0)),
            SizedBox(height: 30),
            Expanded(
              child: SizedBox(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 800),
                  child: Scrollbar(child: _DeviceList()),
                ),
              ),
            )
          ],
        ),
      );

  @override
  Icon get icon => Icon(Icons.devices);

  @override
  String get title => Intl.message("Devices");

  @override
  FloatingActionButton? buildActionButton(BuildContext context) =>
      FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, "/discovered-devices"),
        child: Icon(Icons.add),
      );

  @override
  bool enableSidebar() => true;
}

/// List of devices which have been added.
class _DeviceList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DeviceListState();
}

class _DeviceListState extends State<_DeviceList> {
  @override
  Widget build(BuildContext context) =>
      Consumer2<ListChangeNotifier<PairedDevice>, ApiController>(
          builder: (context, pairedDevices, controller, child) =>
              ListView.separated(
                  itemBuilder: (context, i) => Container(
                        child: IntrinsicHeight(
                          child: Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  child: Container(
                                      constraints:
                                          BoxConstraints.expand(height: 50),
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 5),
                                      child: FittedBox(
                                          alignment: Alignment.centerLeft,
                                          fit: BoxFit.fitHeight,
                                          child: Text(pairedDevices[i].name))),
                                  onTap: () => Navigator.pushNamed(
                                      context, "/edit-device",
                                      arguments: EditDeviceViewArguments(
                                          device: pairedDevices[i])),
                                ),
                              ),
                              IdentifyButton(device: pairedDevices[i]),
                              VerticalDivider(),
                              IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () => showDialog(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (context) => DeleteDeviceDialog(
                                          device: pairedDevices[i]))),
                            ],
                          ),
                        ),
                      ),
                  separatorBuilder: (context, i) => Divider(),
                  itemCount: pairedDevices.length));
}
