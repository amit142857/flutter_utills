import 'dart:convert';

/// Adds Extensions to Map
extension ExtensionOnMap on Map<String, dynamic> {
  /// Formats Map<String, dynamic> to preety json
  String prettify([int indent = 4]) {
    final encoder = JsonEncoder.withIndent(' ' * indent);
    return encoder.convert(this);
  }
}
