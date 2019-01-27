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

class DeviceVisitor extends BasicDeviceVisitor<String> {
  Future<bool> get isAbstract async =>
      await deviceClassIsAbstract(await classElement);

  visitClassElement(ClassElement element) async {
    super.visitClassElement(element);

    _checkDeviceClass(element);

    classDeclarationCompleter.complete((await isAbstract ? 'abstract ' : '') +
        'class _\$${element.name}Device extends ${element.name}');
    //TODO generate error when constructor not available

    String name = element.name;

    String implementation;
    String serialization;
    if (await isAbstract) {
      implementation =
          'throw new Exception("cannot implement abstract device");';
      serialization = '';
    } else {
      implementation = '_\$${name}Implementation(this,   dependencies);';
      serialization = '''
        @override
        Map<String, dynamic> toJson() => _\$${name}ToJson(this);
      ''';
    }

    // TODO not clean regarding constructor
    return '''
      _\$${await className}Device() : super._();

      Host get host => throw new Exception('only implementation objects are hosted');

      $name implementation(Map<Symbol, Object> dependencies) 
        => $implementation
      @override
      Object invoke(Invocation invocation) =>
          throw new Exception('no invocation on devices');
      Provision provideRemote(Context context) =>
          throw new Exception('no RMI on devices');
      $name getRemote(Context context, String uuid) =>
          throw new Exception('no RMI on devices');
      get hooks => _\$${await className}Hooks;
      $serialization
    ''';
  }

  @override
  FutureOr<String> visitConstructorElement(ConstructorElement element) => null;

  @override
  FutureOr<String> visitPropertySetter(PropertyAccessorElement element) => null;
  @override
  FutureOr<String> visitPropertyGetter(PropertyAccessorElement element) => null;
  @override
  FutureOr<String> visitPropertyMethod(MethodElement element) => null;
  @override
  FutureOr<String> visitPropertyField(FieldElement element) => null;

  @override
  FutureOr<String> visitModuleField(FieldElement element) {
    return '''
      ${element.type.name} ${element.displayName};
    ''';
  }

  @override
  FutureOr<String> visitModuleGetter(PropertyAccessorElement element) => null;
  @override
  FutureOr<String> visitModuleSetter(PropertyAccessorElement element) => null;
  @override
  FutureOr<String> visitRuntimeGetter(PropertyAccessorElement element) {
    return "=> throw new Exception('cannot get runtime dependencys on device representation');";
  }

  // Future<String> get _bbhook async =>
  // '(await blackbird.interfaceDevice<${(await classElement).name}>(this)).';

  @override
  FutureOr<String> visitExecutiveMethod(MethodElement element) async {
    if (element.name == 'getRemote')
      return null; //TODO this is a bandaid solution
    String arguments = element.parameters.map((p) => p.name).join(',');
    return ' => throw new Exception("you cannot execute stuff on devices");';
    // return '=> ${await _bbhook}${element.displayName}($arguments);';
  }

  @override
  FutureOr<String> visitExecutiveSetter(PropertyAccessorElement element) async {
    String arguments = element.parameters.map((p) => p.name).first;
    return ' => throw new Exception("you cannot execute stuff on devices");';
    // return '=> ${await _bbhook}${element.displayName} = $arguments;';
  }

  @override
  FutureOr<String> visitExecutiveGetter(PropertyAccessorElement element) async {
    return ' => throw new Exception("you cannot execute stuff on devices");';
    // return '=> ${await _bbhook}${element.displayName};';
  }
}

_checkDeviceClass(ClassElement element) {
  var getRemote =
      element.methods.where((e) => e.name == 'getRemote' && e.isStatic);

  if (getRemote.isEmpty) {
    log.severe('''No getRemote-method for $element, add the following \n
        static ${element.displayName} getRemote(Context context, String uuid) =>
          _\$${element.displayName}Rmi.getRemote(context, uuid);
    ''');
  }
}
