import 'package:blackbird/blackbird.dart';
import 'common.dart';
import 'byte_operations.dart' as B;

// part 'register_table_device.g.dart';

class BitBlock {
  final int register;
  final int firstBit;
  final int width;

  const BitBlock(this.register, this.firstBit, this.width);
}

mixin RegisterTableDevice {
  Future<void> writeRegisters(int register, List<int> values);
  Future<List<int>> readRegisters(int register, int length);

  Future<int> readRegister(int register) =>
      readRegisters(register, 1).then((l) => l.single);
  Future<void> writeRegister(int register, int value) =>
      writeRegisters(register, [value]);

  Future<bool> readBit(int register, int bit) async =>
      B.readBit(await readRegister(register), bit);
  Future<int> writeBit(int register, int bit, bool value) async =>
      B.writeBit(await readRegister(register), bit, value);

  Future<int> readBits(int register, int firstBit, int width) async =>
      B.readBits(await readRegister(register), firstBit, width);
  Future<int> writeBits(
          int register, int firstBit, int width, int value) async =>
      B.writeBits(await readRegister(register), firstBit, width, value);

  Future<int> readBitBlock(BitBlock bitBlock) =>
      readBits(bitBlock.register, bitBlock.firstBit, bitBlock.width);
  Future<void> writeBitBlock(BitBlock bitBlock, int value) =>
      writeBits(bitBlock.register, bitBlock.firstBit, bitBlock.width, value);
}
