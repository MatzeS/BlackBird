import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import '../test.dart';

@Component(
  selector: 'socket-control',
  styleUrls: ['socket_component.css'],
  templateUrl: 'socket_component.html',
  directives: [
    MaterialCheckboxComponent,
    MaterialFabComponent,
    MaterialIconComponent,
    materialInputDirectives,
    NgFor,
    NgIf,
    MaterialToggleComponent,
  ],
)
class SocketComponent implements OnInit {
  @override
  Future<Null> ngOnInit() async {}

  bool loaded = false;
  change(dynamic event) async {
    print('$event');
    if (!loaded) await load();
    loaded = true;
    toggle();
  }
}
