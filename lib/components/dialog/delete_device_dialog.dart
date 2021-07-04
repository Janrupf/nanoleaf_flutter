import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nanoleaf_flutter/nanoleaf/device/paired_device.dart';
import 'package:nanoleaf_flutter/nanoleaf/device_manager.dart';
import 'package:nanoleaf_flutter/nanoleaf/openapi/api_controller.dart';
import 'package:nanoleaf_flutter/nanoleaf/openapi/v1/delete_user.dart';
import 'package:provider/provider.dart';

/// Multi-stage dialog used for deleting devices.
class DeleteDeviceDialog extends StatefulWidget {
  final PairedDevice device;

  DeleteDeviceDialog({required this.device});

  @override
  State<StatefulWidget> createState() =>
      _DeleteDeviceDialogState(device: device);
}

enum _DeletionStage { confirmation, deleting, confirm_delete_anyway }

class _DeleteDeviceDialogState extends State<DeleteDeviceDialog> {
  final PairedDevice device;

  _DeletionStage stage;
  String? _deletionError;

  _DeleteDeviceDialogState({required this.device})
      : stage = _DeletionStage.confirmation;

  @override
  Widget build(BuildContext context) {
    List<Widget> content;
    List<Widget> actions;

    switch (stage) {
      case _DeletionStage.confirmation:
        content = [
          Text(Intl.message(
              "Are you sure you want to delete device ${device.name}? This action can't be undone!",
              args: [device.name]))
        ];

        actions = [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(Intl.message("Cancel"))),
          Consumer2<ApiController, DeviceManager>(
              builder: (_, controller, manager, child) => TextButton(
                  onPressed: () {
                    setState(() {
                      stage = _DeletionStage.deleting;
                      _startDeletion(context, controller, manager);
                    });
                  },
                  child: Text(Intl.message("Continue")))),
        ];
        break;

      case _DeletionStage.deleting:
        content = [
          Text(Intl.message("Deleting device...")),
          LinearProgressIndicator()
        ];
        actions = [];
        break;

      case _DeletionStage.confirm_delete_anyway:
        content = [
          Text(Intl.message(
              "Failed to delete device ${device.name}: $_deletionError. "
              "You can remove the device from the app anyway, but this will "
              "not delete the user from the device!",
              args: [device.name, _deletionError!]))
        ];
        actions = [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(Intl.message("Cancel"))),
          Consumer<DeviceManager>(
              builder: (context, manager, child) => TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    manager.deregister(device);
                  },
                  child: Text(Intl.message("Delete anyway"))))
        ];
    }

    return AlertDialog(
      title: Text(Intl.message("Delete device")),
      content: SingleChildScrollView(
        child: ListBody(
          children: content,
        ),
      ),
      actions: actions,
    );
  }

  /// Sends the deletion request to the device and handles the response.
  ///
  /// If the response is successful, the dialog is popped from the navigator.
  /// In case of an error the error is displayed to the user.
  void _startDeletion(
      BuildContext context, ApiController controller, DeviceManager manager) {
    controller.send(device, DeleteUserRequest()).then((_) {
      Navigator.pop(context);
      manager.deregister(device);
    }, onError: (error) {
      setState(() {
        stage = _DeletionStage.confirm_delete_anyway;
        _deletionError = error?.toString() ?? Intl.message("Unknown error");
      });
    });
  }
}
