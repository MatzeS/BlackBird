import 'package:blackbird/blackbird.dart';
import 'package:blackbird/device.dart';

abstract class DeviceManager {
  final Device device;
  DeviceManager(this.device);

  Host get currentHost;
  bool get isRemoteHosted =>
      currentHost != null && currentHost != Blackbird().localDevice;
  bool get isLocallyHosted =>
      currentHost != null && currentHost == Blackbird().localDevice;
  bool get isAvailable => isRemoteHosted || isLocallyHosted;

  Device get interfaceDevice;
  Device get implementDevice;
}

class AgentManager extends DeviceManager {
  Device localHandle;
  AgentManager(Device device) : super(device);

  Device get remoteHandle {
    throw new Exception('not implemented yet'); //TODO
  }

  @override
  Host get currentHost {
    if (localHandle != null) return Blackbird().localDevice;

    return remoteHandle?.host;
  }

  @override
  Device get interfaceDevice {
    if (localHandle != null) return localHandle;
    if (remoteHandle != null) return remoteHandle;
  }

  @override
  Device get implementDevice {
    if (isRemoteHosted)
      throw new Exception('cannot implement remote hosted device');

//CONSTRUCT IT
    if (localHandle == null) {
      // localHandle = device.implementativn();
    }

    return localHandle;
  }
}

class HostManager extends DeviceManager {
  HostManager(Host device) : super(device);

  @override
  Device get implementDevice =>
      throw new Exception('cannot implement host devices');

  Device get remoteHandle {
// do netowrk connect and get RMI handle
    throw new Exception('not yet implemented');
  }

  @override
  Host get currentHost => device;

  @override
  Device get interfaceDevice => remoteHandle;
}

class LocalDeviceManager extends DeviceManager {
  Device localHandle;

  LocalDeviceManager(Host device) : super(device) {
    //TODO
  }

  @override
  Device get implementDevice => localHandle;
  @override
  Device get interfaceDevice => implementDevice;
  @override
  Host get currentHost => device;
}
