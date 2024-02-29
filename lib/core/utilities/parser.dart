/// Try parse [object] from json data
T? parseJson<T>(
    ({
      T? Function(Map<String, dynamic>?) fromJson,
      Map<String, dynamic>? json,
    }) model) {
  if (model.json == null) return null;
  return model.fromJson(model.json);
}

/// Try parse [List Object] from json list data
///
/// 	Return [] when json = null
List<T?> parseListJson<T>(
    ({
      T? Function(Map<String, dynamic>?) fromJson,
      List<Map<String, dynamic>>? listJson
    }) model) {
  if (model.listJson == null) {
    return [];
  }
  return model.listJson!.map((json) => model.fromJson(json)).toList();
}

/// FNV-1a 64bit hash algorithm
int fastHash(String string) {
  var hash = 0xcbf29ce484222325;

  var i = 0;
  while (i < string.length) {
    final codeUnit = string.codeUnitAt(i++);
    hash ^= codeUnit >> 8;
    hash *= 0x100000001b3;
    hash ^= codeUnit & 0xFF;
    hash *= 0x100000001b3;
  }

  return hash;
}
