import 'dart:io';

import 'package:rmi/rmi.dart';
import 'manager/device_manager.dart';
import 'device.dart';
import 'manager/construction.dart';
import 'manager/dependency_builders.dart';
import 'manager/host_manager.dart';
import 'manager/packets.dart';
import 'package:blackbird/devices/example_device.dart';
import 'package:json_serialization/json_serialization.dart';
import 'package:rmi/remote_method_invocation.dart';
part 'main.g.dart';

class Blackbird {
  final Host localDevice;

  JsonSerialization serialization = new JsonSerialization();
  RemoteStubProvider remoteStubProvider = new RemoteStubProvider();

  Blackbird(this.localDevice) {
    addDependencyBuilder(new LocalHostBlackbirdInjector(this));
    implementDevice(localDevice);

    registerHooks(ADevice().hooks);
  }

  void registerHooks(dynamic reference) {
    Map<String, dynamic> hooks;
    if (reference is Device) {
      hooks = reference.hooks;
    } else if (reference is Map<String, dynamic>) {
      hooks = reference;
    } else {
      throw new ArgumentError(
          'expect either Device or Hook Map (Map<String, dynamic>)');
    }

    //TODO check for available keys
    String key = hooks['classURL'];
    serialization.registerDeserializer(
        key, (x) => hooks['fromJson'](x)); //TODO ugly
    remoteStubProvider.registerRemoteStubConstructor(key, hooks['remote']);
  }

  /// See [DeviceManager.interfaceDevice]
  Future<R> interfaceDevice<R extends Device>(R device) async =>
      await getManager(device).interfaceDevice;

  /// See [DeviceManager.implementDevice]
  Future<R> implementDevice<R extends Device>(R device) async =>
      await getManager(device).implementDevice;

  List<Device> _devices = []; //TODO
  List<Host> get hosts =>
      _devices.where((d) => d is Host).map((h) => h as Host).toList();

  List<DependencyBuilder> dependencyBuilders = [];

  void addDevice(Device device) {
    registerHooks(device);
    _devices.add(device);
  }

  List<Device> get devices => _devices;

  //TODO remove
  addDependencyBuilder(DependencyBuilder builder) =>
      dependencyBuilders.add(builder);

  Map<Device, DeviceManager> _managers = {};

  DeviceManager getManager(Device device) {
    if (device == null) throw new Exception('device is null');

    if (_managers[device] != null) {
      return _managers[device];
    }

    print('creating manager for $device on $localDevice');
    DeviceManager manager = managerFactory(device);
    _managers.putIfAbsent(device, () => manager);
    return manager;
  }

  DeviceManager managerFactory(Device device) {
    if (device == localDevice)
      return new LocalDeviceManager(device, this);
    else if (device is Host)
      return new HostManager(device, this);
    else
      return AgentManager(device, this);
  }
}

class LocalHostBlackbirdInjector
    extends FilteredDependencyBuilder<Host, Blackbird> {
  @override
  List<String> get producedTypes => _$LocalHostBlackbirdInjectorTypes;

  final Blackbird blackbird;
  LocalHostBlackbirdInjector(this.blackbird);

  @override
  Object buildFiltered(Dependency dependency) {
    return blackbird;
  }
}
