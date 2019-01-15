import 'package:test/test.dart';
import '../device_generator/simple_device.dart';

main() {
  test('serialization', () {
    SimpleDevice device = SimpleDevice.device();
    device.aProperty = 1234;
    Map<String, dynamic> serialized = device.toJson();

    expect(serialized.length, 2); // 1 property + class identifier
    expect(serialized['aProperty'], 1234);
  });
}
