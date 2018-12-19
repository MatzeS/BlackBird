import 'serial_port_module.dart';
import 'package:blackbird/ontario/serial_port.dart';
import 'dart:async';

class NodeSerialPort implements SerialPort {
  NodeSerialPortJS port;

  NodeSerialPort(String path) {
    port = newSerialPort(path);

    port.on('data', ([dynamic data]) {
      print('received $data');
      _input.sink.add(String.fromCharCodes(data));
    });

    _output.stream.listen((data) {
      List<int> sequence = [];
      data.codeUnits.forEach(sequence.add);
      port.write(sequence);
    });
  }

  StreamController<String> _input = new StreamController();
  @override
  Stream<String> get input => _input.stream;

  StreamController<String> _output = new StreamController();
  @override
  StreamSink<String> get output => _output.sink;
}
