import 'package:blackbird/blackbird.dart';
import 'construction.dart';

/// Manages a device implementation
///
/// In particular the manager ensures there is only one device implementation object in the cluster.
/// It either provides a handle of the implementation object on a remote host (RMI)
/// or constructs the implementation object itself.
abstract class DeviceManager {
  final Blackbird blackbird;
  final Device device;
  DeviceManager(this.device, this.blackbird);

  Host get currentHost;
  bool get isRemoteHosted =>
      currentHost != null && currentHost != blackbird.localDevice;
  bool get isLocallyHosted =>
      currentHost != null && currentHost == blackbird.localDevice;
  bool get isAvailable => isRemoteHosted || isLocallyHosted;

  Device get interfaceDevice;
  Device get implementDevice;
}

class AgentManager extends ConstructionManager {
  Device localHandle;
  AgentManager(Device device, Blackbird blackbird) : super(device, blackbird);

  Device get remoteHandle {
    //    throw new Exception('not implemented yet'); //TODO
    return null;
  }

  @override
  Host get currentHost {
    if (localHandle != null) return blackbird.localDevice;

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
      throw new Exception('cannot implement remote hosted device'); //TODO
    if (isLocallyHosted) return localHandle;

    //CONSTRUCT IT
    localHandle = constructImplementation();

    return localHandle;
  }
}

class HostManager extends DeviceManager {
  HostManager(Host device, Blackbird blackbird) : super(device, blackbird);

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

  LocalDeviceManager(Host device, Blackbird blackbird)
      : super(device, blackbird) {
    //TODO
  }

  @override
  Device get implementDevice => localHandle;
  @override
  Device get interfaceDevice => implementDevice;
  @override
  Host get currentHost => device;
}
