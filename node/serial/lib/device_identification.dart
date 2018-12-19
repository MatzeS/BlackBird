import 'serial_connection.dart';
import 'command_bytes.dart';

class DeviceIdentificationQuery extends TransmittableAVRPacket {
  DeviceIdentificationQuery() : super(DEVICE_IDENTIFICATION);
}

class DeviceIdentificationResponse extends AVRPacket {
  final String avrID;

  DeviceIdentificationResponse(this.avrID);
}

class DeviceIdentificationParser extends PacketParser {
  DeviceIdentificationParser() : super(DEVICE_IDENTIFICATION);

  @override
  AVRPacket parse(List<int> data) {
    List<int> stripped = [];
    int x = 0;
    while (true) {
      stripped.add(data[x]);
      x++;
      if (data[x] == null) break;
    }
    String id = new String.fromCharCodes(stripped);
    print('well have id $id');
    return new DeviceIdentificationResponse(id);
  }
}
