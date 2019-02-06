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
    // writePortRegister(Port.A, Register.IODIR, 0x00);
    // writePortRegister(Port.A, Register.OLAT, 0xFF);
    writePortBit(Port.B, Register.IODIR, 0, false);
    writePortBit(Port.B, Register.OLAT, 0, true);
  }

  turnOff() {
    // writePortRegister(Port.A, Register.OLAT, 0x00);
    writePortBit(Port.B, Register.OLAT, 0, false);
  }

  Future<void> writePortBit(
          Port port, Register register, int bit, bool value) =>
      writeBit(_registerAddress(port, register), bit, value);

  Future<void> writePortRegister(Port port, Register register, int value) =>
      writeRegister(_registerAddress(port, register), value);

  Future<bool> readPortBit(Port port, Register register, int bit) =>
      readBit(_registerAddress(port, register), bit);

  Future<int> readPortRegister(Port port, Register register) =>
      readRegister(_registerAddress(port, register));

  int _registerAddress(Port port, Register register) {
    return (port == Port.A ? 0x00 : 0x01) + 2 * register.index;
  }
}

enum Port { A, B }
enum Register {
  IODIR,
  IPOL,
  GPINTEN,
  DEFVAL,
  INTCON,
  IOCON,
  GPPU,
  INTF,
  INTCAP,
  GPIO,
  OLAT
}

class RegisterTable {
  int IODIRA = 0x00;
  int IODIRB = 0x01;
  int IPOLA = 0x02;
  int IPOLB = 0x03;
  int GPINTENA = 0x04;
  int GPINTENB = 0x05;
  int DEFVALA = 0x06;
  int DEFVALB = 0x07;
  int INTCONA = 0x08;
  int INTCONB = 0x09;
  int IOCON = 0x0A;
  int GPPUA = 0x0C;
  int GPPUB = 0x0D;
  int INTFA = 0x0E;
  int INTFB = 0x0F;
  int INTCAPA = 0x10;
  int INTCAPB = 0x11;
  int GPIOA = 0x12;
  int GPIOB = 0x13;
  int OLATA = 0x14;
  int OLATB = 0x15;
}
