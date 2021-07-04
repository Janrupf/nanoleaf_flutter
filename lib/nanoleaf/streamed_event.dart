import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:nanoleaf_flutter/models/panel_info.dart';
import 'package:nanoleaf_flutter/util/serializers.dart';

import 'openapi/client/sse_io_client.dart';

/// Device event stream.
class EventStream {
  static Stream<StreamedEvent> transform(Stream<SSEEvent> stream) {
    return stream.transform(
        StreamTransformer.fromHandlers(handleData: (sseEvent, sink) async {
      // Decode the value as Json
      final value = await compute(jsonDecode, sseEvent.data);

      // The decoded data should have the following format:
      // {
      //   "events": [
      //     {
      //       "attr": 2,
      //       "value": ...
      //     }
      //   ]
      // }

      if (!(value is Map<String, dynamic>)) {
        // Root is not an object
        sink.addError(InvalidEventFormatError(
            "Expected parsed Json to yield a Map<String, dynamic>,"
            " but got ${value.runtimeType} instead"));
        return;
      }

      final dynamic events = value["events"];
      if (events == null) {
        // Missing the events field entirely
        sink.addError(InvalidEventFormatError(
            "Parsed Json did not contain an 'events' field"));
        return;
      } else if (!(events is List<dynamic>)) {
        // The events field has an invalid type
        sink.addError(InvalidEventFormatError(
            "Expected 'events' field to be a List<dynamic>, "
            "but got ${events.runtimeType} instead"));
        return;
      }

      for (final event in events) {
        if (!(event is Map<String, dynamic>)) {
          // Events need to be objects themself
          sink.addError(InvalidEventFormatError(
              "Expected value in 'events' to be of type Map<String, dynamic>, "
              "but got ${event.runtimeType} instead"));
          continue;
        }

        final attr = event["attr"];
        if (attr == null) {
          // Missing the attr field
          sink.addError(InvalidEventFormatError(
              "Object in 'events' did not contain an 'attr' field"));
          continue;
        } else if (!(attr is int)) {
          // Attr field has an invalid type
          sink.addError(InvalidEventFormatError(
              "Expected 'attr' field of object in 'events' to be an int, "
              "but got ${attr.runtimeType} instead"));
          continue;
        }

        final value = event["value"];
        if (value == null) {
          // Missing the value field
          sink.addError(InvalidEventFormatError(
              "Object in 'events' did not contain a 'value' field"));
          continue;
        }

        switch (sseEvent.id) {
          case 1:
            _parseStateEvent(attr, value, sink);
            break;

          case 2:
            _parseLayoutEvent(attr, value, sink);
            break;

          case 3:
            _parseEffectEvent(attr, value, sink);
            break;

          case 4:
            print("Ignoring touch event,"
                " because touch handling is not implemented yet");
            break;

          default:
            print("Unknown event id ${sseEvent.id}");
            break;
        }
      }
    }));
  }

  /// Processes a state event
  static void _parseStateEvent(
      int attr, dynamic value, EventSink<StreamedEvent> sink) {
    switch (attr) {
      case 1:
        if (!(value is bool)) {
          sink.addError(InvalidEventFormatError(
              "Expected 'value' of 'on' attribute to be a bool, but got"
              " ${value.runtimeType} instead"));
          return;
        }
        sink.add(StreamedOnStateEvent(value));
        return;

      case 2:
        if (!(value is int)) {
          sink.addError(InvalidEventFormatError(
              "Expected 'value' of 'brightness' attribute to be an int, but got"
              " ${value.runtimeType} instead"));
          return;
        }
        sink.add(StreamedBrightnessStateEvent(value));
        return;

      case 3:
        if (!(value is int)) {
          sink.addError(InvalidEventFormatError(
              "Expected 'value' of 'hue' attribute to be an int, but got"
              " ${value.runtimeType} instead"));
          return;
        }
        sink.add(StreamedHueStateEvent(value));
        return;

      case 4:
        if (!(value is int)) {
          sink.addError(InvalidEventFormatError(
              "Expected 'value' of 'saturation' attribute to be an int,"
              " but got ${value.runtimeType} instead"));
          return;
        }
        sink.add(StreamedSaturationStateEvent(value));
        return;

      case 5:
        if (!(value is int)) {
          sink.addError(InvalidEventFormatError(
              "Expected 'value' of 'ct' (color temperature) attribute to be an"
              " int, but got ${value.runtimeType} instead"));
          return;
        }
        sink.add(StreamedColorTemperatureStateEvent(value));
        return;

      case 6:
        if (!(value is String)) {
          sink.addError(InvalidEventFormatError(
              "Expected 'value' of 'colorMode' attribute to be a String,"
              " but got ${value.runtimeType} instead"));
          return;
        }

        final mode = ColorModeExt.tryFromString(value);
        if (mode == null) {
          sink.addError(InvalidEventFormatError("Unknown color mode '$mode'"));
        } else {
          sink.add(StreamedColorModeStateEvent(mode));
        }

        return;

      default:
        print("Unknown state event attr $attr");
        break;
    }
  }

  /// Processes a layout event
  static void _parseLayoutEvent(
      int attr, dynamic value, EventSink<StreamedEvent> sink) {
    switch (attr) {
      case 1:
        if (!(value is Map<String, dynamic>)) {
          sink.addError(InvalidEventFormatError(
              "Expected 'value' of layout attribute to be a Map<String, dynamic>, "
              "but got ${value.runtimeType} instead"));
        } else {
          // Explicit type required so the compiler can infer the type parameter
          // of 'deserializeDecoded'
          final Future<LayoutData> computed =
              compute(deserializeDecoded, value);

          computed.then((value) => sink.add(StreamedLayoutEvent(value)),
              onError: sink.addError);
        }
        break;

      case 2:
        if (!(value is int)) {
          sink.addError(InvalidEventFormatError(
              "Expected 'value' of 'globalOrientation' attribute to be an int, "
              "but got ${value.runtimeType} instead"));
          return;
        }
        sink.add(StreamedOrientationChangeEvent(value));
        return;

      default:
        print("Unknown layout event attr $attr");
        break;
    }
  }

  /// Processes an effect event
  static void _parseEffectEvent(
      int attr, dynamic value, EventSink<StreamedEvent> sink) {
    if (attr == 1) {
      if (!(value is String)) {
        sink.addError(InvalidEventFormatError(
            "Expected value of 'effect' attribute to be a String, "
            "but got ${value.runtimeType} instead"));
        return;
      }

      sink.add(StreamedEffectChangeEvent(value));
    } else {
      print("Unknown effect event attr $attr");
    }
  }
}

/// Base class for events sent by the SSE events stream.
abstract class StreamedEvent<T> {
  final T value;

  StreamedEvent(this.value);
}

/// Event streamed in the SSE events stream indicating some change in the device
/// configuration.
class _StreamedEvent<T> extends StreamedEvent<T> {
  _StreamedEvent(T value) : super(value);

  @override
  String toString() => "$runtimeType($value)";
}

/// Helper mixin for type aliasing.
mixin _AsAlias {}

/// The "on" (power) state of the device changed
class StreamedOnStateEvent = _StreamedEvent<bool> with _AsAlias;

/// The brightness of the device changed.
class StreamedBrightnessStateEvent = _StreamedEvent<int> with _AsAlias;

/// The hue of the device changed.
class StreamedHueStateEvent = _StreamedEvent<int> with _AsAlias;

/// The saturation of the device changed.
class StreamedSaturationStateEvent = _StreamedEvent<int> with _AsAlias;

/// The color temperature of the device changed.
class StreamedColorTemperatureStateEvent = _StreamedEvent<int> with _AsAlias;

/// The color mode of the device changed.
class StreamedColorModeStateEvent = _StreamedEvent<ColorMode> with _AsAlias;

/// The layout of the device changed.
class StreamedLayoutEvent = _StreamedEvent<LayoutData> with _AsAlias;

/// The global orientation of the device changed.
class StreamedOrientationChangeEvent = _StreamedEvent<int> with _AsAlias;

/// The effect of the device changed.
class StreamedEffectChangeEvent = _StreamedEvent<String> with _AsAlias;
