import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import '../source_gen/output_visitor.dart';
import '../source_gen/helper.dart';
import '../../blackbird.dart';

import 'dart:async';

class SuperVisitor extends ThrowingElementVisitor<Future<String>> {
  ClassElement classElement;
  SuperVisitor(this.classElement);

  String _output;

  get output {
    return _output;
  }

  @override
  visitConstructorElement(ConstructorElement element) async {
    if (element.isFactory) return '';
    //todo exactly one no arg constructor and public

    String name = classElement.name;

    _output = '''
    class _\$$name implements Device {
      _\$$name();

      $name implementation() => throw new Exception();
      $name getRemote(Context context, String uuid) => 
        _\$${name}Rmi.getRemote(context, uuid);
      $name interface() => Blackbird().interfaceDevice(this);

      @override
      Object invoke(Invocation invocation) =>
          _\$${name}Invoker.invoke(invocation, this);
      Provision provideRemote(Context context) =>
          _\$${name}Rmi.provideRemote(context, this);

    }
    ''';
  }

  @override
  visitMethodElement(MethodElement element) {}
  @override
  visitPropertyAccessorElement(PropertyAccessorElement element) {}
  @override
  visitFieldElement(FieldElement element) {}
}
