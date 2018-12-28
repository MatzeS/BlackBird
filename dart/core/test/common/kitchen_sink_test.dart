import 'package:test/test.dart';
import 'package:source_gen_helpers/test/generation.dart';
import 'package:test/test.dart';
import 'dart:async';
import 'package:test/test.dart';

import 'package:source_gen/source_gen.dart';
import 'package:build/build.dart';
import 'package:build_test/build_test.dart';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'dart:io';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:source_gen/source_gen.dart';
import 'package:source_gen_helpers/class/util.dart';
import 'package:front_end/src/fasta/compiler_context.dart';
import 'package:blackbird_common/member_identifier.dart';
import 'kitchen_sink_device.dart';

main() {
  group('', () {
    Map<String, ClassElement> classElements;
    setUpAll(() async {
      var g = new Generation();
      await g.generate({
        'blackbird|lib/blackbird.dart':
            await new File('lib/blackbird.dart').readAsString(),
        'blackbird|lib/src/device.dart':
            await new File('lib/src/device.dart').readAsString(),
        'pkg|lib/test_classes.dart':
            await new File('test/common/kitchen_sink_device.dart')
                .readAsString(),
      });
      classElements = g.classElements;
    });

    test('', () {
      ClassElement kitchenSinkDevice = classElements['KitchenSinkDevice'];

      kitchenSinkDevice.accessors.where((e) => !e.isSynthetic).forEach((e) {
        String expectedType;
        expectedType = e.metadata
            .where((a) => a.toString().contains('ExpectAs'))
            .single
            .computeConstantValue()
            .getField('expected')
            .toString();

        DeviceMemberType type;
        try {
          type = identify(e);
        } on Exception catch (exception) {
          if (expectedType.contains('Illegal')) {
            //thrown some exceptoin, which is correct
          } else {
            fail('identify fails $e with $exception');
          }
        }

        if (type != null) {
          DeviceMemberType expected;
          if (expectedType.contains('Property')) {
            expected = DeviceMemberType.property;
          } else if (expectedType.contains('Runtime')) {
            expected = DeviceMemberType.runtime;
          } else if (expectedType.contains('Executive')) {
            expected = DeviceMemberType.executive;
          } else if (expectedType.contains('SubModule')) {
            expected = DeviceMemberType.submodule;
          } else if (expectedType.contains('Ignore')) {
            expected = DeviceMemberType.ignored;
          } else if (expectedType.contains('Illegal')) {
            fail('identified as $type although Illegal expected');
          } else
            throw new Exception(
                'cannot identify expected device member type, $e, $type');

          expect(type, expected, reason: '$e');
        }
      });
    });
  }, tags: 'current');
}
