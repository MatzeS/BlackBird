import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'package:source_gen_class_visitor/class_visitor.dart';
import 'package:source_gen_class_visitor/helper.dart';
import 'package:source_gen_class_visitor/output_visitor.dart';
import 'package:source_gen_class_visitor/override_visitor.dart';

import 'dart:mirrors';

import 'visitor.dart';

import 'dart:async';

class DeviceVisitor extends BasicDeviceVisitor {
  DeviceVisitor(ClassElement element) : super(element);

  visitClassElement(ClassElement element) async {
    classDeclaration
        .complete('class _\$${element.name}Device extends ${element.name}');
    //TODO generate error when constructor not available

    String name = element.name;
    // TODO not clean regarding constructor
    return '''
      _\$${await className}Device();
      
      $name implementation(Map<Symbol, Object> dependencies) 
        => _\$${name}Implementation(this,   dependencies);
      @override
      Object invoke(Invocation invocation) =>
          _\$${name}Invoker.invoke(invocation, this);
      Provision provideRemote(Context context) =>
          _\$${name}Rmi.provideRemote(context, this);
      $name getRemote(Context context, String uuid) =>
        _\$${name}Rmi.getRemote(context, uuid);
    ''';
  }

  @override
  FutureOr<String> visitConstructorElement(ConstructorElement element) => '';

  @override
  FutureOr<String> visitPropertySetter(PropertyAccessorElement element) => '';
  @override
  FutureOr<String> visitPropertyGetter(PropertyAccessorElement element) => '';
  @override
  FutureOr<String> visitPropertyField(FieldElement element) {
    return '''
      ${element.type.name} ${element.displayName};
    ''';
  }

  @override
  FutureOr<String> visitModuleField(FieldElement element) {
    return '''
      ${element.type.name} ${element.displayName};
    ''';
  }

  @override
  FutureOr<String> visitModuleGetter(PropertyAccessorElement element) => '';
  @override
  FutureOr<String> visitModuleSetter(PropertyAccessorElement element) => '';
  @override
  FutureOr<String> visitRuntimeGetter(PropertyAccessorElement element) {
    return "=> throw new Exception('cannot get runtime dependencys on device representation');";
  }

  @override
  FutureOr<String> visitExecutiveMethod(MethodElement element) {
    String arguments = element.parameters.map((p) => p.name).join(',');
    return '=> blackbird.interfaceDevice(this).${element.displayName}($arguments);';
  }

  @override
  FutureOr<String> visitExecutiveSetter(PropertyAccessorElement element) {
    String arguments = element.parameters.map((p) => p.name).first;
    return '=> blackbird.interfaceDevice(this).${element.displayName} = $arguments;';
  }

  @override
  FutureOr<String> visitExecutiveGetter(PropertyAccessorElement element) =>
      '=> blackbird.interfaceDevice(this).${element.displayName};';
}
