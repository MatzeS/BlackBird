import 'package:test/test.dart';
import 'package:blackbird/src/main.dart';
import 'package:blackbird/blackbird.dart';
import 'dart:async';
import 'dart:io';
// part 'remote_handle_test.g.dart';
import 'package:blackbird/devices/example_device.dart';

main() {
  group('', () {
    test('', () async {
      Host localA = Host.device();
      localA.address = "localhost";
      localA.port = 2000;
      Host localB = Host.device();
      localB.address = "localhost";
      localB.port = 2002;

      Blackbird blackbirdA = new Blackbird(localA);
      Blackbird blackbirdB = new Blackbird(localB);

      ADevice testDeviceA = ADevice.device();
      testDeviceA.identifier = 'A';
      blackbirdA.devices.add(testDeviceA);

      ADevice testDeviceB = ADevice.device();
      testDeviceB.identifier = 'B';
      blackbirdB.devices.add(testDeviceB);

      (await blackbirdB.implementDevice(testDeviceB)).executive("local");

      blackbirdA.devices.add(localB);
      blackbirdB.devices.add(localA);

      expect(testDeviceA, testDeviceB);

      Host handleOfBOnA = await blackbirdA.interfaceDevice(localB);
      await handleOfBOnA.something('test');

      ADevice remoteImplementationofB =
          await handleOfBOnA.getRemoteHandle(testDeviceB);
      await remoteImplementationofB.executive("some");
    }, tags: "current");
  });
}
