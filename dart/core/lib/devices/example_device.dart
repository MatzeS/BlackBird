import '../src/device.dart';
import 'package:blackbird/blackbird.dart';

part 'example_device.g.dart';

abstract class ADevice extends Device {
  String identifier;
  ADevice._();
  factory ADevice() => _$ADeviceDevice();

  Future<void> executive(String data) async {
    print('on $host device $identifier, executive: $data');
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
