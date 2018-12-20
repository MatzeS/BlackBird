import 'package:angular_router/angular_router.dart';

import 'route_paths.dart';
import 'socket/socket_component.template.dart' as socket_template;
import 'dashboard/dashboard.template.dart' as dashboard_template;

export 'route_paths.dart';

class Routes {
  static final socket = RouteDefinition(
    routePath: RoutePaths.socket,
    component: socket_template.SocketComponentNgFactory,
  );
  static final dashboard = RouteDefinition(
    routePath: RoutePaths.dashboard,
    component: dashboard_template.DashboardComponentNgFactory,
  );
  static final all = <RouteDefinition>[
    dashboard,
    socket,
    RouteDefinition.redirect(
      path: '',
      redirectTo: RoutePaths.dashboard.toUrl(),
    ),
  ];
}
