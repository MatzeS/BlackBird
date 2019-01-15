import 'dart:async';
import 'dart:io';
import 'dart:convert';

import 'package:async/async.dart';

class Connection<T> extends DelegatingStream<T> implements StreamSink<T> {
  final StreamSink<T> sink;
  final Stream<T> stream;

  Connection.fromParts(this.stream, this.sink)
      : super(stream.asBroadcastStream());

  Connection(Connection delegate)
      : stream = delegate.stream,
        sink = delegate.sink,
        super(delegate.stream) {}

  Connection<R> transformConnection<R>(
          ConnectionTransformer<T, R> transformer) =>
      transformer.bindConnection(this);

  @override
  Future get done => sink.done;
  @override
  Future close() => sink.close();

  @override
  Future addStream(Stream<T> stream) => sink.addStream(stream);

  @override
  void addError(Object error, [StackTrace stackTrace]) =>
      sink.addError(error, stackTrace);

  @override
  void add(T event) => sink.add(event);

  void send(T data) => add(data);

  /// normally the generic R would be constrained to R extends T, however, this appears to be currently not possible due to bugs in the dart SDK
  Future<R> receive<R>({bool filter(R packet), Duration timeout}) async {
    if (filter == null) filter = (p) => true;

    var future = stream
        .where((p) => p is R)
        .map((p) => p as R)
        .where((p) => filter(p))
        .first;
    if (timeout != null) future = future.timeout(timeout);
    return future;
  }

  Future<R> sendAndReceive<R>(T request,
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

  Connection<String> asStringConnection() {
    // if (T is! List<int>)
    //   throw new Exception('cannot convert $T connection to String connection');
    return (this as Connection<List<int>>)
        .transformConnection(new _ByteTranformer());
  }

  Connection<List<int>> asByteConnection() {
    // if (T is! String)
    //   throw new Exception('cannot convert $T connection to Byte connection');
    return (this as Connection<String>)
        .transformConnection(new _StringTranformer());
  }
}

class _ByteTranformer extends SimpleConnectionTransformer<List<int>, String> {
  void encode(String data, EventSink<List<int>> sink) =>
      sink.add(data.codeUnits);
  void decode(List<int> data, EventSink<String> sink) =>
      sink.add(String.fromCharCodes(data));
}

class _StringTranformer extends SimpleConnectionTransformer<String, List<int>> {
  void encode(List<int> data, EventSink<String> sink) =>
      sink.add(String.fromCharCodes(data));
  void decode(String data, EventSink<List<int>> sink) =>
      sink.add(data.codeUnits);
}

abstract class ConnectionTransformer<S, T> {
  Stream<T> bindStream(Stream<S> stream);
  StreamSink<T> bindSink(StreamSink<S> sink);

  Connection<T> bindConnection(Connection<S> connection) =>
      Connection.fromParts(bindStream(connection), bindSink(connection));

  ConnectionTransformer();

  factory ConnectionTransformer.fromFunctions(
          EncodeFunction<S, T> encode, DecodeFunction<S, T> decode) =>
      _ConnectionTransformerFunctionImpl(encode, decode);
}

typedef void EncodeFunction<S, T>(T data, EventSink<S> sink);
typedef void DecodeFunction<S, T>(S data, EventSink<T> sink);

class _ConnectionTransformerFunctionImpl<S, T>
    extends ConnectionTransformer<S, T> {
  EncodeFunction<S, T> _encodeFunction;
  DecodeFunction<S, T> _decodeFunction;

  _ConnectionTransformerFunctionImpl(
      this._encodeFunction, this._decodeFunction) {}

  @override
  StreamSink<T> bindSink(StreamSink<S> sink) =>
      StreamSinkTransformer.fromHandlers(handleData: _encodeFunction)
          .bind(sink);

  @override
  Stream<T> bindStream(Stream<S> stream) =>
      StreamTransformer.fromHandlers(handleData: _decodeFunction).bind(stream);
}

abstract class SimpleConnectionTransformer<S, T>
    extends ConnectionTransformer<S, T> {
  void encode(T data, EventSink<S> sink);
  void decode(S data, EventSink<T> sink);

  @override
  StreamSink<T> bindSink(StreamSink<S> sink) {
    return StreamSinkTransformer.fromHandlers(handleData: encode).bind(sink);
  }

  @override
  Stream<T> bindStream(Stream<S> stream) {
    return StreamTransformer.fromHandlers(handleData: decode).bind(stream);
  }
}
