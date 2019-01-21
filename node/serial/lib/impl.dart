import 'serial_port_module.dart';
import 'package:blackbird/devices/ontario.dart';
import 'dart:async';
import 'package:blackbird/src/connection.dart';

class NodeSerialPort extends SerialPort {
  NodeSerialPortJS port;

  factory NodeSerialPort(String path, [dynamic port]) {
    StreamController input = new StreamController<List<int>>();
    port.on('data', ([dynamic data]) {
      print('received $data');
      input.sink.add(String.fromCharCodes(data));
    });

    StreamController output = new StreamController<List<int>>();
    output.stream.listen((data) {
      // List<int> sequence = [];
      // ('' + data).codeUnits.forEach(sequence.add);
      port.write(data);
    });

    Connection<List<int>> connection =
        new Connection.fromParts(input.stream, output.sink);

    var res = NodeSerialPort._(connection);
    res.port = port;
    return res;
  }

  NodeSerialPort._(Connection<List<int>> connection) : super(connection) {}

  StreamController<String> _input = new StreamController();
  @override
  Stream<String> get input => _input.stream;

  StreamController<String> _output = new StreamController();
  @override
  StreamSink<String> get output => _output.sink;
}
