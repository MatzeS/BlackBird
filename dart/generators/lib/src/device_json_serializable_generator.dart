import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:source_gen/src/utils.dart';

import 'package:source_gen_helpers/class/class_visitor.dart';
import 'package:source_gen_helpers/class/util.dart';
import 'package:source_gen_helpers/class/output_visitor.dart';
import 'package:source_gen_helpers/class/override_visitor.dart';

import 'package:blackbird_common/member_identifier.dart';
import 'package:json_serializable/json_serializable.dart';

Builder builder(BuilderOptions options) => new SharedPartBuilder(
    [new DeviceJsonSerializableGenerator(options)],
    'device_json_serializable_builder');

class DeviceJsonSerializableGenerator extends Generator {
  //TODO i thorught we had somehting in sourcegen for this
  BuilderOptions options;
  DeviceJsonSerializableGenerator(this.options);

  bool elementFilter(Element element) {
    //TODO replace URLs

    if (!TypeChecker.fromUrl("asset:blackbird/lib/src/device.dart#Device")
        .isAssignableFrom(element)) return false;
    if (TypeChecker.fromUrl("asset:blackbird/lib/src/device.dart#Device")
        .isExactly(element)) return false;
    if (TypeChecker.fromUrl("asset:blackbird/lib/src/device.dart#Ignore")
        .annotationsOf(element)
        .isNotEmpty) return false;

    if (deviceClassIsAbstract(element as ClassElement)) return false;

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

  bool filter(FieldElement f) {
    if (!f.isPublic) return false;
    if (f.name.contains('blackbird')) return false;

    return isProperty(f.getter ?? f.setter) &&
        (f.getter ?? f.setter).isSynthetic;
  }

  generateForElement(Element pElement) async {
    ClassElement element = pElement as ClassElement;

    return generateFromExternal(element, filter);
  }
}
