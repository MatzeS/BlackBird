List<T> distinct<T>(Iterable<T> original) {
  List<T> result = [];
  original.forEach((e) {
    if (!result.contains(e)) result.add(e);
  });
  return result;
}
