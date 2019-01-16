import 'package:test/test.dart';
import 'dart:async';
import 'package:blackbird/src/connection.dart';

main() {
  group('', () {
    test('asdf', () async {
      StreamController<String> a = new StreamController<String>();
      StreamController<String> b = new StreamController<String>();
//TODO check this test
      Connection<String> connection = Connection.fromParts(a.stream, b.sink);

      b.stream.pipe(a.sink);

      var transformed = connection.asByteConnection().asStringConnection();

      String answer = await transformed.sendAndReceive("asf");
      expect(answer, 'asf');
    }, tags: "current");
  });
}
