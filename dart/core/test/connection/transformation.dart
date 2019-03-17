import 'package:test/test.dart';
import 'dart:async';
import 'package:blackbird/src/connection.dart';

main() {
  group('Connection Transformer', () {
    test('String stream', () async {
      var a = new StreamController<String>();
      var b = new StreamController<String>();
      Connection<String> connection = Connection.fromParts(a.stream, b.sink);

      b.stream.pipe(a.sink);

      var transformed = connection.asByteConnection().asStringConnection();
      String answer = await transformed.sendAndReceive("asdfer");
      expect(answer, 'asdfer');
    });
    test('Byte stream', () async {
      var a = new StreamController<List<int>>();
      var b = new StreamController<List<int>>();
      Connection<List<int>> connection = Connection.fromParts(a.stream, b.sink);

      b.stream.pipe(a.sink);

      var transformed = connection.asStringConnection().asByteConnection();
      String answer = await transformed.sendAndReceive([1, 2, 3, 4, 5]);
      expect(answer, 'asdfer');
    });
  });
}
