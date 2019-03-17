import 'package:blackbird/blackbird.dart';

part 'ir.g.dart';

abstract class IRReceiver extends Device {
  IRReceiver._();
  static IRReceiver getRemote(Context context, String uuid) =>
      _$IRReceiverRmi.getRemote(context, uuid);

  @Executive()
  Stream<int> get receive;
}

abstract class IRTransmitter extends Device {
  IRTransmitter._();
  static IRTransmitter getRemote(Context context, String uuid) =>
      _$IRTransmitterRmi.getRemote(context, uuid);

  @Executive()
  Future<void> transmitIRCode(int code);
}
