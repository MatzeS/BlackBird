import 'package:rmi/remote_method_invocation.dart';
import 'src/manager/device_manager.dart';

import 'src/devices/device.dart';
export 'src/devices/device.dart';

class RuntimeDependency {
  const RuntimeDependency();
}

class ImplementationBuilder {
  List<Device> runtimeDependecies;
}

class Blackbird {
  //todo singleton

  Blackbird();

  R interfaceDevice<R extends Device>(R device) {
    return null;
  }

  R implementDevice<R extends Device>(R device) {
    return null;
  }

  Map<Device, DeviceManager> managers;
}
