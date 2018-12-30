import 'package:test/test.dart';

abstract class Base {
  int something();
}

mixin Overrider {
  int something() {
    return 2;
  }
}

class Extender extends Base with Overrider {}

main() {
  test('', () {
    print(new Extender().something());
  });
}
