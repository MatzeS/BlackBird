import 'package:test/test.dart';

import 'sample_impl.dart';
import 'package:blackbird/src/connection.dart';

import 'dart:async';

String significantString = 'asfd';

main() {
  group('unidirectional', () {
    StreamController<String> a = new StreamController();
    StreamController<String> b = new StreamController();
    PacketConnection<SamplePacket> connection =
        new SampleConnection(a.stream, b.sink);
    Stream<String> fromConnection = b.stream;
    StreamSink<String> toConnection = a.sink;

    test('encoding', () async {
      Stream<String> receiver =
          fromConnection.where((d) => d == significantString);
      Future<String> result =
          receiver.first.timeout(new Duration(seconds: 1), onTimeout: null);
      connection.send(new SamplePacket(significantString));
      expect(await result, significantString);
    });
    test('decoding', () async {
      Stream<SamplePacket> receiver =
          connection.packetInput.where((p) => p.payload == significantString);
      Future<SamplePacket> result =
          receiver.first.timeout(new Duration(seconds: 1));
      toConnection.add(significantString);
      expect((await result).payload, significantString);
    });
  });

  group('end2end', () {
    var connections = SampleConnection.pair();
    PacketConnection<SamplePacket> a = connections.item1;
    PacketConnection<SamplePacket> b = connections.item2;
    test('receive', () async {
      var receiver = a.receive();
      b.send(new SamplePacket(significantString));
      var result =
          await receiver.timeout(Duration(seconds: 1), onTimeout: null);
      expect(result.payload, significantString);
    });
    test('filter', () async {
      var receiver = a.receive(filter: (p) => !p.payload.endsWith('x'));
      b.send(new SamplePacket(significantString + 'x'));
      var result =
          await receiver.timeout(Duration(seconds: 1), onTimeout: () => null);
      expect(result, null);
      b.send(new SamplePacket(significantString));
      result = await receiver.timeout(Duration(seconds: 1), onTimeout: null);
      expect(result.payload, significantString);
    });

    test('type', () async {
      var receiver = a.receive<AnotherPacket>();
      b.send(new AnotherPacket());
      AnotherPacket result = await receiver.timeout(Duration(seconds: 1));
      expect(result.payload, 'another');
    });

    test('filter', () async {
      var receiver = a.receive<AnotherPacket>();
      b.send(new SamplePacket(significantString));
      var result =
          await receiver.timeout(Duration(seconds: 1), onTimeout: () => null);
      expect(result, null);
      b.send(new AnotherPacket());
      result = await receiver.timeout(Duration(seconds: 1), onTimeout: null);
      expect(result.payload, 'another');
    });
  });
}
