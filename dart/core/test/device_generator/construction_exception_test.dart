import 'package:test/test.dart';
import 'package:blackbird/blackbird.dart';
import 'simple_device.dart';

int significantNumber = 123456789;

main() {
  group('device', () {
    SimpleDevice device = SimpleDevice.device();

    ConstructionInfoException info;
    try {
      device.implementation(null);
    } on ConstructionInfoException catch (e) {
      info = e;
    }
    test('thrown', () {
      expect(info, isNotNull);
    });
    test('depenencies present', () {
      expect(info.dependencies.length, 3);
    });
    test('has correct dependencyTypes', () {
      expect(
          info[#host].type.first, 'asset:blackbird/lib/src/device.dart#Host');
      expect(info[#aRuntimeDependency].type.first, 'dart:core#int');
      expect(info[#otherDevice].type.first,
          'asset:blackbird/lib/src/device.dart#Device');
    });
    test('has correct dependencyAnnotations', () {
      expect(info[#host].annotations.length, 1);
      expect(info[#aRuntimeDependency].annotations.length, 1);
      expect(info[#otherDevice].annotations.length, 0);
    });
    test('annotation transferred correctly', () {
      expect(info[#aRuntimeDependency].annotations.first,
          SomeAnnotation('text', {'asdf': 123}));
    });
  });
}
