import 'package:rmi/remote_method_invocation.dart';
import '../manager/device_manager.dart';
import 'package:blackbird_core/blackbird.dart';
import 'package:rmi/proxy.dart';

part 'device.g.dart';

abstract class Device implements RmiTarget {
  const Device();
  Device implementation();
  Device getRemote(Context context, String uuid);
}

abstract class Host implements Device {
  Host();
  factory Host.device() => _$HostDevice();
}
