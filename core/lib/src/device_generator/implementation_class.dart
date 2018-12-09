import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import '../source_gen/output_visitor.dart';
import '../source_gen/helper.dart';
import '../../blackbird.dart';
import 'visitor.dart';

import 'dart:async';

class ImplementationVisitor extends BasicDeviceVisitor {
  ImplementationVisitor(ClassElement element) : super(element);

  visitClassElement(ClassElement element) {
    classDeclaration.complete(
        'class _\$${element.name}Implementation extends ${element.name}');
    return '''
    final ${element.name} device;
    ''';
  }

  @override
  visitConstructorElement(ConstructorElement element) async {
    super.visitConstructorElement(element);
    if (element.isFactory) return '';

    String arguments = generateArgumentDeclarations(element);
    String argumentNames =
        element.parameters.map((p) => '${p.name}').join(', ');

    return '''
      _\$${await className}Implementation($arguments) : super($argumentNames);
    ''';
    //TOOD runtime dependencies
  }

  @override
  FutureOr<String> visitPropertySetter(PropertyAccessorElement element) {
    return "throw new Exception('cannot set device property after construction');";
  }

  @override
  FutureOr<String> visitPropertyGetter(PropertyAccessorElement element) {
    //This one passes through to the actual class, so no override
    return '';
  }

  @override
  FutureOr<String> visitRuntimeGetter(PropertyAccessorElement element) {
    return "throw new Exception('cannot get runtime dependencys on device representation');";
  }

  @override
  FutureOr<String> visitRuntimeSetter(PropertyAccessorElement element) {
    return "throw new Exception('cannot set runtime dependencys (especially not on device representation)');";
  }

  @override
  FutureOr<String> visitExecutiveMethod(MethodElement element) =>
      _delegateExecutive(element);
  @override
  FutureOr<String> visitExecutiveSetter(PropertyAccessorElement element) =>
      _delegateExecutive(element);
  @override
  FutureOr<String> visitExecutiveGetter(PropertyAccessorElement element) =>
      _delegateExecutive(element);

  _delegateExecutive(element) {
    String arguments = element.parameters.map((p) => p.name).join(',');
    return 'Blackbird().interfaceDevice(this).${element.displayName}($arguments);';
  }
}
