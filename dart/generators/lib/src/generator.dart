import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:source_gen/src/utils.dart';

import 'package:source_gen_helpers/class/class_visitor.dart';
import 'package:source_gen_helpers/class/util.dart';
import 'package:source_gen_helpers/class/output_visitor.dart';
import 'package:source_gen_helpers/class/override_visitor.dart';
import 'device_class.dart';
import 'implementation_class.dart';
import 'package:blackbird_common/member_identifier.dart';
import 'package:tuple/tuple.dart';
import 'package:blackbird_common/member_identifier.dart';
//TODO check for no arg construcotr

Builder builder(BuilderOptions options) =>
    new SharedPartBuilder([new DeviceGenerator(options)], 'blackbird_device');

class DeviceGenerator extends Generator {
  BuilderOptions options;
  DeviceGenerator(this.options);

  bool elementFilter(Element element) {
    if (TypeChecker.fromUrl("asset:blackbird/lib/src/device.dart#Device")
        .isExactly(element)) return false;

    // if (isAnnotatedWith<Device>(element)) return true;
    if (TypeChecker.fromUrl("asset:blackbird/lib/src/device.dart#Ignore")
        .annotationsOf(element)
        .isNotEmpty) return false;

    if (!TypeChecker.fromUrl("asset:blackbird/lib/src/device.dart#Device")
        .isAssignableFrom(element)) return false;

    if (element is ClassElement && element.isMixin) return false;

    if (deviceClassIsAbstract(element)) return false;

    return true;
  }

  @override
  generate(LibraryReader library, BuildStep buildStep) async {
    var futures = library.allElements
        .where(elementFilter)
        .map((e) async => await generateForElement(e))
        .toList();
    var result = await Future.wait(futures);
    return result.join('\n\n');
  }

  generateForElement(Element pElement) async {
    ClassElement ce = pElement as ClassElement;

    List<ExecutableElement> executables = <ExecutableElement>[]
        .followedBy(ce.accessors)
        .followedBy(ce.methods)
        .followedBy(ce.allSupertypes.expand((e) => e.accessors))
        .followedBy(ce.allSupertypes.expand((e) => e.methods))
        .where((e) => e.isPublic && !e.isStatic)
        .where((e) {
          var c = e.enclosingElement as ClassElement;
          return c.supertype != null &&
              !TypeChecker.fromUrl('asset:blackbird/lib/src/device.dart#Device')
                  .isExactly(c) &&
              !TypeChecker.fromUrl(
                      'package:rmi/remote_method_invocation.dart#RmiTarget')
                  .isExactly(c) &&
              !TypeChecker.fromUrl('package:rmi/invoker.dart#Invocable')
                  .isExactly(c);
        })
        .where((e) => e.metadata.every((a) {
              return a.constantValue != null
                  ? !TypeChecker.fromUrl(
                          'asset:blackbird/lib/src/device.dart#Ignore')
                      .isAssignableFromType(a.constantValue.type)
                  : true;
            }))
        .where((e) {
          if (e.enclosingElement is! ClassElement) return true;
          ClassElement classElement = e.enclosingElement as ClassElement;
          return !classElement.type.isObject;
        })
        .where((e) => e == lookUpMostConcrete(e, ce))
        .toList();

    var fields = ce.fields.where((e) => e.isPublic && !e.isStatic).toList();

    DeviceVisitor deviceVisitor = new DeviceVisitor();
    OverrideClassVisitor deviceOverride =
        new OverrideClassVisitor(deviceVisitor);
    OutputClassVisitor deviceOutput = new OutputClassVisitor(deviceOverride);

    ImplementationVisitor implementationVisitor = new ImplementationVisitor();
    OverrideClassVisitor implementationOverride =
        new OverrideClassVisitor(implementationVisitor);
    OutputClassVisitor implementationOutput =
        new OutputClassVisitor(implementationOverride);

    await deviceOutput.visitClassElement(ce);
    await visitElements(deviceOutput, executables);
    await visitElements(deviceOutput, fields);

    if (!await deviceVisitor.isAbstract) {
      await implementationOutput.visitClassElement(ce);
      await visitElements(implementationOutput, executables);
      await visitElements(implementationOutput, fields);
    }
    // TODO constructor handling
    // if (!classvisitor.foundNoArgConstructor) {
    //   log.severe('${classElement} must have a no argument constructor');
    // }

    StringBuffer output = new StringBuffer();
    output.write(await deviceOutput.output);
    if (!await deviceVisitor.isAbstract) {
      output.write(await implementationOutput.output);
    }
    return output.toString();
  }
}
