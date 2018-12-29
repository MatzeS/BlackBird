import 'package:js/js.dart';
import 'package:blackbird/src/connection.dart';
import 'package:blackbird/src/ontario/serial_port.dart';
import 'dart:async';
import 'package:tuple/tuple.dart';
import 'functions/device_identification.dart';

class AVRPacket {}

abstract class TransmittableAVRPacket extends AVRPacket {
  final int command;
  List<int> get payload;

  TransmittableAVRPacket(this.command);
}

class ConstructionPacket extends TransmittableAVRPacket {
  List<int> _buffer = [];

  ConstructionPacket(int command) : super(command);
  get payload => _buffer;

  write(int byte) => _buffer.add(byte);
  writeAll(List<int> bytes) => _buffer.addAll(bytes);
}

abstract class PacketParser {
  final int command;
  PacketParser(this.command);
  AVRPacket parse(String data);
}

typedef void ParsePacket(int command, List<int> data);

class AVRConnection extends SimplePacketConnection<AVRPacket> {
  SerialPort port;
  get input => port.input;
  get output => port.output;

  _PayloadDecoder _decoder = new _PayloadDecoder();
  decode(String data) {
    data.codeUnits.forEach((b) => _decoder.parseByte(b));
  }

  AVRConnection(this.port) {
    _decoder.output.listen((t) => parsePacket(t.item1, t.item2));

    //TODO
    packetparsers.add(new DeviceIdentificationParser());
  }

  _PayloadEncoder _encoder = new _PayloadEncoder();
  String encode(AVRPacket packet) => _encoder.encode(packet);

  List<PacketParser> packetparsers = [];
  PacketParser getPacketParser(int command) =>
      packetparsers.firstWhere((p) => p.command == command);

  void parsePacket(int command, String data) {
    if (command == 0) return;
    try {
      PacketParser parser = getPacketParser(command);
      AVRPacket packet = parser.parse(data);
      fireReceivedPacket(packet);
    } on Exception {
      print('no parser');
      return;
    }
  }
}

enum Expect { CMD, DATA, ESC }

class _PayloadEncoder {
  String encode(TransmittableAVRPacket packet) {
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

    return String.fromCharCodes(buffer);
  }
}

class _PayloadDecoder {
  StreamController<Tuple2<int, String>> _outputController =
      new StreamController();
  Stream get output => _outputController.stream;
  void fire(int command, String data) =>
      _outputController.sink.add(new Tuple2(command, data));

  Expect expect = Expect.ESC;
  int dataIndex = 0;
  List<int> data = [];
  int command = 0;

  void parseByte(int incomingByte) {
    try {
      if (incomingByte == 0xff) {
        // expecting DATA when the last byte was an escape byte or ESC when the last 8 bytes were 7 data bytes and their ESC byte
        if (expect == Expect.DATA || expect == Expect.ESC) {
          // last block was not full and is not escaped
          if (dataIndex != 0 && (dataIndex - 1) % 8 != 0) {
            int escByte = data[dataIndex - 1];
            int leftBytes = (dataIndex - 1) % 8;
            for (int i = 0; i < leftBytes; i++)
              if ((escByte & (1 << i)) != 0) data[dataIndex - 1 - 1 - i] = 0xff;

            dataIndex = dataIndex - 1;
          }

          fire(command, String.fromCharCodes(data));
        }
        // else double escape, do nothing

        expect = Expect.CMD;
      } else if (expect == Expect.CMD) {
        command = incomingByte;

        dataIndex = 0;
        data = [];

        expect = Expect.DATA;
      } else if (expect == Expect.DATA) {
        data.add(incomingByte);
        dataIndex++;

        if (dataIndex % 8 == 0) expect = Expect.ESC;
      } else if (expect == Expect.ESC) {
        for (int i = 0; i < 8; i++)
          if ((incomingByte & (1 << i)) != 0) data[dataIndex - 1 - i] = 0xff;

        int fullFlag = data.last;
        if (incomingByte == 0x7f) if (fullFlag == 0xf0)
          // special possible full 8 times 0xFF block
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
