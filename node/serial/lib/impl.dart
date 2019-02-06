import 'serial_port_module.dart';
import 'package:blackbird/devices/ontario.dart';
import 'dart:async';
import 'package:synchronized/synchronized.dart';
import 'package:blackbird/src/connection.dart';

class NodeSerialPort extends SerialPort {
  NodeSerialPortJS port;

  factory NodeSerialPort(String path, [dynamic port]) {
    StreamController input = new StreamController<List<int>>();
    Lock lock = new Lock();
    port.on('data', ([dynamic data]) async {
      await lock.synchronized(() {
        List<int> a = [];
        for (int i = 0; i < data.length; i++) a.add(data[i]);
        // print(a);
        input.sink.add(a);
      });
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
