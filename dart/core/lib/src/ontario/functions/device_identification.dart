import 'package:blackbird/src/ontario/connection.dart';
import 'command_bytes.dart';

class DeviceIdentificationQuery extends ConstructionPacket {
  DeviceIdentificationQuery() : super(DEVICE_IDENTIFICATION);
}

class DeviceIdentificationResponse extends AVRPacket {
  final String avrID;
  DeviceIdentificationResponse(this.avrID);
}

class DeviceIdentificationParser extends PacketParser {
  DeviceIdentificationParser() : super(DEVICE_IDENTIFICATION);

  @override
  AVRPacket parse(String data) {
    return new DeviceIdentificationResponse(data);
  }
}
