import 'package:angular/angular.dart';
import 'package:angular_components/app_layout/material_persistent_drawer.dart';
import 'package:angular_components/content/deferred_content.dart';
import 'package:angular_components/material_button/material_button.dart';
import 'package:angular_components/material_icon/material_icon.dart';
import 'package:angular_components/material_list/material_list.dart';
import 'package:angular_components/material_list/material_list_item.dart';
import 'package:angular_components/material_toggle/material_toggle.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:blackbird_electron/src/ui/switch_component/switch_component.dart';
import 'package:blackbird_electron/src/test.dart';

@Component(
  selector: 'socket-card',
  styleUrls: [
    'socket_card_component.css',
    'package:angular_components/css/mdc_web/card/mdc-card.scss.css'
  ],
  templateUrl: 'socket_card_component.html',
  directives: [
    MaterialButtonComponent,
    MaterialIconComponent,
    MaterialToggleComponent,
    SwitchComponent
  ],
  exports: [],
)
class SocketCardComponent implements OnInit {
  @ViewChild(SwitchComponent)
  SwitchComponent toggleSwitch;

  SocketCardComponent() {}

  ngOnInit() {}
  void a() {
    toggle();
  }
}
