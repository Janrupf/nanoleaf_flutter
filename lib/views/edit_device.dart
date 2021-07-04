import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nanoleaf_flutter/components/control/device_control_widget.dart';
import 'package:nanoleaf_flutter/components/dialog/device_info_dialog.dart';
import 'package:nanoleaf_flutter/models/panel_info.dart';
import 'package:nanoleaf_flutter/nanoleaf/device/paired_device.dart';
import 'package:nanoleaf_flutter/nanoleaf/openapi/api_controller.dart';
import 'package:nanoleaf_flutter/nanoleaf/openapi/v1/get_all_panel_info.dart';
import 'package:nanoleaf_flutter/nanoleaf/openapi/v1/open_events_stream.dart';
import 'package:nanoleaf_flutter/nanoleaf/openapi/v1/select_effect.dart';
import 'package:nanoleaf_flutter/nanoleaf/openapi/v1/set_state.dart';
import 'package:nanoleaf_flutter/nanoleaf/streamed_event.dart';
import 'package:nanoleaf_flutter/util/color_ext.dart';
import 'package:nanoleaf_flutter/util/value_with_timeout.dart';
import 'package:nanoleaf_flutter/views/base.dart';
import 'package:provider/provider.dart';

/// The arguments passed to the view.
class EditDeviceViewArguments {
  final PairedDevice device;

  EditDeviceViewArguments({required this.device});
}

class EditDeviceView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _EditDeviceViewState();
}

enum _EditStage { connecting, connectionFailed, connected }

class _EditDeviceViewState extends State<EditDeviceView> {
  _EditStage _stage = _EditStage.connecting;

  String? _connectionFailure;
  PanelInfo? _panelInfo;

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as EditDeviceViewArguments;

    final Widget child;
    final List<Widget>? actions;

    switch (_stage) {
      case _EditStage.connecting:
        child = _ConnectingInfo();
        _startConnecting(context, arguments.device);
        actions = [];
        break;

      case _EditStage.connectionFailed:
        child = _ConnectionFailedInfo(message: _connectionFailure!);
        actions = [];
        break;

      case _EditStage.connected:
        child = SingleChildScrollView(
          child: _EditDeviceViewInner(
              device: arguments.device, initialInfo: _panelInfo!),
        );
        actions = [
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () => showDialog(
                context: context,
                builder: (context) => DeviceInfoDialog(panelInfo: _panelInfo!)),
          )
        ];
        break;
    }

    return FullScreenView(
      title: Intl.message("Edit device ${arguments.device.name}",
          args: [arguments.device.name]),
      child: child,
      actions: actions,
    );
  }

  /// Starts retrieving the panel info from the device
  void _startConnecting(BuildContext context, PairedDevice device) {
    final controller = Provider.of<ApiController>(context);

    controller.send(device, GetAllPanelInfoRequest()).then((value) {
      if (mounted) {
        setState(() {
          _panelInfo = value;
          _stage = _EditStage.connected;
        });
      }
    }, onError: (error) {
      print(error);

      if (mounted) {
        setState(() {
          final unknownError = Intl.message("Unknown error");

          _connectionFailure = Intl.message(
              "Failed to connect to the device: ${error ?? unknownError}",
              args: [error ?? unknownError]);
          _stage = _EditStage.connectionFailed;
        });
      }
    });
  }
}

/// Widget displayed while information is being fetched from the device
class _ConnectingInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              Intl.message("Fetching information from the device..."),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(height: 35, child: CircularProgressIndicator()),
          ],
        ),
      );
}

/// Widget displayed when the information fetching fails
class _ConnectionFailedInfo extends StatelessWidget {
  final String message;

  _ConnectionFailedInfo({required this.message});

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.cloud_off,
              size: 100,
            ),
            Text(
              message,
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      );
}

/// Widget displayed when the information has been fetched and the user can
/// start editing the device
class _EditDeviceViewInner extends StatelessWidget {
  final PairedDevice device;
  final PanelInfo initialInfo;
  final ValueWithTimeout<HSVColor> color;

  _EditDeviceViewInner(
      {Key? key, required this.device, required this.initialInfo})
      : color = ValueWithTimeout(timeout: Duration(milliseconds: 500)),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 800),
        child: Consumer<ApiController>(
          builder: (context, controller, child) {
            final eventStream = EventStream.transform(controller
                .openEventStream(device, OpenEventsStreamRequest(state: true)));

            return _buildControlColumn(context, eventStream);
          },
        ),
      ),
    );
  }

  Widget _buildControlColumn(
      BuildContext context, Stream<StreamedEvent> eventStream) {
    return Column(
      children: [
        Text(
          Intl.message("Select device color"),
          style: TextStyle(fontSize: 30),
        ),
        ColorPicker(
          pickersEnabled: {
            ColorPickerType.accent: false,
            ColorPickerType.primary: false,
            ColorPickerType.wheel: true
          },
          onColorChanged: (newColor) {
            final hsv = newColor.toHSV();

            color.renew(
                hsv, () => _sendUpdate(context, SetStateRequest.color(hsv)));
          },
        ),
        DeviceControlWidget<bool, StreamedOnStateEvent>(
            device: device,
            requestFactory: SetStateRequest.on,
            builder: (context, value, onChanged) =>
                SwitchListTile(value: value, onChanged: onChanged),
            initialValue: initialInfo.state.on.value,
            eventStream: eventStream),
        ListTile(
          title: Text(Intl.message("Brightness")),
          subtitle: DeviceControlWidget<int, StreamedBrightnessStateEvent>(
            device: device,
            requestFactory: SetStateRequest.brightness,
            builder: (context, value, onChanged) => Slider(
                value: value.toDouble(),
                min: initialInfo.state.brightness.min.toDouble(),
                max: initialInfo.state.brightness.max.toDouble(),
                onChanged: (value) => onChanged(value.toInt())),
            initialValue: initialInfo.state.brightness.value,
            eventStream: eventStream,
          ),
        ),
        ListTile(
            title: Text(Intl.message("Color temperature")),
            subtitle:
                DeviceControlWidget<int, StreamedColorTemperatureStateEvent>(
                    device: device,
                    requestFactory: SetStateRequest.colorTemperature,
                    builder: (context, value, onChanged) => Slider(
                          value: value.toDouble(),
                          min:
                              initialInfo.state.colorTemperature.min.toDouble(),
                          max:
                              initialInfo.state.colorTemperature.max.toDouble(),
                          onChanged: (value) => onChanged(value.toInt()),
                        ),
                    initialValue: initialInfo.state.colorTemperature.value,
                    eventStream: eventStream)),
        ListTile(
            title: Text(Intl.message("Effect")),
            subtitle: DeviceControlWidget<String, StreamedEffectChangeEvent>(
              device: device,
              requestFactory: (v) => SetEffectRequest(v),
              builder: (context, value, onChanged) => DropdownButton(
                items: [
                  initialInfo.effects.effectsList,
                  ["*Solid*"]
                ]
                    .expand((e) => e)
                    .map((effect) =>
                        DropdownMenuItem(child: Text(effect), value: effect))
                    .toList(growable: false),
                value: value,
                onChanged: (String? s) => onChanged(s!),
              ),
              initialValue: initialInfo.effects.select,
              eventStream: eventStream,
            ))
      ],
    );
  }

  void _sendUpdate(BuildContext context, SetStateRequest request) {
    final controller = Provider.of<ApiController>(context, listen: false);
    controller.send(device, request);
  }
}
