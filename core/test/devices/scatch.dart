// abstract class A {
//   int get asdf;
//   String get implAttr;
//   A._();
//   factory A.device(int a) => _$ADevice(a);
//   factory A.impl(A device, String impl) => _$AImpl(device, impl);
// }

// class _$ADevice extends A {
//   int get asdf => 3;
//   _$ADevice(int a) : super._();
//   String get implAttr => null;
// }

// class _$AImpl extends A {
//   int get asdf => 3;
//   _$AImpl(A device, impl) : super._();
//   String get implAttr => 'imp';
// }

// abstract class B extends A {
//   String get other;
//   B._() : super._();
//   factory B.device(Map param) => _$BDevice(param);
//   factory B.impl(Map param) => _$BImpl(param);
// }

// class _$BDevice extends B {
//   A _aDelegate;
//   _$BDevice(Map m) : super._() {
//     _aDelegate = A.device(m['a']);
//   }

//   @override
//   int get asdf => 3;
//   @override
//   String get other => null;
//   @override
//   String get implAttr => null;
// }

// class _$BImpl extends B {
//   _$BImpl(Map m) : super._() {
//     _aDelegate = A.impl(this, 'a');
//   }

//   A _aDelegate;

//   @override
//   int get asdf => 3;
//   @override
//   String get other => null;
//   @override
//   String get implAttr => null;
// }

// class WithGeneric<P> {
//   bool check(Type x) {
//     // print(P);
//     // print(x);
//     // return P is x;
//   }
// }

// class Checker extends WithGeneric<B> {}

import 'dart:mirrors';
import 'package:front_end/src/fasta/kernel/kernel_shadow_ast.dart';
import 'package:front_end/src/fasta/type_inference/interface_resolver.dart';
import 'package:front_end/src/fasta/type_inference/type_schema_environment.dart';
import 'package:kernel/ast.dart';
import 'package:kernel/class_hierarchy.dart';
import 'package:kernel/core_types.dart';
import 'package:kernel/testing/mock_sdk_component.dart';
import 'package:kernel/type_algebra.dart';
import 'package:test/test.dart';

const String test = 'well some test';

class Annotation {
  const Annotation();
  void osmeMeth() {
    print('this is an annno print');
  }
}

class A {
  @test
  @Annotation()
  int asdf = 3;
}

class B extends A {}

main() {
  B b = new B();
  // ClassMirror classMirror = im.type;

  // ClassMirror
  // classMirror.metadata.forEach((metadata) {
  //   print(metadata.reflectee.who); // -> akira
  //   print(metadata.reflectee.what); // -> add something
  // });

  // VariableMirror
  // for (MethodMirror variable in classMirror.instanceMembers.values) {
  //   // if ()
  //   print(variable.simpleName);
  //   print(variable.metadata.length);
  //   // print(variable); // -> do something
  // }

  // classMirror.superclass.declarations.keys.forEach(print);
  ClassMirror classMirror = reflectClass(B);
  VariableMirror x = classMirror.superclass.declarations[#asdf];
  InstanceMirror anno = x.metadata[0];
  InstanceMirror annosecond = x.metadata[1];
  print(annosecond.toString());
  Annotation a = annosecond.reflectee as Annotation;
  a.osmeMeth();
  print(annosecond.reflectee.runtimeType);
  // print(x);
  // classMirror.declarations.keys.forEach(print);

  // classMirror.getField(fieldName)

  // MethodMirror
  // classMirror.methods.values.forEach((MethodMirror method) {
  //   print(method.metadata.first.reflectee.who); // -> kitano
  //   print(method.metadata.first.reflectee.what); // -> change the name
  // });
}
