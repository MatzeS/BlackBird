import 'package:blackbird/blackbird.dart';

part 'ir_receiver.g.dart';

abstract class IRReceiver extends Device {
  IRReceiver._();
  static IRReceiver getRemote(Context context, String uuid) =>
      _$IRReceiverRmi.getRemote(context, uuid);

  @Executive()
  Stream<int> get receive;
}
