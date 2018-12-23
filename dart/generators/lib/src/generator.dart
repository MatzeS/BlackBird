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
import 'package:source_gen_helpers/util.dart';
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

    if (TypeChecker.fromUrl("asset:blackbird/lib/src/device.dart#Device")
        .isAssignableFrom(element)) return true;

    return false;
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
    ClassElement classElement = pElement as ClassElement;

    // SuperVisitor superVisitor = SuperVisitor(element);
    // element.visitChildren(superVisitor); //todo replace with sueprvisitor.accept

    DeviceVisitor deviceVisitor = new DeviceVisitor();
    OverrideClassVisitor deviceOverride =
        new OverrideClassVisitor(deviceVisitor);
    OutputClassVisitor deviceOutput = new OutputClassVisitor(deviceOverride);

    ImplementationVisitor implementationVisitor = new ImplementationVisitor();
    OverrideClassVisitor implementationOverride =
        new OverrideClassVisitor(implementationVisitor);
    OutputClassVisitor implementationOutput =
        new OutputClassVisitor(implementationOverride);

    List<Element> elements = [];
    elements.addAll(allClassMember(classElement));
    elements = elements.where((e) => e.isPublic).toList();

    //TODO refine
    bool where(ClassMemberElement e) =>
        e.enclosingElement.supertype != null &&
        !TypeChecker.fromUrl('asset:blackbird/lib/src/device.dart#Device')
            .isExactly(e.enclosingElement) &&
        !TypeChecker.fromUrl(
                'package:rmi/remote_method_invocation.dart#RmiTarget')
            .isExactly(e.enclosingElement) &&
        !TypeChecker.fromUrl('package:rmi/invoker.dart#Invocable')
            .isExactly(e.enclosingElement);
    elements = elements
        .where((e) => e.metadata.every((a) {
              return a.constantValue != null
                  ? !TypeChecker.fromUrl(
                          'asset:blackbird/lib/src/device.dart#Ignore')
                      .isAssignableFromType(a.constantValue.type)
                  : true;
            }))
        .toList();
    elements = elements.where((e) {
      if (e.enclosingElement is! ClassElement) return true;
      ClassElement classElement = e.enclosingElement as ClassElement;
      return !classElement.type.isObject;
    }).toList();
    elements =
        elements.where((e) => e is! ClassMemberElement || where(e)).toList();

    elements = filterConcreteElements(classElement, elements);

    await deviceOutput.visitClassElement(classElement);
    await visitElements(deviceOutput, elements);

    if (!await deviceVisitor.isAbstract) {
      await implementationOutput.visitClassElement(classElement);
      await visitElements(implementationOutput, elements);
    }
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
