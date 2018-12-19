@JS()
library typescript;

import "package:js/js.dart";
import "package:func/func.dart";

/// Type definitions for serialport 7.0
/// Project: https://github.com/EmergingTechnologyAdvisors/node-serialport
/// Definitions by: Jeremy Foster <https://github.com/codefoster>
/// Andrew Pearson <https://github.com/apearson>
/// Definitions: https://github.com/DefinitelyTyped/DefinitelyTyped

/// <reference types="node" />
@JS()
class SerialPort extends Duplex {
  // @Ignore
  SerialPort.fakeConstructor$() : super.fakeConstructor$();
  /*external factory SerialPort(String path, [ErrorCallback callback]);*/
  /*external factory SerialPort(String path, [OpenOptions options, ErrorCallback callback]);*/
  external factory SerialPort(String path,
      [OpenOptions callback_options, callback]);
  external num get baudRate;
  external set baudRate(num v);
  external SerialPort.BaseBinding get binding;
  external set binding(SerialPort.BaseBinding v);
  external bool get isOpen;
  external set isOpen(bool v);
  external String get path;
  external set path(String v);
  external void open([ErrorCallback callback]);
  external void update(SerialPort.UpdateOptions options,
      [ErrorCallback callback]);
  /*external bool write(String|List<num>|Buffer data, [void callback(dynamic error, num bytesWritten)]);*/
  /*external bool write(String|List<num>|Buffer buffer, ['ascii'|'utf8'|'utf16le'|'ucs2'|'base64'|'binary'|'hex' encoding, void callback(dynamic error, num bytesWritten)]);*/
  external bool write(dynamic /*String|List<num>|Buffer*/ data_buffer,
      [dynamic /*VoidFunc2<dynamic, num>|'ascii'|'utf8'|'utf16le'|'ucs2'|'base64'|'binary'|'hex'*/ callback_encoding,
      void callback(dynamic error, num bytesWritten)]);
  external dynamic /*String|Buffer|Null*/ read([num size]);
  external void close([void callback(Error error)]);
  external void JS$set(SerialPort.SetOptions options, [ErrorCallback callback]);
  external void JS$get([ModemBitsCallback callback]);
  external void flush([ErrorCallback callback]);
  external void drain([ErrorCallback callback]);
  external SerialPort pause();
  external SerialPort resume();
  external SerialPort on(String event, void callback([dynamic data]));
  external static SerialPort.BaseBinding get Binding;
  external static set Binding(SerialPort.BaseBinding v);
  external static Promise<List<SerialPort.PortInfo>> list(
      [ListCallback callback]);
}

// Module SerialPort
/// Callbacks Type Defs
typedef void ErrorCallback(Error error);
typedef void ModemBitsCallback(Error error,
    dynamic /*{cts: boolean, dsr: boolean, dcd: boolean }*/ status);
typedef void ListCallback(Error error, List<dynamic> port);

/// Options Type Defs
@anonymous
@JS()
abstract class OpenOptions {
  external bool get autoOpen;
  external set autoOpen(bool v);
  external get baudRate;
  external set baudRate(v);
  external factory OpenOptions({bool autoOpen, baudRate});
}

// End module SerialPort
@anonymous
@JS()
abstract class UpdateOptions {
  external get baudRate;
  external set baudRate(v);
  external factory UpdateOptions({baudRate});
}

@anonymous
@JS()
abstract class SetOptions {
  external bool get brk;
  external set brk(bool v);
  external bool get cts;
  external set cts(bool v);
  external bool get dsr;
  external set dsr(bool v);
  external bool get dtr;
  external set dtr(bool v);
  external bool get rts;
  external set rts(bool v);
  external factory SetOptions(
      {bool brk, bool cts, bool dsr, bool dtr, bool rts});
}

@anonymous
@JS()
abstract class PortInfo {
  external String get comName;
  external set comName(String v);
  external String get manufacturer;
  external set manufacturer(String v);
  external String get serialNumber;
  external set serialNumber(String v);
  external String get pnpId;
  external set pnpId(String v);
  external String get locationId;
  external set locationId(String v);
  external String get productId;
  external set productId(String v);
  external String get vendorId;
  external set vendorId(String v);
  external factory PortInfo(
      {String comName,
      String manufacturer,
      String serialNumber,
      String pnpId,
      String locationId,
      String productId,
      String vendorId});
}

// Module parsers
@JS("parsers.ByteLength")
class ByteLength extends Transform {
  // @Ignore
  ByteLength.fakeConstructor$() : super.fakeConstructor$();
  external factory ByteLength(dynamic /*{length: number}*/ options);
}

@JS("parsers.CCTalk")
class CCTalk extends Transform {
  // @Ignore
  CCTalk.fakeConstructor$() : super.fakeConstructor$();
  external factory CCTalk();
}

@JS("parsers.Delimiter")
class Delimiter extends Transform {
  // @Ignore
  Delimiter.fakeConstructor$() : super.fakeConstructor$();
  external factory Delimiter(
      dynamic /*{delimiter: string | Buffer | number[], includeDelimiter?: boolean}*/ options);
}

@JS("parsers.Readline")
class Readline extends Delimiter {
  // @Ignore
  Readline.fakeConstructor$() : super.fakeConstructor$();
  external factory Readline(
      dynamic /*{delimiter: string | Buffer | number[], encoding?: 'ascii'|'utf8'|'utf16le'|'ucs2'|'base64'|'binary'|'hex'}*/ options);
}

@JS("parsers.Ready")
class Ready extends Transform {
  // @Ignore
  Ready.fakeConstructor$() : super.fakeConstructor$();
  external factory Ready(
      dynamic /*{delimiter: string | Buffer | number[]}*/ options);
}

@JS("parsers.Regex")
class Regex extends Transform {
  // @Ignore
  Regex.fakeConstructor$() : super.fakeConstructor$();
  external factory Regex(dynamic /*{regex: RegExp}*/ options);
}

// End module parsers
/// Binding Type Defs
/*type win32Binding = BaseBinding;*/
/*type darwinBinding = BaseBinding;*/
/*type linuxBinding = BaseBinding;*/
/// Binding Type Def
@JS()
class BaseBinding {
  // @Ignore
  BaseBinding.fakeConstructor$();
  external factory BaseBinding(dynamic options);
  external Promise<dynamic> open(String path, OpenOptions options);
  external Promise<dynamic> close();
  external Promise<dynamic> read(Buffer data, num offset, num length);
  external Promise<dynamic> write(Buffer data);
  external Promise<dynamic> update([UpdateOptions options]);
  external Promise<dynamic> JS$set([SetOptions options]);
  external Promise<dynamic> JS$get();
  external Promise<dynamic> flush();
  external Promise<dynamic> drain();
  external static Promise<List<PortInfo>> list();
}

/* WARNING: export assignment not yet supported. */

