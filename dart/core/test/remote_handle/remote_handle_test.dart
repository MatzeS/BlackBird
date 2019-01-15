import 'package:test/test.dart';
import 'package:blackbird/src/main.dart';
import 'package:blackbird/blackbird.dart';
import 'dart:async';
import 'dart:io';
part 'remote_handle_test.g.dart';

abstract class ADevice extends Device {
  ADevice();
  factory ADevice.device() => _$ADeviceDevice();

  void executive() {
    print('well this is going well');
  }

  /// This is required for RMI
  static ADevice getRemote(Context context, String uuid) =>
      _$ADeviceRmi.getRemote(context, uuid);
}

class DummyConnection extends Connection {
  @override
  final Stream<String> _input;
  @override
  final StreamSink<String> _output;
  @override
  Stream<String> get input => _input;
  @override
  StreamSink<String> get output => _output;
  DummyConnection(this._input, this._output);
}

main() {
  group('', () {
    test('', () async {
      // ADevice testDevice = ADevice.device();

      Host localA = Host.device();
      localA.address = "localhost";
      localA.port = 2000;
      Host localB = Host.device();
      localB.address = "localhost";
      localB.port = 2002;

      Blackbird blackbirdA = new Blackbird(localA);
      Blackbird blackbirdB = new Blackbird(localB);

      var handle = await blackbirdB.interfaceDevice(localA);
      // handle.something('test');
    });
  });
}
