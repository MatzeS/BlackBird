import 'package:logging/logging.dart';
import 'package:rmi/rmi.dart';
import 'dart:io';
import 'dart:async';

import 'device.dart';
import 'cluster.dart';
import 'manager/device_manager.dart';
import 'manager/construction.dart';
import 'manager/dependency_builders.dart';
import 'manager/host_manager.dart';
import 'manager/packets.dart';
import 'helpers.dart';
import 'connection.dart';

part 'main.g.dart';

class Blackbird {
  final Logger log = new Logger('blackbird');

  final BlackbirdHelpers helpers = new BlackbirdHelpers();

  final Host localDevice;
  final Cluster cluster = new Cluster();

  Blackbird(this.localDevice) {
    _registerDefaultDependencyInjectors();
    interfaceDevice(localDevice);
  }

  void _registerDefaultDependencyInjectors() {
    addDependencyBuilder(new LocalHostBlackbirdInjector(this));
  }

  /// See [DeviceManager.interfaceDevice]
  Future<R> interfaceDevice<R extends Device>(R device) async {
    registerHooks(device);
    log.info('Interfacing device: $device');
    return await getManager(device).interfaceDevice;
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
    helpers.serialization
        .registerDeserializer(key, (x) => hooks['fromJson'](x)); //TODO ugly
    helpers.remoteStubProvider
        .registerRemoteStubConstructor(key, hooks['remote']);
  }

  List<Device> get devices => cluster.devices;

  void addDevice(Device device) {
    registerHooks(device);
    cluster.devices.add(device);
    log.info('Device added: $device');
  }

  /// Registers a connection which has been opened by external trigger
  /// A Handshake packet is expected to arrive on this connection
  /// TODO write doc
  void registerHostConnection(Connection<String> connection) {
    var hc = new HostConnection(connection);
    hc.receive<HandshakePacket>().then((handshake) async {
      Context context =
          helpers.createContext(hc.rmiSubConnection, hc.rmiSubConnection);

      var localImpl = await interfaceDevice(localDevice);
      Provision localProvision = localImpl.provideRemote(context);

      //respond
      hc.send(new HandshakePacket(localDevice, localProvision.uuid));
    });
  }

  //TODO move or remove
  addDependencyBuilder(DependencyBuilder builder) =>
      helpers.dependencyBuilders.add(builder);

  Map<Device, DeviceManager> _managers = {};
  DeviceManager getManager(Device device) {
    if (device == null) throw new Exception('device is null');

    if (_managers[device] != null) {
      return _managers[device];
    }

    DeviceManager manager = _createManager(device);
    _managers.putIfAbsent(device, () => manager);
    return manager;
  }

  DeviceManager _createManager(Device device) {
    if (device == localDevice)
      return new LocalDeviceManager(device, this);
    else if (device is Host)
      return new HostManager(device, this);
    else {
      return AgentManager(device, this);
    }
  }

  /// TODO probably removed
  Future<Device> localGetRemoteHandle(Device device) async {
    if (!getManager(device).isLocallyHosted) {
      //TODO
      return null;
    }
    return await interfaceDevice(device);
  }
}

/// Provides the local blackbird instance for the local device implementation
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
