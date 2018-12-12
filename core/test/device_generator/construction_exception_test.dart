import 'package:test/test.dart';
import 'package:blackbird/device.dart';
import 'simple_device.dart';

int significantNumber = 123456789;

main() {
  group('device', () {
    SimpleDevice device = SimpleDevice.device();

    ConstructionInfoException constructionInfoException;
    try {
      device.implementation(null);
    } on ConstructionInfoException catch (e) {
      constructionInfoException = e;
    }
    test('thrown', () {
      expect(constructionInfoException, isNotNull);
    });
    test('equal map key sets', () {
      constructionInfoException.types.keys
          .toSet()
          .containsAll(constructionInfoException.annotations.keys);
      constructionInfoException.annotations.keys
          .toSet()
          .containsAll(constructionInfoException.types.keys);
    });
    test('has correct types', () {
      expect(constructionInfoException.types.length, 3);
      expect(constructionInfoException.types[#host], Host);
      expect(constructionInfoException.types[#aRuntimeDependency], int);
      expect(constructionInfoException.types[#otherDevice], Device);
    });
    test('has correct annotations', () {
      expect(constructionInfoException.annotations.length, 3);
      expect(constructionInfoException.annotations[#host].length, 1);
      expect(
          constructionInfoException.annotations[#aRuntimeDependency].length, 1);
      expect(constructionInfoException.annotations[#otherDevice].length, 0);
    });
    test('annotation transferred correctly', () {
      expect(constructionInfoException.annotations[#aRuntimeDependency].first,
          SomeAnnotation('text', {'asdf': 123}));
    });
  });
}
