import 'package:blackbird_core/blackbird.dart';
import 'package:rmi/remote_method_invocation.dart';
import 'package:rmi/proxy.dart';

part 'simple_device_test.g.dart';

class I2CMaster {}

abstract class SimpleDevice extends _$SimpleDevice implements Device {
  int propertyField;

  SimpleDevice(this.propertyField);
  factory SimpleDevice.device(int propertyField) =>
      _$SimpleDeviceDevice(propertyField);

  @RuntimeDependency() // provided through...
  I2CMaster master;

  // @RuntimeState()
  // Map<int, int> registerBuffer;

  void executiveMethod() {
    print('executive');
  }
}
