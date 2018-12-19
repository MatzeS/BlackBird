import 'dart:async';

abstract class Connection {}

abstract class PacketConnection<P> {
  Stream<String> get input;
  StreamSink<String> get output;

  Stream<P> packetInput;
  StreamSink<P> packetOutput;

  PacketConnection() {
    StreamController<P> inputStreamController = new StreamController();
    packetInput = inputStreamController.stream.asBroadcastStream();

    input.listen((data) {
      //TODO try catch
      inputStreamController.sink.add(decode(data));
    });
  }

  P decode(String data);
  String encode(P packet);

  void send(P packet) {
    //TODO try catch
    output.add(encode(packet));
  }

  Future<R> receive<R extends P>({bool filter(R packet), Duration timeout}) {
    if (filter == null) filter = (p) => true;

    var future = packetInput
        .where((p) => p is R)
        .where((p) => filter(p))
        .map((p) => p as R)
        .first;
    if (timeout != null) future = future.timeout(timeout);
    return future;
  }

  Future<R> sendAndReceive<R extends P>(P request,
      {bool filter(R packet), Duration timeout, num tries = 1}) async {
    Future<R> receiver = receive<R>(filter: filter, timeout: timeout);
    R receivedPacket;
    for (int i = 0; i < tries; i++) {
      try {
        packetOutput.add(request);
        receivedPacket = await receiver;
      } on TimeoutException {
        continue;
      }
      break;
    }

    if (receivedPacket == null)
      throw new TimeoutException('no packet received');

    return receivedPacket;
  }
}
