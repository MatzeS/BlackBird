import 'blackbird.dart';
import 'package:blackbird/devices/ontario.dart';
import 'package:blackbird/devices/osram_bulb.dart';
import 'package:blackbird/devices/mcp23017.dart';

Host york;
Host companion;

Ontario ontario;
OsramBulb bulb;
MCP23017 mcp;
RCSocket socket;

Blackbird blackbird;
Host local;

void setupDomum(String name) {
  york = new Host();
  york.address = "192.168.0.205";
  york.port = 1337;

  companion = new Host();
  companion.address = '192.168.0.102';
  companion.port = 1337;

  if (name == 'companion')
    local = companion;
  else if (name == 'york')
    local = york;
  else
    throw new Exception('unknown identifier');

  blackbird = new Blackbird(local);
  blackbird.addDevice(companion);
  blackbird.addDevice(york);
  blackbird.devices.remove(local);

  ontario = new Ontario();
  bulb = new OsramBulb();
  bulb.ontario = ontario;

  mcp = new MCP23017();
  mcp.master = ontario;
  mcp.address = 32;

  socket = new RCSocket();
  socket.address = 528;
}
