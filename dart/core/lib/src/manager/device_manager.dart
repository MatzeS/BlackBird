import 'dart:async';

import 'package:blackbird/blackbird.dart';
import 'construction.dart';

enum Hosting { local, remote, unknown }

/// Manages the implementation of a device in the cluster
///
/// In particular the manager ensures there is only one device implementation object in the cluster.
/// It either provides a handle of the implementation object on a remote host (RMI)
/// or constructs the implementation object itself.
abstract class DeviceManager {
  final Blackbird blackbird;
  final Device device;
  DeviceManager(this.device, this.blackbird);

  Future<Device> get interfaceDevice;

  bool get isLocallyHosted;
  bool get isRemoteHandlePresent;

  // Hosting get hosting;

  // Future<Host> get currentHost;

  // Future<bool> get isAvailable async => await currentHost != null;
  // Future<bool> get isRemoteHosted async =>
  //     await isAvailable && await currentHost != blackbird.localDevice;
  // Future<bool> get isLocallyHosted async =>
  //     await isAvailable && await currentHost == blackbird.localDevice;
}

/// An agent is the opposite of a host
/// A device that is managed by a host and does not run a blackbird instance
class AgentManager extends ConstructionManager {
  AgentManager(Device device, Blackbird blackbird) : super(device, blackbird);

  /// stores the device implementation that was constructed within this blackbird instance
  Device _localHandle;
  Device _remoteHandle;

  bool get isLocallyHosted => _localHandle != null;
  bool get isRemoteHandlePresent => _remoteHandle != null;

  @override
  Future<Device> get interfaceDevice async {
    if (isLocallyHosted) return _localHandle;
    if (isRemoteHandlePresent) return _remoteHandle;

    _acquireRemoteHandle();
    if (isRemoteHandlePresent) return _remoteHandle;

    print("constructing $device on ${blackbird.localDevice}");
    _localHandle = await constructImplementation();
    return _localHandle;
  }

  /// Checks if the device is already implemented in the cluster
  /// and provides the remote handle.
  /// TODO test, also error handleing
  Future<void> _acquireRemoteHandle() async {
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
    _remoteHandle = handle;
  }
}

/// Manages the local device
class LocalDeviceManager extends ConstructionManager {
  Completer<Device> _localHandle = new Completer();

  LocalDeviceManager(Host device, Blackbird blackbird)
      : super(device, blackbird) {
    _localHandle.complete(constructImplementation());
  }

  @override
  Future<Device> get interfaceDevice => _localHandle.future;

  @override
  bool get isLocallyHosted => true;

  @override
  bool get isRemoteHandlePresent => false;
}
