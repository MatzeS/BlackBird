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

  Future<Host> get currentHost;
  Future<bool> get isRemoteHosted async =>
      await currentHost != null && await currentHost != blackbird.localDevice;
  Future<bool> get isLocallyHosted async =>
      await currentHost != null && await currentHost == blackbird.localDevice;
  Future<bool> get isAvailable async =>
      await isRemoteHosted || await isLocallyHosted;

  Future<Device> get interfaceDevice;
  Future<Device> get implementDevice;
}

class AgentManager extends ConstructionManager {
  Device localHandle;
  AgentManager(Device device, Blackbird blackbird) : super(device, blackbird);

  Future<Device> get remoteHandle async {
    if (blackbird.localDevice.port == 2002) return null;

    List<Future<Device>> handleFutureList = blackbird.hosts
        .map((h) => h.getRemoteHandle(device))
        .map((f) async => await f)
        .where((handle) => handle != null)
        .toList();
    List<Device> handleList = await Future.wait(handleFutureList);
    if (handleList.isEmpty) return null;
    Device handle = handleList.single;
    return handle;
  }

  @override
  Future<Host> get currentHost async {
    if (localHandle != null) return blackbird.localDevice;

    return (await remoteHandle)?.host;
  }

  @override
  Future<Device> get interfaceDevice async {
    if (localHandle != null) return localHandle;
    if (remoteHandle != null) return await remoteHandle;
    //TODO
    throw new Exception('not fully implemented?');
  }

  @override
  Future<Device> get implementDevice async {
    print("implementing $device on ${blackbird.localDevice}");
    if (await isRemoteHosted)
      throw new Exception('cannot implement remote hosted device'); //TODO
    if (await isLocallyHosted) return localHandle;

    print('construction');
    //CONSTRUCT IT
    localHandle = constructImplementation();

    return localHandle;
  }
}

class LocalDeviceManager extends ConstructionManager {
  Device localHandle;

  LocalDeviceManager(Host device, Blackbird blackbird)
      : super(device, blackbird) {
    localHandle = constructImplementation();
  }

  @override
  Future<Device> get implementDevice async => localHandle;
  @override
  Future<Device> get interfaceDevice => implementDevice;
  @override
  Future<Host> get currentHost async => device;

  //TODO not sure on this one
  Device get remoteHandle {
    throw new Exception('local is not remote');
  }
}
