import '../connection.dart';

//TODO rename all shit crap
class IRSendQuery extends TransmittableAVRPacket {
  final int data;

  IRSendQuery(this.data) : super(0xE6);

  @override
  List<int> get payload {
    return [
      (data >> 0) & 0xFF,
      (data >> 8) & 0xFF,
      (data >> 16) & 0xFF,
      (data >> 24) & 0xFF,
    ];
  }
}

class IRReceiveResponse extends AVRPacket {
  final int data;

  IRReceiveResponse(this.data);

  @override
  String toString() => 'IRResponse[${data.toRadixString(16)}]';
}

class IRParser extends PacketParser {
  IRParser() : super(0xE6);

  AVRPacket parse(String strData) {
    List<int> data = strData.codeUnits;

    int value =
        (data[4] << 0) + (data[3] << 8) + (data[2] << 16) + (data[1] << 24);

    if (data[0] == 10)
      return new IRReceiveResponse(value);
    else
      throw new Exception('deocde error');
  }
}
