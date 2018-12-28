import 'package:rmi/rmi.dart';
import 'package:blackbird/blackbird.dart';
import 'main.dart';

part 'device.g.dart';

/// Declares a class member as a device property
///
/// A device property is anything configurable and non-runtime specific
/// For example the adress or information how to connect to the device
/// This information has to be serializable
///
/// Properties cannot be changed as long as
/// the device's implementation object exists in the cluster.
///
/// TODO serializing properties
/// TODO testcase
class Property {
  const Property();
}

/// Declares a class member as a runtime dependency
///
/// Runtime dependencies are injected when the implementation is created
/// They are provided by a [DependencyBuilder] and may be used by
/// executive methods. A typical example is a connection interface.
class Runtime {
  final bool isAbstract;
  const Runtime({this.isAbstract = false});
}

/// Declares a class member as a executive element
///
/// An executive element is the code run on the implementation object.
/// It uses the injected runtime dependencies to provide high level
/// device functionality.
class Executive {
  const Executive();
}

/// TODO
class SubModule {
  const SubModule();
}

///TODO
// class SuperModule {
//   const SuperModule();
// }

/// Excludes a class member from device interpertation
///
/// No code generation will be applied for this member
class Ignore {
  const Ignore();
}

/// The root device class
///
/// TODO write documentation
///
/// Make it aware of its object kind, device/implementation/proxy
abstract class Device implements RmiTarget {
  Device();

  @Ignore()
  Blackbird _blackbird;

  /// The blackbird instance the device object is associated with
  @Ignore()
  Blackbird get blackbird {
    if (_blackbird == null) {
      throw new Exception('device is not attached to blackbird instance');
    }

    return _blackbird;
  }

  ///TODO add to blackbird cluster, allow for change
  @Ignore()
  set blackbird(Blackbird blackbird) {
    if (blackbird == _blackbird) return;

    if (_blackbird != null) {
      throw new Exception(
          'device already attached to another blackbird instance');
    }

    _blackbird = blackbird;
  }

  /// The host the implementation object is present on, null if not implemented
  /// TODO better error than cannot get runtime dependency on device object
  @Runtime()
  Host get host;

  /// Creates the implementation object
  /// This should not be called or implemented manually
  @Ignore()
  Device implementation(Map<Symbol, Object> dependencies);

  /// Makes the object available for RMI, noted here for the Ignore annotation
  /// This should not be called or implemented manually
  @Ignore()
  Provision provideRemote(Context context);

  /// Invokes RMI calls, noted here for the Ignore annotation
  /// This should not be called or implemented manually
  @Ignore()
  Object invoke(Invocation invocation);

  /// This is required for RMI
  static Device getRemote(Context context, String uuid) =>
      _$DeviceRmi.getRemote(context, uuid);

  ///
  @Ignore()
  Map<String, dynamic> serialize();

//  get hashCode → int, get runtimeType → Type, getRemote(Context context, String uuid) → Device, ==(dynamic other) → bool, toString() → String, noSuchMethod(Invocation invocation) → dynamic, provideRemote(Context context) → Provision, invoke(Invocation invocation) → Object
}

/// A host is a device running a blackbird instance and possibly hosting implementation objects
abstract class Host extends Device {
  Host();
  factory Host.device() => _$HostDevice();

  /// This is required for RMI
  static Host getRemote(Context context, String uuid) =>
      _$HostRmi.getRemote(context, uuid);
}
