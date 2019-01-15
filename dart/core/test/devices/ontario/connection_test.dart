import 'package:blackbird/src/ontario/connection.dart';
import 'package:blackbird/src/ontario/serial_port.dart';
import 'dart:async';
import 'package:test/test.dart';
import 'package:blackbird/src/ontario/functions/device_identification.dart';
import 'package:blackbird/src/connection.dart';

class MockSerialPort extends SerialPort {
  StreamController<String> inputController;
  StreamController<String> outputController;

  MockSerialPort._(Stream<String> input, StreamSink<String> output)
      : super(Connection.fromParts(input, output).asByteConnection());

  factory MockSerialPort() {
    var a = new StreamController<String>();
    var b = new StreamController<String>();
    var res = new MockSerialPort._(a.stream, b.sink);
    res.inputController = a;
    res.outputController = b;
    return res;
  }
}

class MockPacket extends TransmittableAVRPacket {
  @override
  int get command => 0xAB;
  @override
  List<int> get payload => [0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF];
}

main() {
  test('output encoder', () async {
    MockSerialPort port = new MockSerialPort();
    String buffer;
    port.outputController.stream.forEach((String d) {
      if (buffer != null) throw new Exception('multiple packets send');
      buffer = d;
    });
    AVRConnection connection = new AVRConnection(port);
    TransmittableAVRPacket packet = new MockPacket();
    connection.send(packet);
    await Future.delayed(Duration(seconds: 5));
    expect(buffer, isNotNull);
    expect(buffer.codeUnits, [
      0xFF,
      0xAB,
      0x01,
      0x23,
      0x45,
      0x67,
      0x89,
      0xAB,
      0xCD,
      0xEF,
      0x00,
      0xFF
    ]);
  });
  test('input decoder', () async {
    MockSerialPort port = new MockSerialPort();
    AVRConnection connection = new AVRConnection(port);
    var r = connection.receive<DeviceIdentificationResponse>(
        timeout: Duration(seconds: 1));
    List<int> buffer = [];
    buffer.add(0xFF);
    buffer.add(0xE0);
    buffer.addAll('asdf'.codeUnits);
    buffer.add(0x00);
    buffer.add(0xFF);
    port.inputController.sink.add(String.fromCharCodes(buffer));
    expect((await r).avrID, 'asdf');
  }, timeout: Timeout(Duration(seconds: 1)));
}
