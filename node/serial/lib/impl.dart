import 'serial_port_module.dart';
import 'package:blackbird/devices/ontario.dart';
import 'dart:async';

class NodeSerialPort implements SerialPort {
  NodeSerialPortJS port;

  NodeSerialPort(String path, [dynamic port]) {
    // port = newSerialPort(path);
    this.port = port;

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
