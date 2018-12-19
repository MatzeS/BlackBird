import 'package:blackbird/src/connection.dart';
import 'dart:async';
import 'package:tuple/tuple.dart';

class SamplePacket {
  String payload;
  SamplePacket(this.payload);
}

class AnotherPacket extends SamplePacket {
  AnotherPacket() : super('another');
}

class SampleConnection extends PacketConnection<SamplePacket> {
  @override
  String encode(packet) {
    return packet.payload;
  }

  @override
  SamplePacket decode(String data) {
    if (data == 'another')
      return new AnotherPacket();
    else
      return new SamplePacket(data);
  }

  Stream<String> _input;
  StreamSink<String> _output;

  @override
  Stream<String> get input => _input;
  @override
  StreamSink<String> get output => _output;

  SampleConnection(this._input, this._output);

  static Tuple2<SampleConnection, SampleConnection> pair() {
    StreamController<String> pipeA = new StreamController();
    StreamController<String> pipeB = new StreamController();

    SampleConnection a = new SampleConnection(pipeA.stream, pipeB.sink);
    SampleConnection b = new SampleConnection(pipeB.stream, pipeA.sink);

    return new Tuple2(a, b);
  }
}
