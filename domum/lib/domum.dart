import 'package:blackbird/blackbird.dart';
import 'package:blackbird/devices/ontario.dart';
import 'package:blackbird/devices/osram_bulb.dart';
import 'package:blackbird/devices/mcp23017.dart';
import 'package:blackbird/devices/output.dart';
import 'package:blackbird/devices/example_device.dart';

Host york;
Host companion;

Ontario ontario;

RCSocket deskLamp;
RCSocket workbenchLamp;
RCSocket computerPeripherals;
RCSocket ambientLight;

Blackbird blackbird;
Host local;

MCP23017 mcp;

void setupDomum(String name) {
  registerDevices();

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
  else if (name == 'empty')
    local = new Host();
  else
    throw new Exception('unknown identifier');

  blackbird = new Blackbird(local);
  // blackbird.addDevice(companion);
  // blackbird.addDevice(york);
  blackbird.cluster.devices.remove(local);

  ontario = new Ontario();

  mcp = new MCP23017();
  mcp.master = ontario;
  mcp.address = 32;

  deskLamp = DipSwitchSocket('1000101000');
  deskLamp.sender = ontario;

  workbenchLamp = DipSwitchSocket('1000110000');
  workbenchLamp.sender = ontario;

  ambientLight = IntertechnoSwitch('M', 6);
  ambientLight.sender = ontario;

  computerPeripherals = DipSwitchSocket('1000000010');
  computerPeripherals.sender = ontario;
}

void registerDevices() {
  // blackbird.registerHooks(ADevice().hooks);
  // blackbird.registerHooks(OsramBulb().hooks);
  // blackbird.registerHooks(IntertechnoSwitch('', 0).hooks);
  // blackbird.registerHooks(MCP23017().hooks);
}
