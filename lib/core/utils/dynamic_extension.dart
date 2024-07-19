extension DynamicExtension on Map? {
  String getString(String key) => this?[key] ?? '';

  num getNumber(String key) => this?[key] ?? 0;

  bool getBoolean(String key) => this?[key] ?? false;

  List<String> getList<T>(String key) => this?[key]?.cast<String>() ?? [];
}
