import 'package:blackbird_core/blackbird.dart';

class DeviceManager {
  final Device device;
  DeviceManager(this.device);
  HostDevice get currentHost {}
  bool get isHosted {}
  bool get isRemoteHosted {}
  bool get isLocallyHosted {}
}

// class AgentManager extends DeviceManager {
//   construct() {
//     ImplementationBuilder builder = device.implementationBuilder;

//     for (Device dependency in builder.runtimeDependecies) {
//       DeviceManager dependencyManager = Blackbird().managers[dependency];
//       if (dependencyManager.isRemoteHosted)
//         throw new Exception('remote hosted'); //TODO
//     }

//     // all dependencies not or locally hosted

//     Blackbird().implement()
//   }

// }

// class HostDeviceManager extends DeviceManager {}

// class LocalDeviceManager extends DeviceManager {}
