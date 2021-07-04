import 'dart:typed_data';

/// Nanoleaf device id representation.
class NanoleafId {
  final Uint8List _data;

  NanoleafId._(this._data);

  /// Parses a Nanoleaf device id from [id].
  factory NanoleafId(String id) {
    final parts = id.split(':');
    if(parts.length != 6) {
      throw ArgumentError("A nanoleaf id must consist of exactly 6 parts");
    }

    final data = Uint8List(6);

    for (var i = 0; i < 6; i++) {
      data[i] = int.parse(parts[i], radix: 16).toUnsigned(8);
    }

    return NanoleafId._(data);
  }

  /// Retrieves the byte at [index].
  int at(int index) {
    return _data[index];
  }

  /// Retrieves the byte at [index].
  int operator[](int index) {
    return at(index);
  }

  @override
  bool operator ==(Object other) {
    if(!(other is NanoleafId)) {
      return false;
    }

    for(var i = 0; i < 6; i++) {
      if(_data[i] != other._data[i]) {
        return false;
      }
    }

    return true;
  }

  @override
  int get hashCode => _data.hashCode;

  @override
  String toString() {
    final buffer = StringBuffer();

    for (var i = 0; i < 6; i++) {
      buffer.write(_data[i].toRadixString(16).toUpperCase().padLeft(2, '0'));
      if (i != 5) {
        buffer.write(':');
      }
    }

    return buffer.toString();
  }
}
