import 'dart:async';

import 'package:blackbird/blackbird.dart';
import 'i2c.dart';
import 'package:synchronized/synchronized.dart';
import 'byte_operations.dart';
import 'register_table_device.dart';
part 'mpr121.g.dart';

//TODO abstract Bit operations
class ElectrodeConfig {
  final int chargeCurrent;
  final int chargeTime;
  final int baselineValue;
  final int touchThreshold;
  final int releaseThreshold;
  ElectrodeConfig(this.chargeCurrent, this.chargeTime, this.baselineValue,
      this.touchThreshold, this.releaseThreshold);
}

class Electrode {
  final MPR121 mpr;
  final int electrode;
  Electrode(this.mpr, this.electrode);

  get enabled async =>
      (await mpr.readRegister(Register.ECR) & 0x0F) - 1 > electrode;

  get touchStatus => mpr.readBit(Register.TS1, electrode);

  get electrodeFilteredData =>
      mpr.readOffsetRegister(Register.E0FDL, 2, electrode, 2);

  get baseLineValue async =>
      await mpr.readOffsetRegister(Register.E0BV, 1, electrode, 1) << 2;
  setBaseLineValue(int value) =>
      mpr.writeOffsetRegister(Register.E0BV, 1, electrode, 1, value >> 2);

  get touchThreshold => mpr.readOffsetRegister(Register.E0TTH, 2, electrode, 1);
  setTouchThreshold(int value) =>
      mpr.writeOffsetRegister(Register.E0TTH, 2, electrode, 1, value);

  get releaseThreshold =>
      mpr.readOffsetRegister(Register.E0RTH, 2, electrode, 1);
  setReleaseThreshold(int value) =>
      mpr.writeOffsetRegister(Register.E0RTH, 2, electrode, 1, value);

  get chargeCurrent => mpr.readOffsetRegister(Register.CDC0, 1, electrode, 1);
  setChargeCurrent(int value) =>
      mpr.writeOffsetRegister(Register.CDC0, 1, electrode, 1, value);

  get chargeTime =>
      mpr.readBits(Register.CDT01 + electrode ~/ 2, (electrode % 2) * 4, 3);
  setChargeTime(int value) => mpr.writeBits(
      Register.CDT01 + (electrode / 2).floor(), (electrode % 2) * 4, 3, value);

  get outOfRangeStatus =>
      mpr.readBit(Register.OORS1 + electrode ~/ 8, electrode % 8);

  Future<void> loadConfig(ElectrodeConfig config) async {
    await mpr.stopModeOperation(() async {
      await setChargeCurrent(config.chargeCurrent);
      await setChargeTime(config.chargeTime);
      await setBaseLineValue(config.baselineValue);
      await setTouchThreshold(config.touchThreshold);
      await setReleaseThreshold(config.releaseThreshold);
    });
  }

  Stream<Transition> get change => mpr.touchEvent
      .where((e) => e.electrode == electrode)
      .map((e) => e.transition);

  Stream<void> get released => change.where((e) => e.isTouched);

  Stream<void> get touched => change.where((e) => e.isReleased);
}

/// Not considered / implemented:
///  - OVCF, over-current flag, 5.2
///  - GPIO
abstract class MPR121 extends I2CSlave with RegisterTableDevice {
  MPR121._() : super.extender();
  factory MPR121() => _$MPR121Device();
  static MPR121 getRemote(Context context, String uuid) =>
      _$MPR121Rmi.getRemote(context, uuid);

  /// Register can only be written while in stop mode
  /// Stop mode means no cap sense active, ECR = 0
  /// Datasheet 5.1
  Future<void> stopModeOperation(Future<void> operation()) async {
    int ecr = await readRegister(Register.ECR);
    await super.writeRegister(Register.ECR, 0x00);
    await operation();
    await super.writeRegister(Register.ECR, ecr);
  }

  // Future<void> writeRegister(int register, int value) async {
  //   if (register == Register.ECR || register == Register.SRST) {
  //     super.writeRegister(register, value);
  //   } else {
  //     stopModeOperation(() => super.writeRegister(register, value));
  //   }
  // }

  // Future<void> writeRegisters(int register, List<int> values) async {
  //   // TODO error on ECR write
  //   stopModeOperation(() => super.writeRegisters(register, values));
  // }

  /// Reads two consecutive registers (given register address and the following)
  /// The following address is considered the MSB
  Future<int> read16Bit(int register) async {
    int lsb = await readRegister(register);
    int msb = await readRegister(register + 1);
    int value = (msb << 8) + lsb;
    return value;
  }

  /// Writes two consecutive registers (given register address and the following)
  /// The following address is considered the MSB
  Future<void> write16Bit(int register, int value) async {
    writeRegister(register, value & 0xFF);
    writeRegister(register + 1, (value >> 8) & 0xFF);
  }

  Future<int> readOffsetRegister(
    int baseRegister,
    int registerSkip,
    int offset,
    int registerWidth,
  ) async {
    var registers = await readRegisters(
        baseRegister + offset * registerSkip, registerWidth);

    int result = 0;
    for (int i = 0; i < registerWidth; i++)
      result = result + (registers[i] << (8 * i));
    return result;
  }

  Future<void> writeOffsetRegister(int baseRegister, int registerSkip,
      int offset, int registerWidth, int value) async {
    List<int> values = [];
    for (int i = 0; i < registerWidth; i++)
      values.add((value >> (8 * i)) & 0xFF);

    await writeRegisters(baseRegister + offset * registerSkip, values);
  }

  get touchDebounce => readBitBlock(BitBlocks.DT);
  setTouchDebounce(int value) => writeBitBlock(BitBlocks.DT, value);

  get releaseDebounce => readBitBlock(BitBlocks.DT);
  setReleaseDebounce(int value) => writeBitBlock(BitBlocks.DR, value);

  /// 00 Encoding 0 - Sets samples taken to 6 (Default)
  /// 01 Encoding 1 - Sets samples taken to 10
  /// 10 Encoding 2 - Sets samples taken to 18
  /// 11 Encoding 3 - Sets samples taken to 34
  get firstFilterIterations => readBitBlock(BitBlocks.FFI);
  setFirstFilterIterations(int value) => writeBitBlock(BitBlocks.FFI, value);

  /// Charge Discharge Current - Selects the global value of charge discharge current applied to
  /// electrode. The maximum is 63 μA, 1 μA step.
  /// 000000 Encoding 0 - Disable Electrode Charging
  /// 000001 Encoding 1 - Sets the current to 1 μA
  /// 010000 Encoding 16 - Sets the current to 16 μA (Default)
  /// 111111 Encoding 63 - Sets the current to 63 μA
  get chargeDischargeCurrent => readBitBlock(BitBlocks.CDC);
  setChargeDischargeCurrent(int value) => writeBitBlock(BitBlocks.CDC, value);

  /// Charge Discharge Time - Selects the global value of charge time applied to electrode.
  /// The maximum is 32 μs, programmable as 2 ^(n-2) μs.
  /// 000 Encoding 0 - Disables Electrode Charging
  /// 001 Encoding 1 - Time is set to 0.5 μs (Default)
  /// 010 Encoding 2 - Time is set to 1 μs
  /// 111 Encoding 7 - Time is set to 32 μs
  get chargeDischargeTime => readBitBlock(BitBlocks.CDT);
  setChargeDischargeTime(int value) => writeBitBlock(BitBlocks.CDT, value);

  /// Second Filter Iterations - Selects the number of samples taken for the second level filter
  /// 00 Encoding 0 - Number of samples is set to 4 (Default)
  /// 01 Encoding 1 - Number of samples is set to 6
  /// 10 Encoding 2 - Number of samples is set to 10
  /// 11 Encoding 3 - Number of samples is set to 18
  get secondFilterIterations => readBitBlock(BitBlocks.SFI);
  setSecondFilterIterations(int value) => writeBitBlock(BitBlocks.SFI, value);

  /// Electrode Sample Interval - Selects the period between samples used for the second level
  /// of filtering. The maximum is 128ms, Programmable to 2^n ms
  /// 000 Encoding 0 - Period set to 1 ms
  /// 001 Encoding 1 - Period set to 2 ms
  /// 100 Encoding 4 - Period set to 16 ms (Default)
  /// 111 Encoding 7 - Period set to 128 ms
  get electrodeSampleInterval => readBitBlock(BitBlocks.ESI);
  setElectrodeSampleInterval(int value) => writeBitBlock(BitBlocks.ESI, value);

  /// Calibration Lock - Controls the baseline tracking and how the baseline initial value is loaded
  /// 00 - Baseline tracking enabled, initial baseline value is current value in baseline value register (Default)
  /// 01 - Baseline tracking is disabled
  /// 10 - Baseline tracking enabled, initial baseline value is loaded with the 5 high bits of the first 10-bit electrode data value
  /// 11 - Baseline tracking enabled, initial baseline value is loaded with all 10 bits of the first electrode data value
  get calibrationLock => readBitBlock(BitBlocks.CL);
  setCalibrationLock(int value) => writeBitBlock(BitBlocks.CL, value);

  /// Proximity Enable - Controls the operation of 13th Proximity Detection
  /// 00 - Proximity Detection is disabled (Default)
  /// 01 - Run Mode with ELE0~ELE1 combined for proximity detection enabled
  /// 10 - Run Mode with ELE0~ELE3 combined for proximity detection enabled
  /// 11 - Run Mode with ELE0~ELE11combined for proximity detection enabled
  get proximityEnable => readBitBlock(BitBlocks.ELEPROX_EN);
  setProximityEnable(int value) => writeBitBlock(BitBlocks.ELEPROX_EN, value);

  /// Electrode Enable - Controls the operation of 12 electrodes detection
  /// 0000 - Electrode detection is disabled (Default)
  /// 0001 - Run Mode with ELE0 for electrode detection enabled
  /// 0010 - Run Mode with ELE0~ ELE1 for electrode detection enabled
  /// ...
  get electrodeEnable => readBitBlock(BitBlocks.ELE_EN);
  setElectrodeEnable(int value) => writeBitBlock(BitBlocks.ELE_EN, value);

  get autoConfigurationFailFlag async => await readBitBlock(BitBlocks.ACFF) > 0;
  get autoReconfigurationFailflag async =>
      await readBitBlock(BitBlocks.ARFF) > 0;

  Future<void> softReset() => writeRegister(Register.SRST, 0x63);

  @Ignore()
  Electrode electrode(int index) => new Electrode(this, index);

  get touchStatus async => await read16Bit(Register.TS1) & 0x7FFF;

  int _lastTouchStatus;
  Stream<TouchEvent> _touchEventStream;
  Stream<TouchEvent> get touchEvent {
    if (_touchEventStream == null) _setupTouchEventStream();
    return _touchEventStream;
  }

  _setupTouchEventStream() {
    touchStatus.then((ts) => _lastTouchStatus = ts);

    var sc = new StreamController<TouchEvent>();
    _touchEventStream = sc.stream.asBroadcastStream();

    commonInterrupt.listen((data) async {
      int ts = await touchStatus;
      if (_lastTouchStatus != null) {
        int difference = _lastTouchStatus ^ ts;
        if (difference != 0) {
          for (int i = 0; i < 13; i++) {
            if (difference & (1 << i) > 0) {
              sc.sink.add(TouchEvent(i, Transition.forBool(ts & (1 << i) > 0)));
            }
          }
        }
      }

      _lastTouchStatus = ts;
    });
  }
}

class Address {
  static const GND = 0x5A;
  static const VDD = 0x5B;
  static const SDA = 0x5C;
  static const SCL = 0x5D;
}

//TODO const or final
const int PROXIMITY_ELECTRODE = 12;

class Register {
// touch and OOR statuses
  static const TS1 = 0x00;
  static const TS2 = 0x01;
  static const OORS1 = 0x02;
  static const OORS2 = 0x03;

  static const E0FDL = 0x04;
  static const E0FDH = 0x05;
  static const E1FDL = 0x06;
  static const E1FDH = 0x07;
  static const E2FDL = 0x08;
  static const E2FDH = 0x09;
  static const E3FDL = 0x0A;
  static const E3FDH = 0x0B;
  static const E4FDL = 0x0C;
  static const E4FDH = 0x0D;
  static const E5FDL = 0x0E;
  static const E5FDH = 0x0F;
  static const E6FDL = 0x10;
  static const E6FDH = 0x11;
  static const E7FDL = 0x12;
  static const E7FDH = 0x13;
  static const E8FDL = 0x14;
  static const E8FDH = 0x15;
  static const E9FDL = 0x16;
  static const E9FDH = 0x17;
  static const E10FDL = 0x18;
  static const E10FDH = 0x19;
  static const E11FDL = 0x1A;
  static const E11FDH = 0x1B;
  static const E12FDL = 0x1C;
  static const E12FDH = 0x1D;

  static const E0BV = 0x1E;
  static const E1BV = 0x1F;
  static const E2BV = 0x20;
  static const E3BV = 0x21;
  static const E4BV = 0x22;
  static const E5BV = 0x23;
  static const E6BV = 0x24;
  static const E7BV = 0x25;
  static const E8BV = 0x26;
  static const E9BV = 0x27;
  static const E10BV = 0x28;
  static const E11BV = 0x29;
  static const E12BV = 0x2A;

  static const MHDR = 0x2B;
  static const NHDR = 0x2C;
  static const NCLR = 0x2D;
  static const FDLR = 0x2E;

  static const MHDF = 0x2F;
  static const NHDF = 0x30;
  static const NCLF = 0x31;
  static const FDLF = 0x32;

  static const NHDT = 0x33;
  static const NCLT = 0x34;
  static const FDLT = 0x35;

  static const MHDPROXR = 0x36;
  static const NHDPROXR = 0x37;
  static const NCLPROXR = 0x38;
  static const FDLPROXR = 0x39;

  static const MHDPROXF = 0x3A;
  static const NHDPROXF = 0x3B;
  static const NCLPROXF = 0x3C;
  static const FDLPROXF = 0x3D;

  static const NHDPROXT = 0x3E;
  static const NCLPROXT = 0x3F;
  static const FDLPROXT = 0x40;

  static const E0TTH = 0x41;
  static const E0RTH = 0x42;
  static const E1TTH = 0x43;
  static const E1RTH = 0x44;
  static const E2TTH = 0x45;
  static const E2RTH = 0x46;
  static const E3TTH = 0x47;
  static const E3RTH = 0x48;
  static const E4TTH = 0x49;
  static const E4RTH = 0x4A;
  static const E5TTH = 0x4B;
  static const E5RTH = 0x4C;
  static const E6TTH = 0x4D;
  static const E6RTH = 0x4E;
  static const E7TTH = 0x4F;
  static const E7RTH = 0x50;
  static const E8TTH = 0x51;
  static const E8RTH = 0x52;
  static const E9TTH = 0x53;
  static const E9RTH = 0x54;
  static const E10TTH = 0x55;
  static const E10RTH = 0x56;
  static const E11TTH = 0x57;
  static const E11RTH = 0x58;
  static const E12TTH = 0x59;
  static const E12RTH = 0x5A;

  static const DR = 0x5B;

  static const FGCO0 = 0x5C;
  static const FGCO1 = 0x5D;
  static const ECR = 0x5E;

  static const CDC0 = 0x5F;
  static const CDC1 = 0x60;
  static const CDC2 = 0x61;
  static const CDC3 = 0x62;
  static const CDC4 = 0x63;
  static const CDC5 = 0x64;
  static const CDC6 = 0x65;
  static const CDC7 = 0x66;
  static const CDC8 = 0x67;
  static const CDC9 = 0x68;
  static const CDC10 = 0x69;
  static const CDC11 = 0x6A;
  static const CDCPROX = 0x6B;

  static const CDT01 = 0x6C;
  static const CDT23 = 0x6D;
  static const CDT45 = 0x6E;
  static const CDT67 = 0x6F;
  static const CDT89 = 0x70;
  static const CDT1011 = 0x71;
  static const CDTPROX = 0x72;

  static const CTL0 = 0x73;
  static const CTL1 = 0x74;
  static const DAT = 0x75;
  static const DIR = 0x76;
  static const EN = 0x77;
  static const SET = 0x78;
  static const CLR = 0x79;
  static const TOG = 0x7A;

  static const ACCR0 = 0x7B;
  static const ACCR1 = 0x7C;
  static const USL = 0x7D;
  static const LSL = 0x7E;
  static const TL = 0x7F;

  static const SRST = 0x80;

  static const PWM0 = 0x81;
  static const PWM1 = 0x82;
  static const PWM2 = 0x83;
  static const PWM3 = 0x84;
}

class Transition {
  static const _touched = 0;
  static const _released = 1;
  static const _any = 2;

  static const TOUCHED = Transition._(_touched);
  static const RELEASED = Transition._(_released);
  static const ANY = Transition._(_any);
  factory Transition.forBool(bool touched) {
    return touched ? TOUCHED : RELEASED;
  }

  final int code;
  const Transition._(this.code);

  bool matches(Transition other) {
    return this == other || this == ANY || other == ANY;
  }

  bool get isTouched => this == TOUCHED;
  bool get isReleased => this == RELEASED;

  operator ==(Object other) {
    if (other is! Transition) return false;
    Transition transition = other;
    return transition.code == code;
  }

  @override
  int get hashCode => 42 * code;

  @override
  String toString() {
    if (this == TOUCHED) return 'TOUCHED';
    if (this == RELEASED) return 'RELEASED';
    if (this == ANY) return 'ANY';
    return 'INVALID';
  }
}

class TouchEvent {
  final num electrode;

  final Transition transition;

  TouchEvent(this.electrode, this.transition);

  @override
  String toString() => 'TouchEvent[$electrode, $transition]';
}

class BitBlocks {
  static const DR = BitBlock(0x5B, 4, 3);
  static const DT = BitBlock(0x5B, 0, 3);
  static const FFI = BitBlock(0x5C, 6, 2);
  static const CDC = BitBlock(0x5C, 0, 6);
  static const CDT = BitBlock(0x5D, 5, 3);
  static const SFI = BitBlock(0x5D, 3, 2);
  static const ESI = BitBlock(0x5D, 0, 3);
  static const CL = BitBlock(0x5E, 6, 2);
  static const ELEPROX_EN = BitBlock(0x5E, 4, 2);
  static const ELE_EN = BitBlock(0x5E, 0, 4);
  static const AC_FFI = BitBlock(0x7B, 6, 2);
  static const AC_RETRY = BitBlock(0x7B, 4, 2);
  static const AC_BVA = BitBlock(0x7B, 2, 2);
  static const AC_ARE = BitBlock(0x7B, 1, 1);
  static const AC_ACE = BitBlock(0x7B, 0, 1);
  static const AC_SCTS = BitBlock(0x7C, 7, 1);
  static const AC_OORIE = BitBlock(0x7C, 2, 1);
  static const AC_AARFIE = BitBlock(0x7C, 1, 1);
  static const AC_ACFIE = BitBlock(0x7C, 0, 1);
  static const ACFF = BitBlock(0x03, 6, 1);
  static const ARFF = BitBlock(0x03, 7, 1);
  // static const  = BitBlock(0x);
  // static const  = BitBlock(0x);
  // static const  = BitBlock(0x);
}
