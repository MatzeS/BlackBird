import 'dart:async';
import 'dart:io';
import 'package:blackbird/blackbird.dart';
import 'construction.dart';
import 'packets.dart';
import 'package:blackbird/src/connection.dart';
import 'dart:convert';
import 'package:json_serialization/json_serialization.dart';
import 'package:async/async.dart';

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
    Socket socket = await Socket.connect(device.address, device.port);
    HostConnection connection = HostConnection.fromSocket(socket);

    Context context = new Context(connection.input, connection.output);
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

class HostConnection extends SimplePacketConnection<BlackbirdPacket> {
  final Stream<String> _input;
  final StreamSink<String> _output;

  @override
  Stream<String> get input => _input;
  @override
  StreamSink<String> get output => _output;

  JsonSerialization serialization = new JsonSerialization();

  Stream<String> _rmiInput;
  StreamSink<String> _rmiOutput;
  Stream<String> get rmiInput => _rmiInput;
  StreamSink<String> get rmiOutput => _rmiOutput;

  HostConnection(this._input, this._output) {
    serialization.registerDeserializer(
        'asset:blackbird/lib/src/manager/packets.dart#HandshakePacket',
        (d) => HandshakePacket.fromJson(d));

    receive<RmiWrapperPacket>().where((p) => p is Rmi).transform(
        new StreamTransformer.fromHandlers(handleData: (value, sink) {}));

    _rmiInput = new Stream<String>.eventTransformed(
            input, (EventSink<String> sink) => new _RmiInput(sink))
        .asBroadcastStream();

    _rmiOutput = new _RmiOutput(_output);
  }

  factory HostConnection.fromSocket(Socket socket) {
    StreamController<String> controller = new StreamController<String>();
    controller.stream.listen((data) => socket.write(data));

    return new HostConnection(
        socket.map((list) => String.fromCharCodes(list)).asBroadcastStream(),
        controller.sink);
  }

  void decode(String data) {
    fireReceivedPacket(_deserialize(data));
  }

  String encode(BlackbirdPacket packet) {
    return _serialize(packet);
  }

  String _serialize(Object object) {
    return serialization.serialize(object);
  }

  Object _deserialize(String serialized) {
    return serialization.deserialize(serialized);
  }
}

class _RmiOutput extends DelegatingStreamSink<String> {
  StreamSink<String> sink;
  _RmiOutput(this.sink) : super(sink);
  void add(String data) => sink.add(new RmiWrapperPacket(data));
}

class _RmiInput implements EventSink<RmiWrapperPacket> {
  final EventSink<String> sink;
  _RmiInput(this.sink);

  void add(RmiWrapperPacket data) => sink.add(data.wrapped);

  void addError(e, [st]) => sink.addError(e, st);

  void close() => sink.close();
}

typedef Object FromJson(Map<String, dynamic> json);
