import 'dart:io';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'address_with_port.g.dart';

/// Model representing an IP address with port information.
abstract class AddressWithPort
    implements Built<AddressWithPort, AddressWithPortBuilder> {
  @BuiltValueSerializer(custom: true)
  static Serializer<AddressWithPort> get serializer => AddressWithPortSerializer();

  /// The address itself.
  InternetAddress get address;

  /// The port of the address.
  int get port;

  AddressWithPort._();

  factory AddressWithPort([void Function(AddressWithPortBuilder)? updates]) =
      _$AddressWithPort;
}

/// Custom serializer for AddressWithPort.
class AddressWithPortSerializer
    implements PrimitiveSerializer<AddressWithPort> {
  @override
  AddressWithPort deserialize(
      Serializers serializers, Object serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = AddressWithPortBuilder();
    final data = serialized as String;

    final separatorIndex = data.lastIndexOf(':');
    result.address = InternetAddress(data.substring(0, separatorIndex));
    result.port = int.parse(data.substring(separatorIndex + 1), radix: 10);

    return result.build();
  }

  @override
  Iterable<Object> serialize(Serializers serializers, AddressWithPort object,
      {FullType specifiedType = FullType.unspecified}) {
    return ["${object.address.toString()}:${object.port}"];
  }

  @override
  Iterable<Type> get types => BuiltList([AddressWithPort, _$AddressWithPort]);

  @override
  String get wireName => "AddressWithPort";
}
