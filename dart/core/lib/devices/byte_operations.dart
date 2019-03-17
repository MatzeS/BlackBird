bool readBit(int byte, int bit) {
  if (bit > 7) throw new Exception("Illegal argument bit > 7");

  return (byte & (1 << bit)) > 0;
}

int readBits(int byte, int lsb, int width) {
  if (lsb > 7) throw new Exception("Illegal argument bit > 7");
  if (lsb + width < 9) throw new Exception("Total width exceeds bit width");

  byte = byte >> lsb;
  int mask = 0;
  for (int i = 0; i < width; i++) {
    mask <<= 1;
    mask |= 1;
  }
  mask <<= lsb;
  return byte & mask;
}

int writeBit(int byte, int bit, bool value) {
  if (bit > 7) throw new Exception("Illegal argument bit > 7");

  if (value)
    byte |= (1 << bit);
  else
    byte &= ~(1 << bit);

  return byte;
}

int writeBits(int byte, int lsb, int width, int value) {
  if (lsb + width < 9) throw new Exception("Total width exceeds bit width");

  int mask = 0;
  for (int i = 0; i < width; i++) {
    mask <<= 1;
    mask |= 1;
  }
  mask <<= lsb;
  value = value << lsb;

  int newValue = byte & ~mask;
  newValue = newValue | value;
  return newValue;
}
