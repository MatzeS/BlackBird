import 'dart:io';

import 'package:rmi/rmi.dart';
import 'manager/device_manager.dart';
import 'device.dart';
import 'manager/construction.dart';
import 'manager/dependency_builders.dart';
import 'manager/host_manager.dart';
import 'manager/packets.dart';
part 'main.g.dart';

class Blackbird {
  final Host localDevice;

  Blackbird(this.localDevice) {
    addDependencyBuilder(new LocalHostBlackbirdInjector(this));
    implementDevice(localDevice);

    var server = ServerSocket.bind(localDevice.address, localDevice.port);
    server.then((server) {
      server.listen((socket) {
        var connection = new HostConnection.fromSocket(socket);
        connection.receive<HandshakePacket>().then((handshake) async {
          Context context = new Context(
              connection.rmiSubConnection, connection.rmiSubConnection);
          var localImpl = await implementDevice(localDevice);
          Provision localProvision = localImpl.provideRemote(context);

          //respond
          connection
              .send(new HandshakePacket(localDevice, localProvision.uuid));
        });
      });
    });
  }

  /// See [DeviceManager.interfaceDevice]
  Future<R> interfaceDevice<R extends Device>(R device) async =>
      await getManager(device).interfaceDevice;

  /// See [DeviceManager.implementDevice]
  Future<R> implementDevice<R extends Device>(R device) async =>
      await getManager(device).implementDevice;

  List<Device> devices; //TODO
  List<Host> get hosts => devices.where((d) => d is Host).toList();

  List<DependencyBuilder> dependencyBuilders = [];

  //TODO remove
  addDependencyBuilder(DependencyBuilder builder) =>
      dependencyBuilders.add(builder);

  Map<Device, DeviceManager> _managers = {};

  DeviceManager getManager(Device device) {
    if (device == null) throw new Exception('device is null');

    if (_managers[device] != null) {
      return _managers[device];
    }

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
