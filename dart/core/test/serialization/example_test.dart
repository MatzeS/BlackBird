import 'package:json_annotation/json_annotation.dart';
import 'package:blackbird/blackbird.dart';
part 'example_test.g.dart';

enum SomeEnum { a, b, c, d }

@JsonSerializable()
class Simple {
  int anInteger;
  String anString;
  SomeEnum e;
}

@JsonSerializable()
class Other {
  int anInteger;
  Simple simple;
}
