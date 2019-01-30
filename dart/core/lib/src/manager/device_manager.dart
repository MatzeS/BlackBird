import 'dart:async';

import 'package:blackbird/blackbird.dart';
import 'construction.dart';

/// Manages the implementation of a device in the cluster
///
/// In particular the manager ensures there is only one device implementation object in the cluster.
/// It either provides a handle of the implementation object on a remote host (RMI)
/// or constructs the implementation object itself.
abstract class DeviceManager {
  final Blackbird blackbird;
  final Device device;
  DeviceManager(this.device, this.blackbird);

  Future<bool> get isAvailable async => await currentHost != null;
  Future<bool> get isRemoteHosted async =>
      await isAvailable && await currentHost != blackbird.localDevice;
  Future<bool> get isLocallyHosted async =>
      await isAvailable && await currentHost == blackbird.localDevice;

  Future<Host> get currentHost;
  Future<Device> get interfaceDevice;
}

/// An agent is the opposite of a host
/// A device that is managed by a host and does not run a blackbird instance
class AgentManager extends ConstructionManager {
  AgentManager(Device device, Blackbird blackbird) : super(device, blackbird);

  /// stores the device implementation that was constructed within this blackbird instance
  Device _localHandle;

  @override
  Future<Host> get currentHost async {
    if (_localHandle != null) return blackbird.localDevice;

    return (await _remoteHandle)?.host;
  }

  @override
  Future<Device> get interfaceDevice async {
    if (await isLocallyHosted) return _localHandle;
    if (await isRemoteHosted) return await _remoteHandle;

    print("constructing $device on ${blackbird.localDevice}");
    _localHandle = await constructImplementation();
    return _localHandle;
  }

  /// Checks if the device is already implemented in the cluster
  /// and provides the remote handle.
  /// TODO test, also error handleing
  Future<Device> get _remoteHandle async {
    List<Future<Host>> hostFutures = blackbird.cluster.hosts
        .map((h) => blackbird.interfaceDevice(h))
        .map((f) async => await f)
        .toList();
    List<Host> hostHandles = await Future.wait(hostFutures);
    hostHandles = hostHandles.where((h) => h != null).toList();
    List<Future<Device>> handleFutureList =
        hostHandles.map((h) => h.getRemoteHandle(device)).toList();
    List<Device> handleList = await Future.wait(handleFutureList);
    if (handleList.isEmpty) return null;
    Device handle = handleList.single;
    return handle;
  }
}

/// Manages the local device
class LocalDeviceManager extends ConstructionManager {
  Completer<Device> _localHandle;

  LocalDeviceManager(Host device, Blackbird blackbird)
      : super(device, blackbird) {
    _localHandle.complete(constructImplementation());
  }

  @override
  Future<Device> get interfaceDevice => _localHandle.future;
  @override
  Future<Host> get currentHost async => device;
}
