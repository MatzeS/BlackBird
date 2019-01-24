import 'serial_port_module.dart';
import 'package:blackbird/devices/ontario.dart';
import 'dart:async';
import 'package:blackbird/src/connection.dart';

class NodeSerialPort extends SerialPort {
  NodeSerialPortJS port;

  factory NodeSerialPort(String path, [dynamic port]) {
    StreamController input = new StreamController<List<int>>();
    port.on('data', ([dynamic data]) {
      List<int> a = [];
      for (int i = 0; i < data.length; i++) a.add(data[i]);
      input.sink.add(a);
    });

    StreamController output = new StreamController<List<int>>();
    output.stream.listen((data) {
      port.write(data);
    });

    Connection<List<int>> connection =
        new Connection.fromParts(input.stream, output.sink);

    var res = NodeSerialPort._(connection);
    res.port = port;
    return res;
  }

  NodeSerialPort._(Connection<List<int>> connection) : super(connection) {}
}
