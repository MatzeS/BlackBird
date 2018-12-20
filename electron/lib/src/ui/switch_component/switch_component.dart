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
import 'dart:html';
import 'dart:async';

//TODO two way binding
@Component(
  selector: 'ui-switch',
  styleUrls: [
    'switch_component.css',
  ],
  templateUrl: 'switch_component.html',
  directives: [
    MaterialButtonComponent,
    MaterialIconComponent,
    MaterialToggleComponent,
    NgIf
  ],
  exports: [],
)
class SwitchComponent {
  bool checked = true;
  bool disabled = false;
  bool reverse = false;

  @Input('size')
  String size = 'medium';

  @Input('checked-label')
  String checkedLabel = '';

  @Input('unchecked-label')
  String uncheckedLabel = '';

  @Input('switch-on-color')
  String switchOnColor = 'rgb(100, 189, 99)';

  @Input('switch-off-color')
  String switchOffColor = '#fff';

  String get switchColor => checked ? switchOnColor : switchOffColor;

  @Input('border-color')
  String borderColor = '#dfdfdf';
  @Input('dot-color')
  String dotColor = '#fff';

  StreamController<bool> _change = new StreamController();
  Stream<bool> _changeBroadcast;
  StreamController<MouseEvent> _changeEvent = new StreamController();
  Stream<MouseEvent> _changeEventBroadcast;

  SwitchComponent() {
    _changeBroadcast = _change.stream.asBroadcastStream();
    _changeEventBroadcast = _changeEvent.stream.asBroadcastStream();
  }

  @Output()
  Stream<bool> get change => _changeBroadcast;
  @Output()
  Stream<MouseEvent> get changeEvent => _changeEventBroadcast;

  @HostListener('click', ['\$event'])
  onToggle(MouseEvent event) {
    if (disabled) {
      return;
    }
    checked = !checked;

    _change.sink.add(checked);
    _changeEvent.sink.add(event);
  }
}
