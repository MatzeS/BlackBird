import 'dart:async';

abstract class Connection {
  Stream<String> get input;
  StreamSink<String> get output;
}

abstract class PacketConnection<P> extends Connection {
  EventSink<P> encodeTransformerFactory(EventSink<String> data);
  EventSink<String> decodeTransformerFactory(EventSink<P> sink);

  Stream<P> _packetInput;
  Stream<P> get packetInput => _packetInput;
  EventSink<P> _packetOutput;
  EventSink<P> get packetOutput => _packetOutput;

  PacketConnection() {
    _packetInput = new Stream<P>.eventTransformed(
        input, (EventSink<P> sink) => decodeTransformerFactory(sink));

    _packetInput = _packetInput.asBroadcastStream();

    _packetOutput = encodeTransformerFactory(output);
  }

  void send(P packet) {
    packetOutput.add(packet);
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

typedef void DecodeFunction(String data);
typedef String EncodeFunction<P>(P packet);

class SimpleDecodeTransformer<P> implements EventSink<String> {
  final EventSink<P> sink;
  final DecodeFunction decode;
  SimpleDecodeTransformer(this.sink, this.decode);

  void add(String data) => decode(data);

  void addError(e, [st]) => sink.addError(e, st);

  void close() => sink.close();
}

class SimpleEncodeTransformer<P> implements EventSink<P> {
  final EventSink<String> _outputSink;
  final EncodeFunction encode;
  SimpleEncodeTransformer(this._outputSink, this.encode);

  void add(P data) => _outputSink.add(encode(data));

  void addError(e, [st]) => _outputSink.addError(e, st);

  void close() => _outputSink.close();
}

abstract class SimplePacketConnection<P> extends PacketConnection<P> {
  SimpleDecodeTransformer<P> _decoder;
  @override
  EventSink<String> decodeTransformerFactory(EventSink<P> sink) {
    _decoder = new SimpleDecodeTransformer<P>(sink, decode);
    return _decoder;
  }

  @override
  EventSink<P> encodeTransformerFactory(EventSink<String> data) =>
      new SimpleEncodeTransformer<P>(data, encode);

  void decode(String data);
  fireReceivedPacket(P packet) => _decoder.sink.add(packet);

  String encode(P packet);
}
