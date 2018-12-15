import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:source_gen/src/utils.dart';

import 'package:source_gen_class_visitor/class_visitor.dart';
import 'package:source_gen_class_visitor/helper.dart';
import 'package:source_gen_class_visitor/output_visitor.dart';
import 'package:source_gen_class_visitor/override_visitor.dart';

List<String> typeList(DartType originalType) {
  ClassElement classElement = originalType.element;
  List<String> types = [];
  while (true) {
    types.add(TypeChecker.fromStatic(classElement.type).toString());
    if (classElement.supertype == null) break;
    classElement = classElement.supertype.element;
  }
  return types;
}
