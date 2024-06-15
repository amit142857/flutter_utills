/// Adds extension to Duration
extension ExtensionOnDuration on Duration {
  /// Formats Duration to given pattern
  ///
  /// pattern:
  ///
  ///   H/h = hour
  ///
  ///   M/m = minute
  ///
  ///   S/s = second
  ///
  /// pattern is case insensitive
  String format(String pattern) {
    pattern = pattern.replaceAllMapped(
      RegExp(r'(H+)', caseSensitive: false),
      (match) {
        return (inHours % 24).toString().padLeft(match.group(0)!.length, '0');
      },
    );
    pattern = pattern.replaceAllMapped(
      RegExp(r'(M+)', caseSensitive: false),
      (match) {
        return (inMinutes % 60).toString().padLeft(match.group(0)!.length, '0');
      },
    );
    pattern = pattern.replaceAllMapped(
      RegExp(r'(S+)', caseSensitive: false),
      (match) {
        return (inSeconds % 60).toString().padLeft(match.group(0)!.length, '0');
      },
    );

    return pattern;
  }
}
