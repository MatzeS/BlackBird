@JS()
library test;

import 'package:dart_node_serialport/serial_port_module.dart';
import 'package:test/test.dart';
import 'package:dart_node_serialport/impl.dart';
import 'package:blackbird/blackbird.dart';
import 'package:blackbird/devices/ontario.dart';
import 'package:dart_node_serialport/serial_port_module.dart';
import 'package:blackbird/src/manager/dependency_builders.dart';
import 'package:blackbird/src/device.dart';
import 'package:blackbird/blackbird.dart';
import 'package:blackbird/src/manager/construction.dart';
import 'package:blackbird/devices/socket.dart';
import 'dart:html';
import 'package:node_interop/node.dart' hide require;
import 'package:node_interop/path.dart';
import 'package:js/js.dart';

part 'test.g.dart';

class StubBuilder extends FilteredDependencyBuilder<RCSocket, AVRConnection> {
  AVRConnection con;
  StubBuilder(this.con);
  @override
  List<String> get producedTypes => _$StubBuilderTypes;

  @override
  Object buildFiltered(Dependency dependency) {
    return con;
  }
}

@JS('handover')
external dynamic get serialport;

RCSocket socket;
load() async {
  print(serialport);
  // dynamic serialport = window.sessionStorage['serialport'];
  // print(serialport);<
  // print(serialport('a'));

  // var x = window.sessionStorage['somefunc'];
  // print(x('a'));

  SerialPort port = NodeSerialPort('/dev/ttyUSB0', serialport('/dev/ttyUSB0'));

  AVRConnection avr = new AVRConnection(port);

  StubBuilder builder = new StubBuilder(avr);

  Blackbird blackbird = new Blackbird();

  socket = new RCSocket.device();
  socket.address = 528;
  socket.blackbird = blackbird;

  addDependencyBuilder(builder);

  socket = blackbird.implementDevice(socket);
  socket.turnOff();
  return;
}

toggle() {
  print(socket.state);
  socket.toggle();
  // socket.toggle();
}
