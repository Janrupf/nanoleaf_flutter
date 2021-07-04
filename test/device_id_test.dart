import 'package:flutter_test/flutter_test.dart';
import 'package:nanoleaf_flutter/nanoleaf/device/device_id.dart';

void main() {
  group("NanoleafId", () {
    test("Device id should deserialize and serialize the same", () {
      const ID_UNDER_TEST = "CB:CB:ED:15:7A:05";

      final id = NanoleafId(ID_UNDER_TEST);
      expect(id.toString(), ID_UNDER_TEST);
    });

    test("Device id should be comparable", () {
      const ID_UNDER_TEST_ONE = "CB:CB:ED:15:7A:05";
      const ID_UNDER_TEST_TWO = "CB:CB:ED:12:B6:F1";

      final idOneFirst = NanoleafId(ID_UNDER_TEST_ONE);
      final idOneSecond = NanoleafId(ID_UNDER_TEST_ONE);
      final idTwoFirst = NanoleafId(ID_UNDER_TEST_TWO);

      expect(idOneFirst, idOneSecond);
      expect(idOneFirst, isNot(equals(idTwoFirst)));
    });

    test("Device id should be convertible", () {
      const ID_UNDER_TEST = "CB:CB:ED:15:7A:05";
      final id = NanoleafId(ID_UNDER_TEST);

      expect(id[0], 0xCB);
      expect(id[1], 0xCB);
      expect(id[2], 0xED);
      expect(id[3], 0x15);
      expect(id[4], 0x7A);
      expect(id[5], 0x05);
    });
  });
}