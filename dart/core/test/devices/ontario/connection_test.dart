import 'package:blackbird/src/ontario/connection.dart';
import 'package:blackbird/src/ontario/serial_port.dart';
import 'dart:async';
import 'package:test/test.dart';
import 'package:blackbird/src/ontario/functions/device_identification.dart';

class MockSerialPort implements SerialPort {
  StreamController<String> inputController = new StreamController();
  StreamController<String> outputController = new StreamController();
  Stream<String> get input => inputController.stream;
  StreamSink<String> get output => outputController.sink;
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
    await Future.delayed(Duration(seconds: 1));
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
