import 'package:test/test.dart';
import 'simple_device.dart';

int significantNumber = 123456789;

main() {
  group('device', () {
    SimpleDevice device = SimpleDevice.device();

    test('set and get property', () {
      device.aProperty = significantNumber;
      expect(device.aProperty, significantNumber);
    });
    test('set and get module', () {
      device.otherDevice = SimpleDevice.device();
      (device.otherDevice as SimpleDevice).aProperty = significantNumber;
      expect(device.otherDevice != null, true);
      expect((device.otherDevice as SimpleDevice).aProperty, significantNumber);
    });
    test('runtime not gettable', () {
      expect(() {
        device.aRuntimeDependency;
      }, throwsException);
    });
    test('runtime not settable', () {
      expect(() {
        (device as dynamic).aRuntimeDependency = 1;
      }, throwsNoSuchMethodError);
    });
  }, tags: 'current');
}
