import '../src/device.dart';
import 'package:blackbird/blackbird.dart';

part 'example_device.g.dart';

abstract class ADevice extends Device {
  String identifier;
  ADevice();
  factory ADevice.device() => _$ADeviceDevice();

  Future<void> executive(String data) async {
    print('well this is going well $identifier, $data');
  }

  @Property()
  operator ==(Object other) => other is ADevice;

  @Ignore()
  String toString() => 'ADevice[$identifier]';

  @Ignore()
  int get hashCode => 1;

  /// This is required for RMI
  static ADevice getRemote(Context context, String uuid) =>
      _$ADeviceRmi.getRemote(context, uuid);
}
