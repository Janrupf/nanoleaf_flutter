import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';
import 'package:nanoleaf_flutter/components/dialog/error_dialog.dart';
import 'package:nanoleaf_flutter/nanoleaf/device/device_base.dart';
import 'package:nanoleaf_flutter/nanoleaf/device/device_id.dart';
import 'package:nanoleaf_flutter/nanoleaf/device/paired_device.dart';
import 'package:nanoleaf_flutter/nanoleaf/device_manager.dart';
import 'package:nanoleaf_flutter/nanoleaf/openapi/api_controller.dart';
import 'package:nanoleaf_flutter/nanoleaf/openapi/v1/add_user.dart';
import 'package:nanoleaf_flutter/nanoleaf/openapi/v1/get_discovery_info.dart';
import 'package:nanoleaf_flutter/views/base.dart';
import 'package:provider/provider.dart';

/// Container for arguments passed to the [AddDeviceView].
class AddDeviceArguments {
  /// The address of the device to add.
  final InternetAddress address;

  /// The port of the device to add.
  final int port;

  /// The initial device name, may be null.
  String? name;

  /// The device id, if known
  NanoleafId? id;

  AddDeviceArguments(this.address, this.port, this.name, this.id);
}

/// View which is used to add devices.
class AddDeviceView extends StatefulWidget {
  @override
  _AddDeviceViewState createState() => _AddDeviceViewState();
}

class _AddDeviceViewState extends State<AddDeviceView> {
  int _pairCountdown = 0;
  String _currentStatus = "";
  String? _lastFailure;

  Timer? _countdownTimer;

  @override
  void dispose() {
    if (_countdownTimer != null) {
      _countdownTimer!.cancel();
    }

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance!
        .addPostFrameCallback((timeStamp) => _stepCountdown());
  }

  @override
  Widget build(BuildContext context) => FullScreenView(
      title: Intl.message("Pair device"),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              Intl.message(
                  "Press and hold the power button on your device for 5 to 7 "
                  "seconds until the LED starts blinking in a pattern."),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 35,
              child: _countdownTimer != null
                  ? Text(Intl.message(_currentStatus))
                  : CircularProgressIndicator(),
            ),
          ],
        ),
      ));

  /// Called when 1 second has passed and the countdown is in progress or the
  /// countdown needs to be restarted.
  void _stepCountdown() {
    if (_pairCountdown <= 1) {
      if (_countdownTimer != null) {
        // Cancel and erase timer
        _countdownTimer!.cancel();
        _countdownTimer = null;
      }

      _tryPairNow();
    } else {
      if (_countdownTimer == null) {
        // Start the timer anew
        _countdownTimer =
            Timer.periodic(Duration(seconds: 1), (_) => _stepCountdown());
      }

      _pairCountdown--;

      setState(() {
        if (_lastFailure != null) {
          // Indicate the last error reason
          _currentStatus = Intl.message(
              "$_lastFailure, trying again in $_pairCountdown seconds.",
              args: [_lastFailure!, _pairCountdown]);
        } else {
          // No reason available, just count down
          _currentStatus = Intl.message(
              "Trying to pair in $_pairCountdown seconds.",
              args: [_pairCountdown]);
        }
      });
    }
  }

  /// Tries to pair with the device now, this assumes that [_countdownTimer] is
  /// cancelled.
  void _tryPairNow() async {
    setState(() {
      _currentStatus = Intl.message("Pairing...");
    });

    // Retrieve the arguments which have been passed
    final AddDeviceArguments arguments =
        ModalRoute.of(context)!.settings.arguments as AddDeviceArguments;

    final controller = context.read<ApiController>();
    final device = DeviceBase(arguments.address, arguments.port);

    if (arguments.id == null) {
      // The ID of the device is not known yet, retrieve it now
      final request = GetDiscoveryInfoRequest();
      bool ok = await controller.send(device, request).then((value) {
        // Successfully queried id
        arguments.id = value.id;
        return true;
      }).catchError(((error) => showDialog(
              // Show an error dialog because retrieving the device id failed
              context: context,
              builder: (context) => ErrorDialog(
                  title: Intl.message("Pairing error"),
                  message: Intl.message("Failed to retrieve device id"),
                  error: error))
          .then((value) => false))); // return false to abort pairing

      if (!ok) {
        return;
      }
    }

    // Send the request to actually register
    final request = AddUserRequest();

    await controller.send(device, request).then((token) {
      _handleToken(
          address: arguments.address,
          port: arguments.port,
          name: arguments.name,
          token: token,
          id: arguments.id!);
    }, onError: (error) {
      setState(() => _lastFailure = error.toString());
      _pairCountdown = 11;
      _stepCountdown();
    });
  }

  /// Handles the successful retrieval of a token
  void _handleToken(
      {required InternetAddress address,
      required int port,
      String? name,
      required String token,
      required NanoleafId id}) {
    showDialog<String>(
        context: context,
        barrierDismissible: false,
        builder: (context) => _DeviceNameDialog(initial: name)).then((name) {
      final deviceManager = context.read<DeviceManager>();
      deviceManager.register(PairedDevice(
          address: address, port: port, name: name!, id: id, token: token));

      // Pop all routes and navigate back to start page
      Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
    });
  }
}

/// Dialog shown to the user in order to set a device name.
class _DeviceNameDialog extends StatefulWidget {
  final String? initial;

  _DeviceNameDialog({Key? key, this.initial}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DeviceNameDialogState();
}

class _DeviceNameDialogState extends State<_DeviceNameDialog> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController;

  _DeviceNameDialogState({String? initial})
      : _nameController = TextEditingController(text: initial);

  @override
  Widget build(BuildContext context) => AlertDialog(
        title: Text(Intl.message("Device name")),
        content: Form(
            key: _formKey,
            child: Wrap(
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                      icon: Icon(Icons.label),
                      hintText: Intl.message("The name of the device"),
                      labelText: Intl.message("Device name")),
                  validator: (value) => (value != null && value.length > 3)
                      ? null
                      : Intl.message(
                          "Please enter a name with a length greater than 3"),
                )
              ],
            )),
        actions: [
          TextButton(
            child: Text(Intl.message("Ok")),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                Navigator.pop(context, _nameController.text);
              }
            },
          ),
        ],
      );
}
