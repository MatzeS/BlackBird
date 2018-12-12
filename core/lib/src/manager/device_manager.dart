import 'package:blackbird/blackbird.dart';

// abstract class DeviceManager {
//   final Device device;
//   DeviceManager(this.device);

//   Host get currentHost;
//   bool get isRemoteHosted =>
//       currentHost != null && currentHost != Blackbird().localDevice;
//   bool get isLocallyHosted =>
//       currentHost != null && currentHost == Blackbird().localDevice;
//   bool get isAvailable => isRemoteHosted || isLocallyHosted;

//   Device get interfaceDevice;
//   Device get implementDevice;
// }

// class AgentManager extends DeviceManager {
//   Device localHandle;
//   AgentManager(Device device) : super(device);

//   Device get remoteHandle {
//     return null; //TODO
//   }

//   @override
//   Host get currentHost {
//     if (localHandle != null) return Blackbird().localDevice;
//     return remoteHandle?.host;
//   }

//   @override
//   Device get interfaceDevice {
//     if (localHandle != null) return localHandle;
//     if (remoteHandle != null) return remoteHandle;
//   }

//   @override
//   Device get implementDevice {
//     if (isRemoteHosted)
//       throw new Exception('cannot implement remote hosted device');

//     if (localHandle == null) localHandle = device.implementation();

//     return localHandle;
//   }
// }

// class HostManager extends DeviceManager {
//   HostManager(Host device) : super(device);

//   @override
//   Device get implementDevice =>
//       throw new Exception('cannot implement host devices');

//   Device get remoteHandle {
// // do netowrk connect and get RMI handle
//     throw new Exception('not yet implemented');
//   }

//   @override
//   Host get currentHost => device;

//   @override
//   Device get interfaceDevice => throw new Exception('not yet implemented');
// }

// class LocalDeviceManager extends DeviceManager {
//   Device localHandle;

//   LocalDeviceManager(Host device) : super(device) {
//     localHandle = device.implementation();
//   }

//   @override
//   Device get implementDevice => localHandle;
//   @override
//   Device get interfaceDevice => implementDevice;
//   @override
//   Host get currentHost => device;
// }
