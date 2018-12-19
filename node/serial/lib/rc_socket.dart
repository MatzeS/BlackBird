import 'serial_connection.dart';

class RCSwitchQuery extends TransmittableAVRPacket {
  int address;
  bool state;

  RCSwitchQuery(this.address, this.state) : super(0xE4);

  @override
  List<int> get payload {
    int groupByte = 0;
    int socketByte = 0;
    for (int i = 0; i < 5; i++) {
      if (address & (1 << (5 + i)) > 0) groupByte |= 1 << i;
      if (address & (1 << i) > 0) socketByte |= 1 << i;
    }
    if (state) groupByte |= 1 << 7;

    return [10, groupByte, socketByte];
  }

  // get payload() {
  //   let groupByte = 0
  //   let socketByte = 0
  //   for (let i = 0; i < 5; i++) {
  //     if (this.address & (1 << (5 + i))) groupByte |= 1 << i
  //     if (this.address & (1 << i)) socketByte |= 1 << i
  //   }
  //   if (this.on) groupByte |= 1 << 7
  //   return Uint8Array.of(10, groupByte, socketByte)
  // }
}
