import 'dart:async';

abstract class Connection {
  Stream<String> get input;
  StreamSink<String> get output;
}

//TODO better architecture with stream decoder
abstract class PacketConnection<P> extends Connection {
  StreamController<P> _packetInput = new StreamController.broadcast();
  Stream<P> get packetInput => _packetInput.stream;

  PacketConnection() {
    input.listen((data) {
      //TODO try catch
      decode(data);
      // print(data);
    });
  }

  void decode(String data);
  fireReceivedPacket(P packet) => _packetInput.sink.add(packet);

  String encode(P packet);

  void send(P packet) {
    //TODO try catch
    output.add(encode(packet));
  }

  Future<R> receive<R extends P>(
      {bool filter(R packet), Duration timeout}) async {
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
        send(request);
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
