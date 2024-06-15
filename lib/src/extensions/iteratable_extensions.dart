/// Adds Extensions to Iteratable<T>
extension ExtensionOnIterable<E> on List<E> {
  /// Adds indexedMap to Iteratable
  Iterable<T> indexedMap<T>(T Function(int index, E element) convert) sync* {
    var index = 0;
    for (var element in this) {
      yield convert(index++, element);
    }
  }
}
