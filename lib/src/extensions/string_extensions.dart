/// Adds extesnions to String
extension ExtensionOnString on String {
  /// Converts string to title case.
  ///
  /// ```dart
  /// 'ABC'.toTitleCase(); // 'Abc'
  /// 'abc'.toTitleCase(); // 'Abc'
  /// 'Abc'.toTitleCase(); // 'Abc'
  /// 'abc abc abc'.toTitleCase(); // 'Abc Abc Abc'
  /// ```
  String toTitleCase() {
    if (isEmpty) return '';

    final splits = split(' ');
    for (var i = 0; i < splits.length; i++) {
      splits[i] =
          '${splits[i][0].toUpperCase()}${splits[i].substring(1).toLowerCase()}';
    }
    return splits.join(' ');
  }
}

/// Extensions on Nullable String
extension ExtensionOnNullableString on String? {
  /// Return a true if the string is null or empty
  bool get isNullOrEmpty => this == null || this!.isEmpty;
}
