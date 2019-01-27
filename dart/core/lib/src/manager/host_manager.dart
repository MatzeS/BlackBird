import 'dart:async';
import 'dart:io';
import 'package:blackbird/blackbird.dart';
import 'construction.dart';
import 'packets.dart';
import 'package:blackbird/src/connection.dart';
import 'dart:convert';
import 'package:json_serialization/json_serialization.dart';
import 'package:async/async.dart';
import 'package:blackbird/devices/example_device.dart';
import 'package:blackbird/devices/osram_bulb.dart';

class HostManager extends DeviceManager {
  HostManager(Host device, Blackbird blackbird) : super(device, blackbird);

  @override
  Future<Device> get implementDevice =>
      throw new Exception('cannot implement host devices');

  Host get device => super.device;

  Device _remoteHandle;
  Future<Device> get remoteHandle async {
    if (_remoteHandle == null) await connect();
    return _remoteHandle;
  }

  Future<void> connect() async {
    if (device.address != '192.168.0.205' || device.port == 2002) {
      print('WARNING not connecting to $device');
      return null;
    }

    print('connecting to $device');
    Socket socket = await Socket.connect(device.address, device.port);
    HostConnection connection = HostConnection.fromSocket(socket);

    Context context = new Context(
        connection.rmiSubConnection, connection.rmiSubConnection,
        serialization: blackbird.serialization,
        remoteStubProvider: blackbird.remoteStubProvider);

    var localImpl = await blackbird.implementDevice(blackbird.localDevice);
    Provision localProvision = localImpl.provideRemote(context);

    var answer =
        connection.receive<HandshakePacket>(timeout: Duration(seconds: 10));
    connection
        .send(new HandshakePacket(blackbird.localDevice, localProvision.uuid));

    _remoteHandle = Host.getRemote(context, (await answer).rmiUuid);
  }

  @override
  Future<Host> get currentHost async => device;

  @override
  Future<Device> get interfaceDevice async => await remoteHandle;
}

class BlackbirdPacket {}

class HostConnection extends Connection<BlackbirdPacket> {
  HostConnection(Connection<String> delegate)
      : super(delegate.transformConnection(new HostConnectionTransformer())) {}

  HostConnection.fromSocket(Socket socket)
      : this(connectionFromSocket(socket).asStringConnection());

  Connection<String> get rmiSubConnection => this.transformConnection(
          ConnectionTransformer<BlackbirdPacket, String>.fromFunctions(
              (String data, EventSink<BlackbirdPacket> sink) =>
                  sink.add(new RmiWrapperPacket(data)),
              (BlackbirdPacket data, EventSink<String> sink) {
        if (data is RmiWrapperPacket) sink.add(data.wrapped);
      }));
}

Connection<List<int>> connectionFromSocket(Socket socket) =>
    new Connection.fromParts(socket.asBroadcastStream(), socket);

class HostConnectionTransformer
    extends SimpleConnectionTransformer<String, BlackbirdPacket> {
  HostConnectionTransformer() {
    serialization.registerDeserializer(
        'asset:blackbird/lib/src/manager/packets.dart#HandshakePacket',
        (d) => HandshakePacket.fromJson(d));

    serialization.registerDeserializer(
        'asset:blackbird/lib/src/manager/packets.dart#RmiWrapperPacket',
        (d) => RmiWrapperPacket.fromJson(d));
  }

  JsonSerialization serialization = new JsonSerialization();

  void encode(BlackbirdPacket data, EventSink<String> sink) {
    sink.add(_serialize(data));
  }

  void decode(String data, EventSink<BlackbirdPacket> sink) {
    sink.add(_deserialize(data));
  }

  String _serialize(Object object) {
    return serialization.serialize(object);
  }

  Object _deserialize(String serialized) {
    return serialization.deserialize(serialized);
  }
}
