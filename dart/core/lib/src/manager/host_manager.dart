import 'dart:async';
import 'dart:io';

import 'package:blackbird/blackbird.dart';
import 'package:blackbird/src/connection.dart';

import 'packets.dart';
import 'package:json_serialization/json_serialization.dart';

class HostManager extends DeviceManager {
  HostManager(Host device, Blackbird blackbird) : super(device, blackbird);

  Host get device => super.device;

  //TODO think about this, see Device.isAvailable, its just not accurate
  @override
  Future<Host> get currentHost async => device;

  @override
  Future<Device> get interfaceDevice async => await _remoteHandle;

  Device _remoteHandleCache;
  Future<Device> get _remoteHandle async {
    if (_remoteHandleCache == null) await connect();
    return _remoteHandleCache;
  }

  Future<void> connect() async {
    print('connecting to $device');
    Socket socket = await Socket.connect(device.address, device.port);
    HostConnection connection = HostConnection.fromSocket(socket);

    Context context = blackbird.helpers.createContext(
        connection.rmiSubConnection, connection.rmiSubConnection);

    var localImpl = await blackbird.interfaceDevice(blackbird.localDevice);
    Provision localProvision = localImpl.provideRemote(context);

    var answer =
        connection.receive<HandshakePacket>(timeout: Duration(seconds: 10));
    connection
        .send(new HandshakePacket(blackbird.localDevice, localProvision.uuid));

    _remoteHandleCache = Host.getRemote(context, (await answer).rmiUuid);
  }
}

class HostConnectionPacket {}

class HostConnection extends Connection<HostConnectionPacket> {
  HostConnection(Connection<String> delegate)
      : super(delegate.transformConnection(new HostConnectionTransformer())) {}

  HostConnection.fromSocket(Socket socket)
      : this(connectionFromSocket(socket).asStringConnection());

  /// creates a rmi sub connection by wrapping the rmi packets
  Connection<String> get rmiSubConnection => this.transformConnection(
          ConnectionTransformer<HostConnectionPacket, String>.fromFunctions(
              (String data, EventSink<HostConnectionPacket> sink) =>
                  sink.add(new RmiWrapperPacket(data)),
              (HostConnectionPacket data, EventSink<String> sink) {
        if (data is RmiWrapperPacket) sink.add(data.wrapped);
      }));
}

class HostConnectionTransformer
    extends SimpleConnectionTransformer<String, HostConnectionPacket> {
  HostConnectionTransformer() {
    serialization.registerDeserializer(
        'asset:blackbird/lib/src/manager/packets.dart#HandshakePacket',
        (d) => HandshakePacket.fromJson(d));
    serialization.registerDeserializer(
        'asset:blackbird/lib/src/manager/packets.dart#RmiWrapperPacket',
        (d) => RmiWrapperPacket.fromJson(d));
  }

  JsonSerialization serialization = new JsonSerialization();

  void encode(HostConnectionPacket data, EventSink<String> sink) {
    sink.add(_serialize(data));
  }

  void decode(String data, EventSink<HostConnectionPacket> sink) {
    sink.add(_deserialize(data));
  }

  String _serialize(Object object) {
    return serialization.serialize(object);
  }

  Object _deserialize(String serialized) {
    return serialization.deserialize(serialized);
  }
}
