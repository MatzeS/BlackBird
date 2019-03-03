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
      Host localA = Host();
      localA.address = "localhost";
      localA.port = 2000;
      localA.name = 'Host A';
      Host localB = Host();
      localB.address = "localhost";
      localB.port = 2002;
      localB.name = 'Host B';

      Blackbird blackbirdA = new Blackbird(localA);
      // ADevice testDeviceA = ADevice();
      // testDeviceA.identifier = 'A';
      // blackbirdA.cluster.devices.add(testDeviceA);

      Blackbird blackbirdB = new Blackbird(localB);
      ADevice testDeviceB = ADevice();
      testDeviceB.identifier = 'B';
      blackbirdB.cluster.devices.add(testDeviceB);

      blackbirdA.registerHooks(testDeviceB);
      blackbirdB.registerHooks(testDeviceB);

      localB = await blackbirdB.interfaceDevice(localB);
      testDeviceB = await blackbirdB.interfaceDevice(testDeviceB);
      testDeviceB.executive("localizer");
      expect(testDeviceB.blackbird.localDevice, localB);
      expect(localB.blackbird.localDevice, localB);

      blackbirdA.cluster.devices.add(localB);
      blackbirdB.cluster.devices.add(localA);

      // expect(testDeviceA, testDeviceB);
      // expect(testDeviceA.hashCode, testDeviceB.hashCode);

      Host handleOfHostBOnA = await blackbirdA.interfaceDevice(localB);

      // expect(localB.name, handleOfHostBOnA.name);

      await handleOfHostBOnA.something('test');

      ADevice remoteDeviceB =
          await handleOfHostBOnA.getRemoteHandle(testDeviceB);

      // expect(testDeviceA.blackbird.localDevice, localA);

      expect(remoteDeviceB, isNotNull);

      await remoteDeviceB.executive("some");
    }, tags: "current");
  });
}
