// ignore_for_file: constant_identifier_names

enum ErrorCase {
  NULL_RESPONSE;

  String toJson() => name;

  static ErrorCase fromJson(String json) => values.byName(json);
}
