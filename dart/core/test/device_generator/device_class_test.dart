import 'package:test/test.dart';
import 'package:blackbird/blackbird.dart';
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
    test('property permutation getter', () {
      expect(device.calculatedProperty, significantNumber * 2);
    });
    test('property permutation setter', () {
      device.calculatedProperty = 3;
      expect(device.aProperty, 1);
    });
  });

  group('runtime', () {
    Map<Symbol, Object> map = {};
    map[#host] = Host.device();
    map[#aRuntimeDependency] = significantNumber;
    SimpleDevice otherDevice = SimpleDevice.device();
    otherDevice.aProperty = significantNumber;
    map[#otherDevice] = otherDevice;

    SimpleDevice d = SimpleDevice.device();
    d.aProperty = significantNumber;
    SimpleDevice device = d.implementation(map);

    test('set property raises exception', () {
      expect(() {
        device.aProperty = significantNumber;
      }, throwsException);
    });
    test('get property', () {
      expect(device.aProperty, significantNumber);
    });
    test('set module raises exception', () {
      expect(() {
        device.otherDevice = SimpleDevice.device();
      }, throwsException);
    });
    test('get module', () {
      expect(device.otherDevice, isNotNull);
      expect((device.otherDevice as SimpleDevice).aProperty, significantNumber);
    });
    test('get', () {
      expect(device.aRuntimeDependency, significantNumber);
    });
    test('runtime set raises error', () {
      expect(() {
        (device as dynamic).aRuntimeDependency = 1;
      }, throwsNoSuchMethodError);
    });
  });
}
