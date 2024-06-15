/// Adds extension to number (int and double) to make duration
extension NumberToDurationExtension on num {
  /// Returns Duration with given microseconds
  Duration get us => Duration(microseconds: round());

  /// Returns Duration with given milliseconds
  Duration get ms => (this * 1000).us;

  /// Returns Duration with given seconds
  Duration get s => (this * 1000 * 1000).us;

  /// Returns Duration with given minutes
  Duration get m => (this * 1000 * 1000 * 60).us;

  /// Returns Duration with given hours
  Duration get h => (this * 1000 * 1000 * 60 * 60).us;

  /// Returns Duration with given days
  Duration get d => (this * 1000 * 1000 * 60 * 60 * 24).us;
}
