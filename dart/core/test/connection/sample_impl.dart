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

class SampleConnection extends Connection<SamplePacket> {
  SampleConnection(Connection<String> connection)
      : super(connection.transformConnection(SampleTransformer()));

  static Tuple2<SampleConnection, SampleConnection> pair() {
    StreamController<String> pipeA = new StreamController();
    StreamController<String> pipeB = new StreamController();

    SampleConnection a =
        SampleConnection(Connection.fromParts(pipeA.stream, pipeB.sink));
    SampleConnection b =
        SampleConnection(Connection.fromParts(pipeB.stream, pipeA.sink));

    return new Tuple2(a, b);
  }
}

class SampleTransformer
    extends SimpleConnectionTransformer<String, SamplePacket> {
  void encode(SamplePacket data, EventSink<String> sink) =>
      sink.add(data.payload);
  void decode(String data, EventSink<SamplePacket> sink) {
    if (data == 'another')
      sink.add(new AnotherPacket());
    else
      sink.add(SamplePacket(data));
  }
}
