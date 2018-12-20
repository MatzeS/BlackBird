import 'package:angular_router/angular_router.dart';

import 'route_paths.dart';
import 'socket/socket_component.template.dart' as socket_template;

export 'route_paths.dart';

class Routes {
  static final socket = RouteDefinition(
    routePath: RoutePaths.socket,
    component: socket_template.SocketComponentNgFactory,
  );

  static final all = <RouteDefinition>[
    socket,
  ];
}
