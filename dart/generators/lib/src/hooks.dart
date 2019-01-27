import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'package:source_gen_helpers/class/class_visitor.dart';
import 'package:source_gen_helpers/class/util.dart';
import 'package:source_gen_helpers/class/output_visitor.dart';
import 'package:source_gen_helpers/class/override_visitor.dart';

import 'package:blackbird_common/member_identifier.dart';
import 'dart:mirrors';

import 'visitor.dart';

import 'dart:async';

String generateHooks(ClassElement element) {
  Map<String, String> hooks = {};

  //TODO rename? constants?
  hooks['classURL'] =
      '"' + TypeChecker.fromStatic(element.type).toString() + '"';
  hooks['remote'] = '_\$${element.name}Rmi.getRemote';
  hooks['fromJson'] = '_\$${element.name}FromJson';

  String hookMap =
      hooks.map((k, v) => MapEntry(k, '"$k":' + v)).values.join(',');
  return '''
    Map<String, dynamic> get _\$${element.displayName}Hooks {
      return {$hookMap};
    }
  ''';
}
