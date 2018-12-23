import 'package:test/test.dart';
import 'package:source_gen/source_gen.dart';
import 'package:test/test.dart';
import 'dart:async';
import 'package:test/test.dart';

import 'package:source_gen/source_gen.dart';
import 'package:build/build.dart';
import 'package:build_test/build_test.dart';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'dart:io';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:source_gen/source_gen.dart';
import 'package:source_gen_helpers/class/util.dart';
import 'package:front_end/src/fasta/compiler_context.dart';
import 'package:source_gen_helpers/test/generation.dart';

main() {
  group('', () {
    Map<String, ClassElement> classElements;
    setUpAll(() async {
      classElements = await loadClassesFromFile(
          '../../../dart/source_gen_helpers/lib/test/test_classes.dart');
    });
    test('number of children, FullClass', () async {
      ClassElement ce = classElements['PartiallyImplemented'];

      // print(ce.constructors);
      // print(ce.type);
      // print(ce.accessors);
      // print(ce.fields);
      // print('///////');
      // print(ce.type.constructors);
      // print(ce.type.methods);
      // print(ce.type.accessors);
      // print('///////');
      // print(ce.lookUpInheritedConcreteMethod('simpleMethod', ce.library));
      // print(ce.lookUpInheritedConcreteMethod('otherMethod', ce.library));

      // list.forEach((e) => print('${e.name} ${isAbstract(e)}'));
    });
  }, tags: 'current');
}
