import 'dart:convert';

import 'json_value_reader.dart';

/// Common json utils
class JsonUtils {
  JsonUtils._();

  /// Converts [object] to JSON string
  ///
  /// Same as jsonEncode from dart:convert
  static encodeJson(Object? object) {
    try {
      return jsonEncode(object);
    } catch (e) {
      return '';
    }
  }

  /// Parses ```map[key]``` and returns Json object
  static decodeJson(Map map, String key) =>
      JsonValueReader.decodeJson(map, key);
}
