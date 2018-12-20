import 'dart:html';
import 'package:node_interop/node.dart' hide require;
import 'package:node_interop/path.dart';
import 'package:js/js.dart';
import 'package:angular/angular.dart';
import 'package:blackbird_electron/src/app_component.template.dart' as ng;
import 'package:angular_router/angular_router.dart';
import 'main.template.dart' as self;

@GenerateInjector(
  routerProvidersHash, // You can use routerProviders in production
)
final InjectorFactory injector = self.injector$Injector;

void main() {
  runApp(ng.AppComponentNgFactory, createInjector: injector);
}
