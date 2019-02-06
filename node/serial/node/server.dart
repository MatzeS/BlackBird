import 'package:blackbird/blackbird.dart';
import 'package:blackbird/domum.dart';
import 'package:logging/logging.dart';
import 'package:dart_node_serialport/serial_port_module.dart';
import 'package:test/test.dart';
import 'package:dart_node_serialport/impl.dart';
import 'package:blackbird/devices/ontario.dart';
import 'package:blackbird/devices/osram_bulb.dart';
import 'package:blackbird/devices/mcp23017.dart';
import 'package:blackbird/src/manager/dependency_builders.dart';
import 'package:blackbird/blackbird.dart';
import 'package:blackbird/src/manager/construction.dart';
import 'test.dart';

import 'dart:io';

import 'package:blackbird/domum.dart';
import 'package:rmi/rmi.dart';
import 'package:blackbird/devices/example_device.dart';
import 'package:blackbird/blackbird.dart';
import 'package:node_interop/net.dart';
import 'dart:async';

void setupNodeServer() {
  var localDevice = blackbird.localDevice;

  dynamic server = net.createServer((socket) {
    //TODO
    var output = new StreamController<String>();
    var input = new StreamController<String>();

    output.stream.listen((data) {
      socket.write(data);
    });

    socket.on('end', () {
      print('client disconnected');
    });
    socket.on('data', (data) {
      List<int> d = [];
      for (int i = 0; i < data.length; i++) d.add(data[i]);

      input.sink.add(String.fromCharCodes(d));
    });

    Connection<String> subconnection =
        Connection<String>.fromParts(input.stream, output.sink);
    blackbird.registerHostConnection(subconnection);
  });
  server.on('error', (err) {
    throw err;
  });
  server.listen(localDevice.port, () {
    print('server bound');
  });
}

main() async {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((LogRecord rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });

  var p = '/dev/ttyUSB0';
  SerialPort port = NodeSerialPort(p, newSerialPort(p));

  AVRConnection avr = new AVRConnection(port);

  StubBuilder builder = new StubBuilder(avr);

  setupDomum('york');
  setupNodeServer();
  blackbird.addDependencyBuilder(builder);

  // MCP23017 mcp = new MCP23017();
  // mcp.master = ontario;
  // mcp.address = 32;
  // mcp = await blackbird.implementDevice(mcp);
  // mcp.turnOn();

  // RCSocket socket = new RCSocket();
  // socket.address = 528;
  // // socket.ontario =

  bulb = await blackbird.interfaceDevice(bulb);
  bulb.turnOff();
  await Future.delayed(Duration(milliseconds: 500));
  bulb.turnOn();
}
