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

class DeviceVisitor extends BasicDeviceVisitor {
  Future<bool> get isAbstract async =>
      await deviceClassIsAbstract(await classElement);

  visitClassElement(ClassElement element) async {
    super.visitClassElement(element);
    classDeclarationCompleter
        .complete('class _\$${element.name}Device extends ${element.name}');
    //TODO generate error when constructor not available

    String name = element.name;

    // await allVisited.future;
    String implementation;
    if (await isAbstract) {
      implementation =
          'throw new Exception("cannot implement abstract device");';
    } else {
      implementation = '_\$${name}Implementation(this,   dependencies);';
    }

    // TODO not clean regarding constructor
    return '''
      _\$${await className}Device();
      
      $name implementation(Map<Symbol, Object> dependencies) 
        => $implementation
      @override
      Object invoke(Invocation invocation) =>
          throw new Exception('no invocation on devices');
      Provision provideRemote(Context context) =>
          throw new Exception('no RMI on devices');
      $name getRemote(Context context, String uuid) =>
          throw new Exception('no RMI on devices');
      @override
      Map<String, dynamic> serialize() => _\$${name}ToJson(this);
      static ${name} deserialize(Map json) => _\$${name}FromJson(json);
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

  Future<String> get _bbhook async =>
      'blackbird.interfaceDevice<${(await classElement).name}>(this).';

  @override
  FutureOr<String> visitExecutiveMethod(MethodElement element) async {
    String arguments = element.parameters.map((p) => p.name).join(',');
    return '=> ${await _bbhook}${element.displayName}($arguments);';
  }

  @override
  FutureOr<String> visitExecutiveSetter(PropertyAccessorElement element) async {
    String arguments = element.parameters.map((p) => p.name).first;
    return '=> ${await _bbhook}${element.displayName} = $arguments;';
  }

  @override
  FutureOr<String> visitExecutiveGetter(PropertyAccessorElement element) async {
    return '=> ${await _bbhook}${element.displayName};';
  }
}
