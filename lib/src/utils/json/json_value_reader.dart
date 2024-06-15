import 'dart:convert';

/// JsonValueReader
///
/// Used with JsonKey of JsonSerializable
/// ```dart
/// @JsonKey(readValue: JsonValueReader.___)
/// ```
class JsonValueReader {
  JsonValueReader._();

  /// Reads ```map[key]``` and returns Json object
  static decodeJson(Map map, String key, [dynamic data]) {
    if (map[key] is! String) return map[key];

    try {
      return jsonDecode(map[key]);
    } catch (e) {
      return {};
    }
  }

  /// Reads value if only one key exists
  ///```dart
  /// @JsonSerializable(explicitToJson: true)
  /// class Model{
  ///   Model(this.field);
  ///
  ///   @JsonKey(readValue: JsonValueReader.decodeJsonUptoSingleKey)
  ///   final field;
  ///
  ///   factory Model.fromJson(Map<String, dynamic> json) =>_$ModelFromJson(json);
  /// }
  ///
  /// void main(){
  ///   final model = Model.fromJson({'field': {'a': 'value'}});
  ///   final field = model.field // value
  /// }
  ///```
  static decodeJsonUptoSingleKey(Map map, String key, [dynamic data]) {
    final field = map[key] ?? map;

    if (field is! Map) return field;

    if (field.keys.length == 1) {
      return field[field.keys.first];
    }
    return field[key];
  }

  /// Reads value of given path from ```map```
  ///```dart
  /// @JsonSerializable(explicitToJson: true)
  /// class Model{
  ///   Model(this.field);
  ///
  ///   static _readAs(map, key) => JsonValueReader.getFromPath(map, key, 'a.b.c')
  ///
  ///   @JsonKey(readValue: _readAs)
  ///   final field;
  ///
  ///   factory Model.fromJson(Map<String, dynamic> json) =>_$ModelFromJson(json);
  /// }
  ///
  /// void main(){
  ///   final model = Model.fromJson({'a':{'b':{'c': 'value'}}});
  ///   final field = model.field // value
  /// }
  ///```

  static getFromPath(Map map, String key, [dynamic data]) {
    assert(data == null || (data is String && data.toString().isNotEmpty));

    data ??= key;
    return _getValueFromDotPath(map, key, data);
  }

  /// Flattens list of map to map
  ///```dart
  /// @JsonSerializable(explicitToJson: true)
  /// class Model{
  ///   Model(this.field);
  ///
  ///   @JsonKey(readValue: JsonValueReader.flattenListOfMapToMap)
  ///   final field;
  ///
  ///   factory Model.fromJson(Map<String, dynamic> json) =>_$ModelFromJson(json);
  /// }
  ///
  /// void main(){
  ///   final model = Model.fromJson({'field':[{1: 1, 2: 2}, {3: 3}, {4: 4, 5:5}]});
  ///   final field = model.field // {1:1, 2:2, 3:3, 4:4, 5:5}
  /// }
  ///```
  static flattenListOfMapToMap(Map map, String key, [dynamic data]) =>
      (map[key] as List).fold<Map<String, dynamic>>(
        {},
        (map, item) => map..addAll(item),
      );

  /// Adds all map fields to this key
  ///```dart
  /// @JsonSerializable(explicitToJson: true)
  /// class Model{
  ///   Model(this.field);
  ///
  ///   @JsonKey(readValue: JsonValueReader.collectAll)
  ///   final field;
  ///
  ///   factory Model.fromJson(Map<String, dynamic> json) =>_$ModelFromJson(json);
  /// }
  ///
  /// void main(){
  ///   final model = Model.fromJson({'a':1, 'b': 2, 'c': 3});
  ///   final field = model.field // {'a':1, 'b': 2, 'c': 3}
  /// }
  ///```
  static collectAll(Map map, String key, [dynamic data]) => map;

  /// Adds all map fields except in data to this key
  ///```dart
  /// @JsonSerializable(explicitToJson: true)
  /// class Model{
  ///   Model(this.field);
  ///
  ///   static _readAs(map, key) => JsonValueReader.collectWithout(map, key, ['b', 'c'])
  ///   @JsonKey(readValue: _readAs)
  ///   final field;
  ///
  ///   factory Model.fromJson(Map<String, dynamic> json) =>_$ModelFromJson(json);
  /// }
  ///
  /// void main(){
  ///   final model = Model.fromJson({'a':1, 'b': 2, 'c': 3});
  ///   final field = model.field // {'a':1}
  /// }
  ///```
  static collectWithout(Map map, String key, [dynamic data]) {
    assert(data == null || (data is List<String> && data.isNotEmpty));

    data ??= [];

    return Map<String, dynamic>.fromEntries(
      map.entries
          .where(
            (element) => !data.contains(element.key),
          )
          .cast(),
    );
  }

  /// Adds all map fields except in data to this key
  ///```dart
  /// @JsonSerializable(explicitToJson: true)
  /// class Model{
  ///   Model(this.field);
  ///
  ///   // if data empty returns map[key]
  ///   // else looks for value in given paths
  ///   static _readAs(map, key) => JsonValueReader.selectFrom(map, key, ['b.k', 'c.k'])
  ///   @JsonKey(readValue: _readAs)
  ///   final field;
  ///
  ///   factory Model.fromJson(Map<String, dynamic> json) =>_$ModelFromJson(json);
  /// }
  ///
  /// void main(){
  ///   final model = Model.fromJson({'a':1, 'b': {'k; 'value'}, 'c': {'k; 'value'}});
  ///   final field = model.field // value
  /// }
  ///```

  static selectFrom(Map map, String key, [dynamic data]) {
    assert(data == null || (data is List<String> && data.isNotEmpty));

    data ??= [key];

    for (var path in data) {
      final value = _getValueFromDotPath(map, key, path);
      if (value != null) return value;
    }

    return null;
  }

  ////
  static dynamic _getValueFromDotPath(Map map, String key, [dynamic data]) {
    final keys = data.split('.');

    dynamic value = map;

    for (final k in keys) {
      value = value[k];
      if (value == null) return null;
    }

    return value;
  }
}
