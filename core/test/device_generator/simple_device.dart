import 'dart:async';
import 'package:test/test.dart';
import 'package:rmi/proxy.dart';
import 'package:rmi/remote_method_invocation.dart';

import 'package:source_gen/source_gen.dart';
import 'package:build/build.dart';
import 'package:build_test/build_test.dart';

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:source_gen/src/utils.dart';

import 'package:source_gen_class_visitor/class_visitor.dart';
import 'package:source_gen_class_visitor/helper.dart';
import 'package:source_gen_class_visitor/output_visitor.dart';
import 'package:source_gen_class_visitor/override_visitor.dart';
import 'package:blackbird/device.dart';
import 'package:blackbird/blackbird.dart';

part 'simple_device.g.dart';

class SomeAnnotation {
  final String someValue;
  final Map<String, int> complexvalue;
  const SomeAnnotation(this.someValue, this.complexvalue);
  bool someMethod() => complexvalue.containsKey('asdf');

  operator ==(Object other) {
    if (other is! SomeAnnotation) return false;
    SomeAnnotation another = other as SomeAnnotation;
    if (another.someValue != someValue) return false;
    if (!another.complexvalue.keys
        .toSet()
        .containsAll(this.complexvalue.keys.toSet())) ;
    if (!this
        .complexvalue
        .keys
        .toSet()
        .containsAll(another.complexvalue.keys.toSet())) ;
    if (!another.complexvalue.keys
        .every((k) => another.complexvalue[k] == this.complexvalue[k]))
      return false;

    return true;
  }
}

abstract class SimpleDevice implements Device {
  int aProperty;

  // @Property() TODO
  // int get calculatedProperty => aProperty + 1;

  Device otherDevice;

  @SomeAnnotation('text', {'asdf': 123})
  int get aRuntimeDependency;

  void executiveMethod() {}
  int get executiveGetter {}
  set executiveSetter(int value) {}

  SimpleDevice._();
  factory SimpleDevice.device() => new _$SimpleDeviceDevice();
}
