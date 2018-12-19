import 'serial_port_module.dart';
import 'device_identification.dart';
import 'package:js/js.dart';

class Connection<T> {}

class AVRPacket {}

class TransmittableAVRPacket {
  final int command;
  List<int> payload = [];

  TransmittableAVRPacket(this.command);
  write(int byte) => payload.add(byte);
}

abstract class PacketParser {
  final int command;
  PacketParser(this.command);
  AVRPacket parse(List<int> data);
}

typedef void ParsePacket(int command, List<int> data);

class AVRConnection extends Connection<AVRPacket> {
  SerialPort port;

  List<PacketParser> packetparsers = [];

  PacketParser packetparserForCommand(int command) =>
      packetparsers.firstWhere((p) => p.command == command);

  AVRConnection(String path) {
    decoder = new PayloadDecoder(parsePacket);

    port = serialPortModule(path);

    port.on('data', ([dynamic payload]) {
      for (int i = 0; i < payload.length; i++) parseByte(payload[i]);
    });

    // //TODO
    packetparsers.add(new DeviceIdentificationParser());

    // port.write('asdf');
    // packet
  }

  PayloadDecoder decoder;
  void parseByte(int byte) {
    print(byte);
    decoder.parseByte(byte);
  }

  void parsePacket(int command, List<int> payload) {
    print('well i have one $command');
    PacketParser parser = packetparserForCommand(command);
    print('got parser $parser');
    AVRPacket packet = parser.parse(payload);
    print(packet);
  }

  PayloadEncoder encoder = PayloadEncoder();
  Future<void> send(TransmittableAVRPacket packet) async {
    List<int> data = encoder.encode(packet);
    port.write(data);
  }
}

enum Expect { CMD, DATA, ESC }

class PayloadEncoder {
  List<int> encode(TransmittableAVRPacket packet) {
    List<int> data = packet.payload;

    List<int> buffer = [];

    buffer.add(0xff);
    buffer.add(packet.command); // command byte

    for (int dataIndex = 0; dataIndex < data.length; dataIndex++) {
      int dataByte = data[dataIndex];
      if (dataByte != 0xff)
        buffer.add(dataByte);
      // last byte in block encodes a full "0xFF" block
      else if ((dataIndex + 1) % 8 == 0) {
        // check if the block is a full start byte block
        bool fullBlock = true;
        for (int i = 1; i < 8; i++)
          if (data[dataIndex - i] != 0xff) {
            fullBlock = false;
            break;
          }

        if (fullBlock)
          buffer.add(0xf0);
        // full block flag in the last block byte
        else
          buffer.add(0x00);
      } else
        buffer.add(
            0x00); // empty data byte, decoded to start byte via escape byte

      if ((dataIndex + 1) % 8 == 0) {
        // end of block -> send escape byte

        int escapeByte = 0x00;
        // set escape byte bits
        for (int i = 0; i < 8; i++)
          if (data[dataIndex - i] == 0xff) escapeByte |= 1 << i;

        // avoid full escape byte
        if (escapeByte == 0xff) escapeByte = 0x7f;

        buffer.add(escapeByte);
      } else if (dataIndex + 1 == data.length) {
        // end of packet -> last escape byte escaping not 8 bytes

        int escapeByte = 0x00;
        // set escape byte bits
        int leftBytes = (dataIndex % 8) + 1;
        for (int i = 0; i < leftBytes; i++)
          if (data[dataIndex - i] == 0xff) escapeByte |= 1 << i;

        buffer.add(escapeByte);
      }
    }

    buffer.add(0xff); //DELIMITER END BYTE

    return buffer;
  }
}

class PayloadDecoder {
  final ParsePacket parsePacket;
  PayloadDecoder(this.parsePacket);

  Expect expect = Expect.ESC;
  int dataIndex = 0;
  List<int> data = [];
  int command = 0;

  void parseByte(int incomingByte) {
    try {
      if (incomingByte == 0xff) {
        // expecting DATA when the last byte was an escape byte and ESC when the last 8 bytes were 7 data bytes and their ESC byte
        if (expect == Expect.DATA || expect == Expect.ESC) {
          // last block was not full and is not escaped
          if (dataIndex != 0 && (dataIndex - 1) % 8 != 0) {
            int escByte = data[dataIndex - 1];
            int leftBytes = (dataIndex - 1) % 8;
            for (int i = 0; i < leftBytes; i++)
              if ((escByte & (1 << i)) != 0) data[dataIndex - 1 - 1 - i] = 0xff;

            dataIndex = dataIndex - 1;
          }

          if (command != 0) parsePacket(command, data);
        }

        expect = Expect.CMD;
      } else if (expect == Expect.CMD) {
        command = incomingByte;

        dataIndex = 0;
        data = new List<int>(255);

        expect = Expect.DATA;
      } else if (expect == Expect.DATA) {
        data[dataIndex] = incomingByte;
        dataIndex++;

        if (dataIndex % 8 == 0) expect = Expect.ESC;
      } else if (expect == Expect.ESC) {
        int fullFlag = data[dataIndex - 1];

        for (int i = 0; i < 8; i++)
          if ((incomingByte & (1 << i)) != 0) data[dataIndex - 1 - i] = 0xff;

        if (incomingByte == 0x7f) if (fullFlag == 0xf0)
          // special possible full 8x 0xFF block
          data[dataIndex - 8] = 0xff;

        expect = Expect.DATA;
      }
      // logger.error("unhandled byte");   //TODO error

    } on Exception {
      print('exception');
    } on Error catch (e, s) {
      print('error $e');
    }
  }
}
