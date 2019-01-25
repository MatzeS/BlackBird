import 'package:blackbird/blackbird.dart';
import 'i2c.dart';
import 'package:blackbird/devices/ontario.dart';
part 'mcp23017.g.dart';

abstract class MCP23017 extends I2CSlave {
  MCP23017._() : super.extender();
  factory MCP23017() => _$MCP23017Device();
  static MCP23017 getRemote(Context context, String uuid) =>
      _$MCP23017Rmi.getRemote(context, uuid);

  turnOn() {
    writeRegister(0x00, 0x00);
    writeRegister(0x01, 0x00);
    writeRegister(0x14, 0xFF);
    writeRegister(0x15, 0xFF);
    print('done');
  }
}
