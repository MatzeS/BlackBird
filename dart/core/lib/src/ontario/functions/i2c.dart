import 'package:blackbird/blackbird.dart';
import 'package:blackbird/src/ontario/connection.dart';
import 'package:blackbird/src/ontario/functions/command_bytes.dart';

class I2CReadQuery extends TransmittableAVRPacket {
  final int slaveAddress;
  final int registerAddress;
  final int count;

  I2CReadQuery(this.slaveAddress, this.registerAddress, this.count)
      : super(I2C);

  /// read flag 0x40
  @override
  List<int> get payload => [0x40, slaveAddress, registerAddress, count];
}

class I2CReadResponse extends AVRPacket {
  final int slaveAddress;
  final int registerAddress;
  final List<int> data;

  I2CReadResponse(this.slaveAddress, this.registerAddress, this.data);
}

class I2CParser extends PacketParser {
  I2CParser() : super(I2C);

  AVRPacket parse(String strData) {
    List<int> data = strData.codeUnits;
    //byte flag = data[0];

    int slaveAddress = data[1];
    int registerAddress = data[2];
    List<int> readData = data.getRange(3, data.length).toList();

    // print('i2c received');
    return new I2CReadResponse(slaveAddress, registerAddress, readData);
  }
}

class I2CWriteQuery extends TransmittableAVRPacket {
  int slaveAddress;
  int registerAddress;
  List<int> data;

  I2CWriteQuery(this.slaveAddress, this.registerAddress, this.data)
      : super(I2C);

  /// Write Flag 0x00
  @override
  List<int> get payload =>
      [0x00, slaveAddress, registerAddress].followedBy(data).toList();
}
