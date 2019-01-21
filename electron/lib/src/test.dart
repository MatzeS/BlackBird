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
bool done = false;
load() async {
  if (done) return;
  done = true;
  print(serialport);
  // dynamic serialport = window.sessionStorage['serialport'];
  // print(serialport);<
  // print(serialport('a'));

  // var x = window.sessionStorage['somefunc'];
  // print(x('a'));

  NodeSerialPort port =
      NodeSerialPort('/dev/ttyUSB0', serialport('/dev/ttyUSB0'));

  AVRConnection avr = new AVRConnection(port);

  StubBuilder builder = new StubBuilder(avr);

  Host local = new Host();
  local.address = 'localhost';
  local.port = 13334;
  Blackbird blackbird = new Blackbird(local);

  socket = new RCSocket();
  socket.address = 528;
  socket.blackbird = blackbird;

  blackbird.addDependencyBuilder(builder);

  socket = await blackbird.implementDevice(socket);
  socket.turnOff();
  socket.state = 0;
  return;
}

toggle() {
  load();
  print(socket.state);
  socket.toggle();
  // socket.toggle();
}
