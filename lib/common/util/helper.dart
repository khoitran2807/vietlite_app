Map handleNullableMapKey(Map json, String key) {
  return json[key] ?? <String, dynamic>{};
}
