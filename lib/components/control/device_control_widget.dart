import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nanoleaf_flutter/nanoleaf/device/paired_device.dart';
import 'package:nanoleaf_flutter/nanoleaf/openapi/api_controller.dart';
import 'package:nanoleaf_flutter/nanoleaf/openapi/v1/request.dart';
import 'package:nanoleaf_flutter/nanoleaf/streamed_event.dart';
import 'package:nanoleaf_flutter/util/value_with_timeout.dart';
import 'package:provider/provider.dart';

/// Factory type for [ApiRequestV1]s for a type [V]
typedef ApiRequestV1 RequestFactory<V>(V value);

/// Builder callback for stateful widgets
typedef Widget ControlWidgetBuilder<V>(
    BuildContext context, V value, ValueChanged<V> onChanged);

/// Widget used for operation which manipulate the state of a device.
class DeviceControlWidget<V, E extends StreamedEvent<V>>
    extends StatefulWidget {
  final PairedDevice device;
  final RequestFactory<V> requestFactory;
  final ControlWidgetBuilder<V> builder;
  final V initialValue;
  final Stream<StreamedEvent> eventStream;

  DeviceControlWidget(
      {required this.device,
      required this.requestFactory,
      required this.builder,
      required this.initialValue,
      required this.eventStream});

  @override
  State<StatefulWidget> createState() =>
      _DeviceControlWidgetState<V, E>(initialValue);
}

class _DeviceControlWidgetState<V, E extends StreamedEvent<V>>
    extends State<DeviceControlWidget<V, E>> {
  int _frozenCount = 0;

  final ValueWithTimeout<V> _value =
      ValueWithTimeout(timeout: Duration(milliseconds: 200));

  V currentValue;
  StreamSubscription<StreamedEvent<dynamic>>? _subscription;

  _DeviceControlWidgetState(this.currentValue);

  @override
  void initState() {
    super.initState();
    _subscription = widget.eventStream.listen((event) {
      if (event is E) {
        setState(() {
          currentValue = event.value;
        });
      }
    });
  }

  @override
  void dispose() {
    _subscription!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<ApiController>(context, listen: false);
    return widget.builder(context, currentValue,
        (value) => _onChanged(context, controller, value));
  }

  // Called when the value of the underlying component has changed
  void _onChanged(BuildContext context, ApiController controller, V value) {
    setState(() {
      currentValue = value;
    });

    _value.renew(value, () => _sendUpdate(controller, value));
  }

  void _sendUpdate(ApiController controller, V value) {
    // Freeze as a request is in progress
    _frozenCount++;

    controller
        .send(widget.device, widget.requestFactory(value))
        .then((_) => _frozenCount--, onError: (error) {
      print(error);
      _frozenCount--;
    });
  }
}
