import 'package:blackbird/blackbird.dart';
import 'package:rmi/remote_method_invocation.dart';
import 'package:rmi/proxy.dart';
import 'package:test/test.dart';
// part 'simple_device_test.g.dart';

// class I2CMaster {}

// abstract class SimpleDevice implements Device {
//   int propertyField;

//   SimpleDevice._();
//   factory SimpleDevice.device(int propertyField) =>
//       _$SimpleDeviceDevice(propertyField);

//   @RuntimeDependency() // provided through...
//   I2CMaster master;

//   // @RuntimeState()
//   // Map<int, int> registerBuffer;

//   void executiveMethod() {
//     print('executive');
//   }
// }

// abstract class InheritingDevice extends SimpleDevice {
//   InheritingDevice() : super._();
//   factory InheritingDevice.device() => _$InheritingDeviceDevice();
// }

main() {
  test('simple implementation', () {
    // SimpleDevice device = SimpleDevice.device(1234);
    // expect(device.propertyField, 1234);
    // Device deviceImplementation = device.implementation(null);
    // SimpleDevice implementation = deviceImplementation as SimpleDevice;
    // expect(implementation.propertyField, 1234);
    // implementation.executiveMethod();

    // device.executiveMethod();
  });
}
